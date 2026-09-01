import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../services/database.dart';
import '../models/plant.dart';
import '../models/app_settings.dart';
import 'scenarios.dart';
import 'dart:io';

class MockDatabaseService extends DatabaseService {
  final TestScenario scenario;

  MockDatabaseService(this.scenario);

  @override
  Future<void> init() async {
    final dir = await getTemporaryDirectory();
    final isarDir = Directory('${dir.path}/isar_test_env');
    
    // Wipe previous test data
    if (await isarDir.exists()) {
      await isarDir.delete(recursive: true);
    }
    await isarDir.create();

    // Open a fresh Isar instance
    isar = await Isar.open(
      [PlantSchema, AppSettingsSchema],
      directory: isarDir.path,
      name: 'test_instance', // specific name to avoid collision
    );

    // Seed the database with scenario data
    await isar.writeTxn(() async {
      // Default settings
      await isar.appSettings.put(AppSettings()..hasCompletedOnboarding = scenario.hasCompletedOnboarding);

      // Plants for the scenario
      if (scenario.plants.isNotEmpty) {
        await isar.plants.putAll(scenario.plants);
      }
    });
  }
}
