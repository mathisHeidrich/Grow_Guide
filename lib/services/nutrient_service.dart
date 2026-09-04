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

class NutrientWeekConfig {
  final double targetEc;
  final double growPerL;
  final double microPerL;
  final double bloomPerL;

  const NutrientWeekConfig({
    required this.targetEc,
    required this.growPerL,
    required this.microPerL,
    required this.bloomPerL,
  });
}

class NutrientService {
  /// Mock weekly schedule for generic DWC 3-part nutrient
  static final Map<PlantPhase, List<NutrientWeekConfig>> _schedule = {
    PlantPhase.germination: [
      const NutrientWeekConfig(targetEc: 0.5, growPerL: 0.2, microPerL: 0.2, bloomPerL: 0.2), // Week 1+
    ],
    PlantPhase.veg: [
      const NutrientWeekConfig(targetEc: 0.8, growPerL: 0.5, microPerL: 0.5, bloomPerL: 0.5), // Week 1
      const NutrientWeekConfig(targetEc: 1.1, growPerL: 1.0, microPerL: 1.0, bloomPerL: 0.5), // Week 2
      const NutrientWeekConfig(targetEc: 1.4, growPerL: 1.5, microPerL: 1.5, bloomPerL: 1.0), // Week 3
      const NutrientWeekConfig(targetEc: 1.5, growPerL: 1.8, microPerL: 1.8, bloomPerL: 1.2), // Week 4+
    ],
    PlantPhase.flower: [
      const NutrientWeekConfig(targetEc: 1.5, growPerL: 1.5, microPerL: 1.5, bloomPerL: 1.5), // Week 1 (Transition)
      const NutrientWeekConfig(targetEc: 1.6, growPerL: 1.0, microPerL: 1.5, bloomPerL: 1.5), // Week 2
      const NutrientWeekConfig(targetEc: 1.7, growPerL: 0.5, microPerL: 1.5, bloomPerL: 2.0), // Week 3
      const NutrientWeekConfig(targetEc: 1.8, growPerL: 0.5, microPerL: 1.5, bloomPerL: 2.0), // Week 4
      const NutrientWeekConfig(targetEc: 1.8, growPerL: 0.0, microPerL: 1.5, bloomPerL: 2.5), // Week 5+
    ],
  };

  /// Returns the nutrient config for the given phase and week.
  static NutrientWeekConfig _getConfig(PlantPhase phase, int weekIndex) {
    List<NutrientWeekConfig>? configs = _schedule[phase];
    if (configs == null || configs.isEmpty) {
      // Fallback for phases without a specific schedule
      return const NutrientWeekConfig(targetEc: 0.5, growPerL: 0, microPerL: 0, bloomPerL: 0);
    }
    // Cap the weekIndex to the last available config in the list
    if (weekIndex >= configs.length) {
      weekIndex = configs.length - 1;
    }
    if (weekIndex < 0) weekIndex = 0;
    
    return configs[weekIndex];
  }

  /// Expose the Target EC for a given phase and week
  static double getTargetEc(PlantPhase phase, int weekIndex) {
    return _getConfig(phase, weekIndex).targetEc;
  }

  /// Calculates the required nutrient amounts based on phase, week, topped up liters, 
  /// and the current EC deficit in the whole tank.
  static NutrientCalculationResult calculateNutrients({
    required PlantPhase phase,
    required int weekIndex,
    required double waterAddedLiters,
    required double totalVolumeLiters,
    required double currentEc,
  }) {
    final config = _getConfig(phase, weekIndex);
    
    double targetEc = config.targetEc;
    double growPerL = config.growPerL;
    double microPerL = config.microPerL;
    double bloomPerL = config.bloomPerL;

    // 1. Calculate nutrients needed for the freshly added water
    double topOffGrow = growPerL * waterAddedLiters;
    double topOffMicro = microPerL * waterAddedLiters;
    double topOffBloom = bloomPerL * waterAddedLiters;

    // 2. Calculate nutrients needed to fix the EC deficit in the existing water
    double deficitGrow = 0;
    double deficitMicro = 0;
    double deficitBloom = 0;

    if (currentEc < targetEc) {
      double deficitRatio = (targetEc - currentEc) / targetEc;
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
