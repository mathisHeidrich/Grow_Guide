import '../database/tables.dart';

class NutrientAmount {
  final String name;
  final double amountMl;
  
  NutrientAmount({required this.name, required this.amountMl});
}

class NutrientCalculationResult {
  final double targetEc;
  final List<NutrientAmount> nutrients;

  NutrientCalculationResult({
    required this.targetEc,
    required this.nutrients,
  });
}

abstract class NutrientSchedule {
  String get brandName;
  
  double getTargetEc(PlantPhase phase, int weekIndex);
  
  /// Returns ml per L for each component.
  /// [userAdditives] is a list of optional additive IDs the user has enabled (e.g. 'calmag', 'silica').
  List<NutrientAmount> getBaseMlPerLiter(PlantPhase phase, int weekIndex, List<String> userAdditives);
}

class TerraAquaticaTriPartSchedule implements NutrientSchedule {
  @override
  String get brandName => 'Terra Aquatica TriPart';

  @override
  double getTargetEc(PlantPhase phase, int weekIndex) {
    if (phase == PlantPhase.veg) {
      if (weekIndex == 0) return 0.8;
      if (weekIndex == 1) return 1.1;
      return 1.4;
    } else if (phase == PlantPhase.flower) {
      if (weekIndex == 0) return 1.5;
      if (weekIndex == 1) return 1.6;
      if (weekIndex == 2) return 1.7;
      return 1.8;
    }
    return 0.5; // fallback
  }

  @override
  List<NutrientAmount> getBaseMlPerLiter(PlantPhase phase, int weekIndex, List<String> userAdditives) {
    double grow = 0;
    double micro = 0;
    double bloom = 0;
    
    if (phase == PlantPhase.veg) {
      if (weekIndex == 0) { grow = 0.5; micro = 0.5; bloom = 0.5; }
      else if (weekIndex == 1) { grow = 1.0; micro = 1.0; bloom = 0.5; }
      else { grow = 1.5; micro = 1.5; bloom = 1.0; }
    } else if (phase == PlantPhase.flower) {
      if (weekIndex == 0) { grow = 1.5; micro = 1.5; bloom = 1.5; }
      else if (weekIndex == 1) { grow = 1.0; micro = 1.5; bloom = 1.5; }
      else if (weekIndex == 2) { grow = 0.5; micro = 1.5; bloom = 2.0; }
      else { grow = 0.0; micro = 1.5; bloom = 2.5; }
    } else {
       grow = 0.2; micro = 0.2; bloom = 0.2;
    }

    final nutrients = [
      NutrientAmount(name: 'TriPart Grow', amountMl: grow),
      NutrientAmount(name: 'TriPart Micro', amountMl: micro),
      NutrientAmount(name: 'TriPart Bloom', amountMl: bloom),
    ];

    // Handle optional additives
    if (userAdditives.contains('calmag')) {
      nutrients.add(NutrientAmount(name: 'CalMag', amountMl: 1.0)); // e.g. 1ml/L globally
    }
    if (userAdditives.contains('silica')) {
       // Only add silica in veg and early flower
       if (phase == PlantPhase.veg || (phase == PlantPhase.flower && weekIndex < 2)) {
         nutrients.add(NutrientAmount(name: 'Silica', amountMl: 0.5));
       }
    }

    return nutrients;
  }
}

class NutrientService {
  /// We map the NutrientBrand enum from the DB to an actual NutrientSchedule implementation
  static NutrientSchedule getScheduleForBrand(NutrientBrand brand) {
    switch (brand) {
      case NutrientBrand.ta:
        return TerraAquaticaTriPartSchedule();
      // Add more brands here when implemented:
      // case NutrientBrand.cannaAqua: return CannaAquaSchedule();
      // case NutrientBrand.advancedNutrients: return AdvancedNutrientsSchedule();
      default:
        // fallback
        return TerraAquaticaTriPartSchedule(); 
    }
  }

  /// Calculates the required nutrient amounts based on brand, phase, week, topped up liters, 
  /// current EC deficit in the whole tank, and any optional additives the user selected.
  static NutrientCalculationResult calculateNutrients({
    required NutrientBrand brand,
    required PlantPhase phase,
    required int weekIndex,
    required double waterAddedLiters,
    required double totalVolumeLiters,
    required double currentEc,
    List<String> userAdditives = const [],
  }) {
    final schedule = getScheduleForBrand(brand);
    
    double targetEc = schedule.getTargetEc(phase, weekIndex);
    List<NutrientAmount> baseAmounts = schedule.getBaseMlPerLiter(phase, weekIndex, userAdditives);

    // 1. Calculate deficit ratio for the existing water
    double deficitRatio = 0.0;
    if (currentEc < targetEc) {
       deficitRatio = (targetEc - currentEc) / targetEc;
    }

    double existingVolume = totalVolumeLiters - waterAddedLiters;
    if (existingVolume < 0) existingVolume = 0;

    List<NutrientAmount> calculatedNutrients = [];

    for (var base in baseAmounts) {
      // Amount for the fresh top-off water
      double topOffAmount = base.amountMl * waterAddedLiters;
      
      // Amount to fix the EC deficit in the existing water
      double deficitAmount = deficitRatio * base.amountMl * existingVolume;

      double totalAmount = topOffAmount + deficitAmount;

      if (totalAmount > 0) {
        calculatedNutrients.add(NutrientAmount(
          name: base.name,
          amountMl: totalAmount,
        ));
      }
    }

    return NutrientCalculationResult(
      targetEc: targetEc,
      nutrients: calculatedNutrients,
    );
  }
}
