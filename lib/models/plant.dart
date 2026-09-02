export '../database/tables.dart';
export '../database/database.dart' show Plant, LogEntry, PlantsCompanion, LogEntriesCompanion;

// removed unused import
import '../database/database.dart';

extension PlantExtensions on Plant {
  int getDayInPhase(DateTime now) {
    if (phaseStartDate == null) return 1;
    final start = DateTime(phaseStartDate!.year, phaseStartDate!.month, phaseStartDate!.day);
    final current = DateTime(now.year, now.month, now.day);
    return current.difference(start).inDays + 1;
  }
}
