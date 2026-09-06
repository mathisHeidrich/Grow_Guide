export '../database/tables.dart';
import '../database/tables.dart';
export '../database/database.dart'
    show Plant, LogEntry, PlantsCompanion, LogEntriesCompanion;

// removed unused import
import '../database/database.dart';

extension PlantExtensions on Plant {
  int getDayInPhase(DateTime now) {
    if (phaseStartDate == null) return 1;
    final start = DateTime(
        phaseStartDate!.year, phaseStartDate!.month, phaseStartDate!.day);
    final current = DateTime(now.year, now.month, now.day);
    return current.difference(start).inDays + 1;
  }
}

extension PlantPhaseExtensions on PlantPhase {
  List<int> get targetPpfdRange {
    switch (this) {
      case PlantPhase.germination:
        return [100, 300];
      case PlantPhase.veg:
        return [300, 600];
      case PlantPhase.flower:
        return [600, 1000];
      default:
        return [0, 0];
    }
  }
}
