import '../database/database.dart';

class DatabaseService {
  late AppDatabase db;

  Future<void> init() async {
    db = AppDatabase();

    // Initialize default AppSettings if empty
    final settingsCount = await db.select(db.appSettingsTable).get();
    if (settingsCount.isEmpty) {
      await db.into(db.appSettingsTable).insert(
            AppSettingsTableCompanion.insert(),
          );
    }
  }
}
