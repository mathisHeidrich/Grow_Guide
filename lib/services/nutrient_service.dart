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
  /// Target EC values per phase (Mock values for generic DWC)
  static double getTargetEc(PlantPhase phase) {
    switch (phase) {
      case PlantPhase.onboarding:
      case PlantPhase.germination:
      case PlantPhase.archived:
        return 0.8;
      case PlantPhase.veg:
        return 1.4;
      case PlantPhase.flower:
      case PlantPhase.drying:
      case PlantPhase.curing:
        return 1.8;
    }
  }

  /// Calculates the required nutrient amounts based on phase, topped up liters, 
  /// and the current EC deficit in the whole tank.
  static NutrientCalculationResult calculateNutrients({
    required PlantPhase phase,
    required double waterAddedLiters,
    required double totalVolumeLiters,
    required double currentEc,
  }) {
    double targetEc = getTargetEc(phase);
    
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

    // 1. Calculate nutrients needed for the freshly added water (assuming fresh water has EC 0 or close to 0)
    double topOffGrow = growPerL * waterAddedLiters;
    double topOffMicro = microPerL * waterAddedLiters;
    double topOffBloom = bloomPerL * waterAddedLiters;

    // 2. Calculate nutrients needed to fix the EC deficit in the existing water
    double deficitGrow = 0;
    double deficitMicro = 0;
    double deficitBloom = 0;

    if (currentEc < targetEc) {
      // How much percentage of the target EC is missing?
      double deficitRatio = (targetEc - currentEc) / targetEc;
      // We apply this ratio to the total volume (minus what we just topped off, to avoid double counting)
      double existingVolume = totalVolumeLiters - waterAddedLiters;
      if (existingVolume < 0) existingVolume = 0;
      
      deficitGrow = deficitRatio * growPerL * existingVolume;
      deficitMicro = deficitRatio * microPerL * existingVolume;
      deficitBloom = deficitRatio * bloomPerL * existingVolume;
    }

    return NutrientCalculationResult(
      growMl: topOffGrow + deficitGrow,
      microMl: topOffMicro + deficitMicro,
      bloomMl: topOffBloom + deficitBloom,
    );
  }
}
