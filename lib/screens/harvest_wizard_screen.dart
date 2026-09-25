import 'package:flutter/material.dart';
import '../widgets/tip_formatted_text.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/time_provider.dart';
import '../providers/database_provider.dart';
import '../database/tables.dart' show PlantPhase;
import 'package:app/l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class HarvestWizardScreen extends ConsumerStatefulWidget {
  final int plantId;
  const HarvestWizardScreen({super.key, required this.plantId});

  @override
  ConsumerState<HarvestWizardScreen> createState() => _HarvestWizardScreenState();
}

class _HarvestWizardScreenState extends ConsumerState<HarvestWizardScreen> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _startDrying() async {
    final db = ref.read(databaseProvider).db;
    final plant = await (db.select(db.plants)..where((tbl) => tbl.id.equals(widget.plantId))).getSingleOrNull();
    if (plant != null) {
      final now = ref.read(timeProvider);
      final updatedPlant = plant.copyWith(
        currentPhase: PlantPhase.drying,
        phaseStartDate: drift.Value(now),
      );
      await db.update(db.plants).replace(updatedPlant);
    }
    if (mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _wrapWithInfo(
              _buildSlide(
                title: l10n.harvestWizardPrepTitle,
                text: l10n.harvestWizardPrepDesc,
                tip: l10n.harvestWizardPrepTip,
                icon: Icons.sanitizer,
                nextButtonText: l10n.checkinNext,
                onNext: _nextPage,
              ),
              l10n.harvestWizardPrepDeepDiveTitle,
              l10n.harvestWizardPrepDeepDiveDesc,
            ),
            _wrapWithInfo(
              _buildSlide(
                title: l10n.harvestWizardCutTitle,
                text: l10n.harvestWizardCutDesc,
                tip: l10n.harvestWizardCutTip,
                icon: Icons.content_cut,
                nextButtonText: l10n.checkinNext,
                onNext: _nextPage,
                showBack: true,
              ),
              l10n.harvestWizardCutDeepDiveTitle,
              l10n.harvestWizardCutDeepDiveDesc,
            ),
            _wrapWithInfo(
              _buildSlide(
                title: l10n.harvestWizardTrimTitle,
                text: l10n.harvestWizardTrimDesc,
                tip: l10n.harvestWizardTrimTip,
                icon: Icons.eco,
                nextButtonText: l10n.checkinNext,
                onNext: _nextPage,
                showBack: true,
              ),
              l10n.harvestWizardTrimDeepDiveTitle,
              l10n.harvestWizardTrimDeepDiveDesc,
            ),
            _wrapWithInfo(
              _buildSlide(
                title: l10n.harvestWizardDryingTitle,
                text: l10n.harvestWizardDryingDesc,
                tip: l10n.harvestWizardDryingTip,
                icon: Icons.air,
                nextButtonText: l10n.harvestWizardFinishBtn,
                onNext: _startDrying,
                showBack: true,
              ),
              l10n.harvestWizardDryingDeepDiveTitle,
              l10n.harvestWizardDryingDeepDiveDesc,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide({
    required String title,
    required String text,
    required String tip,
    required IconData icon,
    required String nextButtonText,
    required VoidCallback onNext,
    bool showBack = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Icon(icon, size: 100, color: AppColors.growGreen),
          const SizedBox(height: 32),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TipFormattedText(
            tip.isNotEmpty ? '$text\n\n$tip' : text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            children: [
              if (showBack) Expanded(flex: 1, child: _backButton()),
              if (showBack) const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: onNext,
                  child: Text(nextButtonText, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _backButton() {
    final l10n = AppLocalizations.of(context)!;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        side: const BorderSide(color: Colors.white54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: _previousPage,
      child: Text(l10n.checkinBack),
    );
  }

  Widget _wrapWithInfo(Widget child, String title, String text) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white54, size: 32),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.surface,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 16),
                        Text(text,
                            style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.5)),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.growGreen,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(AppLocalizations.of(context)!.generalUnderstood,
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white54, size: 32),
            onPressed: () => context.go('/'),
          ),
        ),
      ],
    );
  }
}
