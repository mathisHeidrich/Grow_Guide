package com.example.app

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.graphics.ImageFormat
import android.graphics.SurfaceTexture
import android.hardware.camera2.*
import android.media.Image
import android.media.ImageReader
import android.os.Handler
import android.os.HandlerThread
import android.util.Log
import android.view.Surface
import androidx.core.app.ActivityCompat
import io.flutter.plugin.common.EventChannel

class PpfdCameraManager(private val context: Context, private val eventSink: EventChannel.EventSink?) {
    private var cameraDevice: CameraDevice? = null
    private var captureSession: CameraCaptureSession? = null
    private var imageReader: ImageReader? = null
    private var backgroundThread: HandlerThread? = null
    private var backgroundHandler: Handler? = null

    private val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager

    fun start() {
        if (ActivityCompat.checkSelfPermission(context, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
            Log.e("PpfdCamera", "Camera permission not granted")
            return
        }

        startBackgroundThread()

        try {
            // Find front camera
            var frontCameraId: String? = null
            for (cameraId in cameraManager.cameraIdList) {
                val characteristics = cameraManager.getCameraCharacteristics(cameraId)
                if (characteristics.get(CameraCharacteristics.LENS_FACING) == CameraCharacteristics.LENS_FACING_FRONT) {
                    frontCameraId = cameraId
                    break
                }
            }

            if (frontCameraId == null) {
                Log.e("PpfdCamera", "No front camera found")
                return
            }

            cameraManager.openCamera(frontCameraId, object : CameraDevice.StateCallback() {
                override fun onOpened(camera: CameraDevice) {
                    cameraDevice = camera
                    createCameraPreviewSession()
                }
                override fun onDisconnected(camera: CameraDevice) {
                    camera.close()
                    cameraDevice = null
                }
                override fun onError(camera: CameraDevice, error: Int) {
                    camera.close()
                    cameraDevice = null
                }
            }, backgroundHandler)

        } catch (e: CameraAccessException) {
            e.printStackTrace()
        }
    }

    private fun createCameraPreviewSession() {
        try {
            // We use a small resolution since we only need average brightness
            imageReader = ImageReader.newInstance(640, 480, ImageFormat.YUV_420_888, 2)
            imageReader?.setOnImageAvailableListener({ reader ->
                val image: Image? = reader.acquireLatestImage()
                image?.let {
                    // Calculate average luminance (Y channel)
                    val yPlane = it.planes[0].buffer
                    var sum = 0L
                    val limit = yPlane.limit()
                    for (i in 0 until limit step 10) { // Sample every 10th pixel for speed
                        sum += yPlane.get(i).toInt() and 0xFF
                    }
                    val avgLuminance = sum.toDouble() / (limit / 10) / 255.0
                    it.close()

                    // Send current data if we have capture result
                    lastCaptureResult?.let { result ->
                        val iso = result.get(CaptureResult.SENSOR_SENSITIVITY)?.toDouble() ?: 100.0
                        val expTimeNs = result.get(CaptureResult.SENSOR_EXPOSURE_TIME)?.toDouble() ?: 10000000.0
                        val aperture = result.get(CaptureResult.LENS_APERTURE)?.toDouble() ?: 1.8
                        val expTimeSec = expTimeNs / 1_000_000_000.0

                        val map = mapOf(
                            "iso" to iso,
                            "exposureDuration" to expTimeSec,
                            "aperture" to aperture,
                            "luminance" to avgLuminance
                        )
                        Handler(context.mainLooper).post {
                            eventSink?.success(map)
                        }
                    }
                }
            }, backgroundHandler)

            val surfaceTexture = SurfaceTexture(10) // Dummy texture
            surfaceTexture.setDefaultBufferSize(640, 480)
            val previewSurface = Surface(surfaceTexture)
            val readerSurface = imageReader!!.surface

            val captureRequestBuilder = cameraDevice!!.createCaptureRequest(CameraDevice.TEMPLATE_PREVIEW)
            captureRequestBuilder.addTarget(previewSurface)
            captureRequestBuilder.addTarget(readerSurface)
            
            // Allow auto-exposure so it adapts to light, we just read the result
            captureRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, CaptureRequest.CONTROL_AE_MODE_ON)

            cameraDevice!!.createCaptureSession(
                listOf(previewSurface, readerSurface),
                object : CameraCaptureSession.StateCallback() {
                    override fun onConfigured(session: CameraCaptureSession) {
                        captureSession = session
                        try {
                            session.setRepeatingRequest(
                                captureRequestBuilder.build(),
                                captureCallback,
                                backgroundHandler
                            )
                        } catch (e: CameraAccessException) {
                            e.printStackTrace()
                        }
                    }
                    override fun onConfigureFailed(session: CameraCaptureSession) {}
                },
                null
            )
        } catch (e: CameraAccessException) {
            e.printStackTrace()
        }
    }

    private var lastCaptureResult: CaptureResult? = null
    private val captureCallback = object : CameraCaptureSession.CaptureCallback() {
        override fun onCaptureCompleted(
            session: CameraCaptureSession,
            request: CaptureRequest,
            result: TotalCaptureResult
        ) {
            lastCaptureResult = result
        }
    }

    fun stop() {
        captureSession?.close()
        captureSession = null
        cameraDevice?.close()
        cameraDevice = null
        imageReader?.close()
        imageReader = null
        stopBackgroundThread()
    }

    private fun startBackgroundThread() {
        backgroundThread = HandlerThread("CameraBackground").also { it.start() }
        backgroundHandler = Handler(backgroundThread!!.looper)
    }

    private fun stopBackgroundThread() {
        backgroundThread?.quitSafely()
        try {
            backgroundThread?.join()
            backgroundThread = null
            backgroundHandler = null
        } catch (e: InterruptedException) {
            e.printStackTrace()
        }
    }
}
