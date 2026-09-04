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
  int get schemaVersion => 1;
}
