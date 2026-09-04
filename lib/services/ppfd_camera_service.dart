import 'dart:async';
import 'package:flutter/services.dart';

class PpfdSensorData {
  final double iso;
  final double exposureDuration;
  final double aperture;
  final double luminance;

  PpfdSensorData({
    required this.iso,
    required this.exposureDuration,
    required this.aperture,
    required this.luminance,
  });

  factory PpfdSensorData.fromMap(Map<dynamic, dynamic> map) {
    return PpfdSensorData(
      iso: (map['iso'] ?? 100.0).toDouble(),
      exposureDuration: (map['exposureDuration'] ?? 0.01).toDouble(),
      aperture: (map['aperture'] ?? 1.8).toDouble(),
      luminance: (map['luminance'] ?? 1.0).toDouble(),
    );
  }
}

class PpfdCameraService {
  static const MethodChannel _methodChannel =
      MethodChannel('com.growguide.ppfd_camera/methods');
  static const EventChannel _eventChannel =
      EventChannel('com.growguide.ppfd_camera/events');

  Stream<PpfdSensorData>? _sensorStream;

  Future<void> startSession() async {
    await _methodChannel.invokeMethod('start');
  }

  Future<void> stopSession() async {
    await _methodChannel.invokeMethod('stop');
  }

  Stream<PpfdSensorData> get sensorStream {
    _sensorStream ??= _eventChannel.receiveBroadcastStream().map(
        (dynamic event) =>
            PpfdSensorData.fromMap(event as Map<dynamic, dynamic>));
    return _sensorStream!;
  }
}
