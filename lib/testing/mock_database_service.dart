import 'package:drift/drift.dart';
import '../services/database.dart';
import '../database/database.dart';
import '../database/connection.dart';
import 'scenarios.dart';

class MockDatabaseService extends DatabaseService {
  final TestScenario scenario;

  MockDatabaseService(this.scenario);

  @override
  Future<void> init() async {
    db = AppDatabase.forTesting(openMemoryConnection());

    // Seed the database with scenario data
    await db.into(db.appSettingsTable).insert(
      AppSettingsTableCompanion.insert(
        hasCompletedOnboarding: Value(scenario.hasCompletedOnboarding),
      ),
    );

    for (final plantCompanion in scenario.plants) {
      await db.into(db.plants).insert(plantCompanion);
    }
  }
}
