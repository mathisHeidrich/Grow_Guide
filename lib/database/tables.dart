import 'package:drift/drift.dart';

enum PlantPhase {
  onboarding,
  germination,
  veg,
  flower,
  drying,
  curing,
  archived
}

enum NutrientBrand { cannaAqua, ta, advancedNutrients, plagron }

enum PlantType { photo, auto }

@DataClassName('Plant')
class Plants extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  IntColumn get currentPhase => intEnum<PlantPhase>()();
  DateTimeColumn get phaseStartDate => dateTime().nullable()();

  RealColumn get waterVolumeLiters => real()();
  IntColumn get nutrientBrand => intEnum<NutrientBrand>()();
  IntColumn get type => intEnum<PlantType>()();

  IntColumn get lampWattage => integer()();
  TextColumn get lampType => text()();
  IntColumn get plantsUnderLamp => integer()();

  BoolColumn get rootsReachedWater =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get germinationStarted =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastGerminationCheck => dateTime().nullable()();
}

@DataClassName('LogEntry')
class LogEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get plantId => integer().references(Plants, #id)();
  DateTimeColumn get timestamp => dateTime()();
  RealColumn get ph => real().nullable()();
  RealColumn get ec => real().nullable()();
  RealColumn get ppfd => real().nullable()();
  RealColumn get waterAdded => real().nullable()();
  BoolColumn get isWaterChange =>
      boolean().withDefault(const Constant(false))();
}

@DataClassName('AppSettings')
class AppSettingsTable extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  BoolColumn get hasCompletedOnboarding =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get hasCompletedTentSetup =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
