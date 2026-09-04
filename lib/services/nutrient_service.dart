import '../database/tables.dart';

class NutrientCalculationResult {
  final double growMl;
  final double microMl;
  final double bloomMl;

  NutrientCalculationResult({
    required this.growMl,
    required this.microMl,
    required this.bloomMl,
  });
}

class NutrientService {
  /// Calculates the required nutrient amounts based on phase and topped up liters.
  /// This is a mock implementation for a generic 3-part nutrient system (e.g., TriPart).
  static NutrientCalculationResult calculateNutrients({
    required PlantPhase phase,
    required double waterAddedLiters,
  }) {
    if (waterAddedLiters <= 0) {
      return NutrientCalculationResult(growMl: 0, microMl: 0, bloomMl: 0);
    }

    double growPerL = 0;
    double microPerL = 0;
    double bloomPerL = 0;

    switch (phase) {
      case PlantPhase.onboarding:
      case PlantPhase.germination:
      case PlantPhase.archived:
        growPerL = 0.5;
        microPerL = 0.5;
        bloomPerL = 0.5;
        break;
      case PlantPhase.veg:
        growPerL = 1.5;
        microPerL = 1.5;
        bloomPerL = 1.0;
        break;
      case PlantPhase.flower:
      case PlantPhase.drying:
      case PlantPhase.curing:
        growPerL = 0.5;
        microPerL = 1.5;
        bloomPerL = 1.5;
        break;
    }

    return NutrientCalculationResult(
      growMl: growPerL * waterAddedLiters,
      microMl: microPerL * waterAddedLiters,
      bloomMl: bloomPerL * waterAddedLiters,
    );
  }
}
