import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/light_source.dart';
import '../services/ppfd_camera_service.dart';

final ppfdCameraServiceProvider = Provider<PpfdCameraService>((ref) {
  final service = PpfdCameraService();
  ref.onDispose(() {
    service.stopSession();
  });
  return service;
});

final selectedLightSourceProvider = StateProvider<LightSource>((ref) => LightSource.led);
final calibrationFactorProvider = StateProvider<double>((ref) => 1.0);
final ppfdCalibrationConstantProvider = Provider<double>((ref) => 250.0); // C in the formula

final ppfdStreamProvider = StreamProvider<double>((ref) {
  final service = ref.watch(ppfdCameraServiceProvider);
  final lightSource = ref.watch(selectedLightSourceProvider);
  final calibrationFactor = ref.watch(calibrationFactorProvider);
  final c = ref.watch(ppfdCalibrationConstantProvider);

  // Start the session when the stream is listened to (or in the UI layer, but this works if we want it tied to the stream)
  // We'll let the UI call start/stop for better lifecycle control.

  return service.sensorStream.map((data) {
    if (data.exposureDuration <= 0 || data.iso <= 0) return 0.0;

    // Lux = C * (Aperture^2) / (Exposure Time * ISO) * Luminance
    final lux = c * (data.aperture * data.aperture) / (data.exposureDuration * data.iso) * data.luminance;
    
    // PPFD = Lux * LightSourceFactor * UserCalibration
    final ppfd = lux * lightSource.factor * calibrationFactor;
    return ppfd;
  });
});
