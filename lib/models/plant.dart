import 'package:isar/isar.dart';

part 'plant.g.dart';

enum PlantPhase { onboarding, germination, veg, flower, drying, curing, archived }
enum NutrientBrand { cannaAqua, ta, advancedNutrients, plagron }
enum PlantType { photo, auto }

@collection
class Plant {
  Id id = Isar.autoIncrement;
  
  late String name;
  
  @enumerated
  late PlantPhase currentPhase;
  
  late int currentDayInPhase;
  late double waterVolumeLiters;
  
  @enumerated
  late NutrientBrand nutrientBrand;
  
  @enumerated
  late PlantType type;
  
  // Hardware specifics
  late int lampWattage;
  late String lampType; // LED, NDL
  late int plantsUnderLamp;
  
  // Background tracking
  List<LogEntry> measurementHistory = [];
  
  bool rootsReachedWater = false;
}

@embedded
class LogEntry {
  late DateTime timestamp;
  late double ph;
  late double ec;
  double? ppfd;
}
