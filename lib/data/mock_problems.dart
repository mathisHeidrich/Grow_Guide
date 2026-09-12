import '../models/plant_problem.dart';

final List<PlantProblem> mockProblems = [
  const PlantProblem(
    id: 'nutrient_burn',
    localizedNameKey: 'problemNutrientBurnName',
    imageAssetPath: 'assets/images/problems/nutrient_burn.png',
    localizedSymptomsKey: 'problemNutrientBurnSymptoms',
    localizedTriggersKey: 'problemNutrientBurnTriggers',
    localizedSolutionKey: 'problemNutrientBurnSolution',
    localizedPreventionKey: 'problemNutrientBurnPrevention',
    relatedActions: [CheckinAction.waterChange],
  ),
  const PlantProblem(
    id: 'ph_imbalance',
    localizedNameKey: 'problemPhImbalanceName',
    imageAssetPath: 'assets/images/problems/ph_imbalance.png',
    localizedSymptomsKey: 'problemPhImbalanceSymptoms',
    localizedTriggersKey: 'problemPhImbalanceTriggers',
    localizedSolutionKey: 'problemPhImbalanceSolution',
    localizedPreventionKey: 'problemPhImbalancePrevention',
    relatedActions: [CheckinAction.phAdjust],
  ),
  const PlantProblem(
    id: 'light_burn',
    localizedNameKey: 'problemLightBurnName',
    imageAssetPath: 'assets/images/problems/light_burn.png',
    localizedSymptomsKey: 'problemLightBurnSymptoms',
    localizedTriggersKey: 'problemLightBurnTriggers',
    localizedSolutionKey: 'problemLightBurnSolution',
    localizedPreventionKey: 'problemLightBurnPrevention',
    relatedActions: [CheckinAction.ppfdMeasure],
  ),
  const PlantProblem(
    id: 'calcium_deficiency',
    localizedNameKey: 'problemCalciumDeficiencyName',
    imageAssetPath: 'assets/images/problems/calcium_deficiency.png',
    localizedSymptomsKey: 'problemCalciumDeficiencySymptoms',
    localizedTriggersKey: 'problemCalciumDeficiencyTriggers',
    localizedSolutionKey: 'problemCalciumDeficiencySolution',
    localizedPreventionKey: 'problemCalciumDeficiencyPrevention',
    relatedActions: [CheckinAction.ecAdjust],
  ),
];
