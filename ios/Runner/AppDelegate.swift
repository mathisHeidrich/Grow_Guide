import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: "com.growguide.ppfd_camera/methods", binaryMessenger: controller.binaryMessenger)
    let eventChannel = FlutterEventChannel(name: "com.growguide.ppfd_camera/events", binaryMessenger: controller.binaryMessenger)
    
    let cameraManager = PpfdCameraManager()
    eventChannel.setStreamHandler(cameraManager)
    
    methodChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "start" {
          cameraManager.start()
          result(nil)
      } else if call.method == "stop" {
          cameraManager.stop()
          result(nil)
      } else {
          result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
import Foundation
import AVFoundation
import Flutter

class PpfdCameraManager: NSObject, FlutterStreamHandler, AVCaptureVideoDataOutputSampleBufferDelegate {
    private var captureSession: AVCaptureSession?
    private var eventSink: FlutterEventSink?
    private let videoDataOutput = AVCaptureVideoDataOutput()
    private let sessionQueue = DispatchQueue(label: "camera_session_queue")

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }

    func start() {
        sessionQueue.async {
            self.setupAndStartSession()
        }
    }

    func stop() {
        sessionQueue.async {
            self.captureSession?.stopRunning()
            self.captureSession = nil
        }
    }

    private func setupAndStartSession() {
        captureSession = AVCaptureSession()
        guard let session = captureSession else { return }

        // Find front camera
        guard let frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
            print("No front camera found")
            return
        }

        do {
            let input = try AVCaptureDeviceInput(device: frontCamera)
            if session.canAddInput(input) {
                session.addInput(input)
            }
        } catch {
            print("Failed to add camera input: \(error)")
            return
        }

        // Setup output
        videoDataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
        videoDataOutput.setSampleBufferDelegate(self, queue: sessionQueue)
        if session.canAddOutput(videoDataOutput) {
            session.addOutput(videoDataOutput)
        }

        session.startRunning()
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let eventSink = self.eventSink else { return }

        var exposureDurationSec: Double = 0.01
        var iso: Double = 100.0
        var aperture: Double = 1.8

        if let formatDescription = CMSampleBufferGetFormatDescription(sampleBuffer) {
            // Note: In a real implementation we would extract EXIF metadata or rely on AVCaptureDevice properties
            // But AVCaptureDevice doesn't emit properties synchronously with frames easily without KVO.
            // Let's get the active camera's current values.
            if let input = captureSession?.inputs.first as? AVCaptureDeviceInput {
                let device = input.device
                exposureDurationSec = CMTimeGetSeconds(device.exposureDuration)
                iso = Double(device.iso)
                aperture = Double(device.lensAperture)
            }
        }

        // Calculate average luminance
        var luminance: Double = 1.0
        if let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
            CVPixelBufferLockBaseAddress(imageBuffer, .readOnly)
            let baseAddress = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0)
            let width = CVPixelBufferGetWidthOfPlane(imageBuffer, 0)
            let height = CVPixelBufferGetHeightOfPlane(imageBuffer, 0)
            let bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(imageBuffer, 0)

            if let buffer = baseAddress {
                let count = width * height
                var sum: UInt64 = 0
                // Sample every 10th pixel for performance
                for i in stride(from: 0, to: count, by: 10) {
                    let y = i / width
                    let x = i % width
                    let pixel = buffer.load(fromByteOffset: y * bytesPerRow + x, as: UInt8.self)
                    sum += UInt64(pixel)
                }
                luminance = Double(sum) / Double(count / 10) / 255.0
            }
            CVPixelBufferUnlockBaseAddress(imageBuffer, .readOnly)
        }

        let result: [String: Any] = [
            "iso": iso,
            "exposureDuration": exposureDurationSec,
            "aperture": aperture,
            "luminance": luminance
        ]

        DispatchQueue.main.async {
            eventSink(result)
        }
    }
}
