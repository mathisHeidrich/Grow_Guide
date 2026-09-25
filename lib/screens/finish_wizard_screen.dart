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

class FinishWizardScreen extends ConsumerStatefulWidget {
  final int plantId;
  const FinishWizardScreen({super.key, required this.plantId});

  @override
  ConsumerState<FinishWizardScreen> createState() => _FinishWizardScreenState();
}

class _FinishWizardScreenState extends ConsumerState<FinishWizardScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

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

  Future<void> _archivePlant() async {
    final db = ref.read(databaseProvider).db;
    final plant = await (db.select(db.plants)..where((tbl) => tbl.id.equals(widget.plantId))).getSingleOrNull();
    if (plant != null) {
      final now = ref.read(timeProvider);
      
      final weight = double.tryParse(_weightController.text.replaceAll(',', '.')) ?? 0.0;
      
      final updatedPlant = plant.copyWith(
        currentPhase: PlantPhase.archived,
        endDate: drift.Value(now),
        yieldGrams: drift.Value(weight),
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
                title: l10n.finishWizardTrimTitle,
                text: l10n.finishWizardTrimDesc,
                tip: l10n.finishWizardTrimTip,
                icon: Icons.content_cut,
                nextButtonText: l10n.checkinNext,
                onNext: _nextPage,
              ),
              l10n.finishWizardTrimDeepDiveTitle,
              l10n.finishWizardTrimDeepDiveDesc,
            ),
            _wrapWithInfo(
              _buildWeighSlide(),
              l10n.finishWizardWeighDeepDiveTitle,
              l10n.finishWizardWeighDeepDiveDesc,
            ),
            _wrapWithInfo(
              _buildSlide(
                title: l10n.finishWizardCuringTitle,
                text: l10n.finishWizardCuringDesc,
                tip: l10n.finishWizardCuringTip,
                icon: Icons.inventory_2,
                nextButtonText: l10n.finishWizardFinishBtn,
                onNext: _archivePlant,
                showBack: true,
              ),
              l10n.finishWizardCuringDeepDiveTitle,
              l10n.finishWizardCuringDeepDiveDesc,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildWeighSlide() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.scale, size: 100, color: AppColors.growGreen),
          const SizedBox(height: 32),
          Text(
            l10n.finishWizardWeighTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.finishWizardWeighDesc,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          TextField(
            controller: _weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: l10n.finishWizardWeighInputLabel,
              labelStyle: const TextStyle(color: Colors.white54),
              suffixText: 'g',
              suffixStyle: const TextStyle(color: AppColors.growGreen, fontSize: 24),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.growGreen),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: AppColors.surface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.finishWizardWeighTip,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.growGreen.withValues(alpha: 0.8),
                  fontStyle: FontStyle.italic,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(flex: 1, child: _backButton()),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: _nextPage,
                  child: Text(l10n.checkinNext, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
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
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            tip,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.growGreen.withValues(alpha: 0.8),
                  fontStyle: FontStyle.italic,
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
