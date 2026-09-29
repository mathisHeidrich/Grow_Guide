import 'package:drift/drift.dart';
import 'tables.dart';
import 'connection.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Tents, Plants, LogEntries, AppSettingsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  // For testing
  AppDatabase.forTesting(super.connection);

  @override
  int get schemaVersion => 6;

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
        if (from < 6) {
          await m.createTable(tents);
          
          final oldPlants = await customSelect('SELECT lamp_wattage, lamp_type FROM plants LIMIT 1').get();
          int wattage = 150;
          String type = 'LED';
          if (oldPlants.isNotEmpty) {
            final w = oldPlants.first.read<int?>('lamp_wattage');
            final t = oldPlants.first.read<String?>('lamp_type');
            if (w != null) wattage = w;
            if (t != null) type = t;
          }
          
          final tentId = await into(tents).insert(
            TentsCompanion.insert(
              name: 'Mein Zelt',
              lampWattage: wattage,
              lampType: type,
            ),
          );

          await m.alterTable(TableMigration(
            plants,
            columnTransformer: {
              plants.tentId: Variable<int>(tentId),
            },
          ));
        }
      },
    );
  }
}
