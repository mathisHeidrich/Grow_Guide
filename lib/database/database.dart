import 'package:drift/drift.dart';
import 'tables.dart';
import 'connection.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Plants, LogEntries, AppSettingsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  // For testing
  AppDatabase.forTesting(super.connection);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.addColumn(plants, plants.startDate);
          await m.addColumn(plants, plants.endDate);
          await m.addColumn(plants, plants.yieldGrams);
        }
        if (from < 3) {
          await m.addColumn(appSettingsTable, appSettingsTable.waterEcLevel);
        }
        if (from < 4) {
          await m.issueCustomQuery('ALTER TABLE app_settings ADD COLUMN experience_level TEXT;');
        }
        if (from < 5) {
          await m.addColumn(plants, plants.growLevel);
        }
      },
    );
  }
}
