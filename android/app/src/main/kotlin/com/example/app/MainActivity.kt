package com.example.app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val METHOD_CHANNEL = "com.growguide.ppfd_camera/methods"
    private val EVENT_CHANNEL = "com.growguide.ppfd_camera/events"

    private var cameraManager: PpfdCameraManager? = null
    private var eventSink: EventChannel.EventSink? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    eventSink = events
                }
                override fun onCancel(arguments: Any?) {
                    eventSink = null
                }
            }
        )

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "start" -> {
                    if (cameraManager == null) {
                        cameraManager = PpfdCameraManager(this, eventSink)
                    }
                    cameraManager?.start()
                    result.success(null)
                }
                "stop" -> {
                    cameraManager?.stop()
                    cameraManager = null
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }
}
