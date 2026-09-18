import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/mock_problems.dart';
import '../models/plant_problem.dart';
import 'package:app/l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'package:app/theme/app_colors.dart';

class ProblemDetailScreen extends StatelessWidget {
  final String problemId;
  final int? plantId;

  const ProblemDetailScreen({super.key, required this.problemId, this.plantId});

  String _getLocalizedString(AppLocalizations l10n, String key) {
    switch (key) {
      case 'problemNutrientBurnName': return l10n.problemNutrientBurnName;
      case 'problemNutrientBurnSymptoms': return l10n.problemNutrientBurnSymptoms;
      case 'problemNutrientBurnTriggers': return l10n.problemNutrientBurnTriggers;
      case 'problemNutrientBurnSolution': return l10n.problemNutrientBurnSolution;
      case 'problemNutrientBurnPrevention': return l10n.problemNutrientBurnPrevention;

      case 'problemPhImbalanceName': return l10n.problemPhImbalanceName;
      case 'problemPhImbalanceSymptoms': return l10n.problemPhImbalanceSymptoms;
      case 'problemPhImbalanceTriggers': return l10n.problemPhImbalanceTriggers;
      case 'problemPhImbalanceSolution': return l10n.problemPhImbalanceSolution;
      case 'problemPhImbalancePrevention': return l10n.problemPhImbalancePrevention;

      case 'problemLightBurnName': return l10n.problemLightBurnName;
      case 'problemLightBurnSymptoms': return l10n.problemLightBurnSymptoms;
      case 'problemLightBurnTriggers': return l10n.problemLightBurnTriggers;
      case 'problemLightBurnSolution': return l10n.problemLightBurnSolution;
      case 'problemLightBurnPrevention': return l10n.problemLightBurnPrevention;

      case 'problemCalciumDeficiencyName': return l10n.problemCalciumDeficiencyName;
      case 'problemCalciumDeficiencySymptoms': return l10n.problemCalciumDeficiencySymptoms;
      case 'problemCalciumDeficiencyTriggers': return l10n.problemCalciumDeficiencyTriggers;
      case 'problemCalciumDeficiencySolution': return l10n.problemCalciumDeficiencySolution;
      case 'problemCalciumDeficiencyPrevention': return l10n.problemCalciumDeficiencyPrevention;
      
      default: return key;
    }
  }

  void _handleAction(BuildContext context, CheckinAction action) {
    if (plantId == null) {
      // Need a plant ID to perform actions!
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.problemSelectPlantPrompt),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              context.go('/');
            },
          ),
        ),
      );
      return;
    }

    switch (action) {
      case CheckinAction.waterChange:
        context.push('/water_change');
        break;
      case CheckinAction.ppfdMeasure:
        context.push('/ppfd_meter?plantId=$plantId');
        break;
      case CheckinAction.ecAdjust:
        context.push('/ec_adjust/$plantId');
        break;
      case CheckinAction.phAdjust:
        context.push('/ph_adjust/$plantId');
        break;
    }
  }

  String _getActionText(AppLocalizations l10n, CheckinAction action) {
    switch (action) {
      case CheckinAction.waterChange: return l10n.problemActionWaterChange;
      case CheckinAction.ppfdMeasure: return l10n.problemActionPpfdMeasure;
      case CheckinAction.ecAdjust: return l10n.problemActionEcAdjust;
      case CheckinAction.phAdjust: return l10n.problemActionPhAdjust;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final problem = mockProblems.firstWhere(
      (p) => p.id == problemId,
      orElse: () => mockProblems.first,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_getLocalizedString(l10n, problem.localizedNameKey)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 100,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(l10n.problemSymptoms, _getLocalizedString(l10n, problem.localizedSymptomsKey), Icons.warning_amber_rounded, Colors.orange),
            const SizedBox(height: 24),
            _buildSection(l10n.problemTriggers, _getLocalizedString(l10n, problem.localizedTriggersKey), Icons.bolt, Colors.redAccent),
            const SizedBox(height: 24),
            _buildSection(l10n.problemSolution, _getLocalizedString(l10n, problem.localizedSolutionKey), Icons.check_circle_outline, AppColors.growGreen),
            const SizedBox(height: 24),
            _buildSection(l10n.problemPrevention, _getLocalizedString(l10n, problem.localizedPreventionKey), Icons.shield_outlined, Colors.blueAccent),
            const SizedBox(height: 48),
            
            if (problem.relatedActions.isNotEmpty) ...[
              for (var action in problem.relatedActions)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.growGreen,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () => _handleAction(context, action),
                    icon: const Icon(Icons.build),
                    label: Text(
                      _getActionText(l10n, action),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                )
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, IconData icon, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
