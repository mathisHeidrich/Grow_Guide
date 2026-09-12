

enum CheckinAction {
  waterChange,
  ppfdMeasure,
  ecAdjust,
  phAdjust,
}

class PlantProblem {
  final String id;
  final String localizedNameKey;
  final String imageAssetPath;
  final String localizedSymptomsKey;
  final String localizedTriggersKey;
  final String localizedSolutionKey;
  final String localizedPreventionKey;
  final List<CheckinAction> relatedActions;

  const PlantProblem({
    required this.id,
    required this.localizedNameKey,
    required this.imageAssetPath,
    required this.localizedSymptomsKey,
    required this.localizedTriggersKey,
    required this.localizedSolutionKey,
    required this.localizedPreventionKey,
    this.relatedActions = const [],
  });
}
