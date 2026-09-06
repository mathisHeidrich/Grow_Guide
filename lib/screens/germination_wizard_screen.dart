import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/time_provider.dart';

import '../providers/database_provider.dart';
import 'package:app/l10n/app_localizations.dart';
import '../models/plant.dart';
import '../theme/app_colors.dart';

class GerminationWizardScreen extends ConsumerStatefulWidget {
  final int plantId;
  const GerminationWizardScreen({super.key, required this.plantId});

  @override
  ConsumerState<GerminationWizardScreen> createState() =>
      _GerminationWizardScreenState();
}

class _GerminationWizardScreenState
    extends ConsumerState<GerminationWizardScreen> {
  final PageController _pageController = PageController();
  Plant? _plant;
  bool? _seedOpened;
  double? _inputPpfd;

  @override
  void initState() {
    super.initState();
    _loadPlant();
  }

  Future<void> _loadPlant() async {
    final db = ref.read(databaseProvider).db;
    final plant = await (db.select(db.plants)
          ..where((tbl) => tbl.id.equals(widget.plantId)))
        .getSingleOrNull();
    if (mounted && plant != null) {
      setState(() => _plant = plant);

      if (_plant!.germinationStarted) {
        final now = ref.read(timeProvider);
        final referenceDate =
            _plant!.lastGerminationCheck ?? _plant!.phaseStartDate;
        final elapsedHours =
            referenceDate != null ? now.difference(referenceDate).inHours : 0;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (elapsedHours < 12) {
            _pageController.jumpToPage(3);
          } else {
            _pageController.jumpToPage(4);
          }
        });
      }
    }
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

  void _jumpToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _finishPart1() async {
    if (_plant == null) return;

    final db = ref.read(databaseProvider).db;
    final updatedPlant = _plant!.copyWith(
      germinationStarted: true,
      phaseStartDate: drift.Value(ref.read(timeProvider)),
    );
    await db.update(db.plants).replace(updatedPlant);

    if (mounted) context.go('/');
  }

  Future<void> _markRootChecked() async {
    if (_plant == null) return;

    final db = ref.read(databaseProvider).db;
    final updatedPlant = _plant!.copyWith(
      lastGerminationCheck: drift.Value(ref.read(timeProvider)),
    );
    await db.update(db.plants).replace(updatedPlant);

    if (mounted) context.go('/');
  }

  Future<void> _completeGermination() async {
    if (_plant == null) return;

    final db = ref.read(databaseProvider).db;
    final updatedPlant = _plant!.copyWith(
      currentPhase: PlantPhase.veg,
      phaseStartDate: drift.Value(ref.read(timeProvider)),
    );
    await db.update(db.plants).replace(updatedPlant);

    if (mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_plant == null)
      return const Scaffold(body: Center(child: CircularProgressIndicator()));

    // Simple implementation of the germination flow
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildSlide(
                  title: l10n.germinationTitle1,
                  text: l10n.germinationDesc1,
                  icon: Icons.local_drink,
                  nextButtonText: l10n.germinationNext1,
                  onNext: _nextPage,
                ),
                _buildSlide(
                  title: l10n.germinationTitle1b,
                  text: l10n.germinationDesc1b,
                  icon: Icons.science,
                  nextButtonText: l10n.germinationNext1b,
                  onNext: _nextPage,
                  showBack: true,
                ),
                _buildSlide(
                  title: l10n.germinationTitle2,
                  text: l10n.germinationDesc2,
                  icon: Icons.nightlight_round,
                  nextButtonText: l10n.germinationNext2,
                  onNext: _nextPage,
                  showBack: true,
                ),
                _buildSlide(
                  title: l10n.germinationTitle3,
                  text: l10n.germinationDesc3,
                  icon: Icons.hourglass_empty,
                  nextButtonText: l10n.germinationToDashboard,
                  onNext: _finishPart1,
                  showBack: true,
                ),
                // Wurzel Check (Index 4)
                _buildRootCheckSlide(l10n),
                // Geduld! (Index 5)
                _buildSlide(
                  title: l10n.germinationTitle5,
                  text: l10n.germinationDesc5,
                  icon: Icons.timelapse,
                  nextButtonText: l10n.germinationToDashboard,
                  onNext: _markRootChecked,
                  showBack: true,
                  onBack: () => _jumpToPage(4),
                ),
                // Einzug in die Steinwolle (Index 6)
                _buildSlide(
                  title: l10n.germinationTitle6,
                  text: l10n.germinationDesc6,
                  icon: Icons.eco,
                  nextButtonText: l10n.germinationNext6,
                  onNext: _nextPage,
                  showBack: true,
                  onBack: () => _jumpToPage(4),
                ),
                // Netztopf (Index 6)
                _buildSlide(
                  title: l10n.germinationTitle7,
                  text: l10n.germinationDesc7,
                  icon: Icons.kitchen,
                  nextButtonText: l10n.germinationNext7,
                  onNext: _nextPage,
                  showBack: true,
                ),
                // Finale (Index 7)
                // Eimer (Index 7)
                _buildSlide(
                  title: l10n.germinationTitle8,
                  text: l10n.germinationDesc8,
                  icon: Icons.waves,
                  nextButtonText: l10n.germinationNext8,
                  onNext: _nextPage,
                  showBack: true,
                ),
                // Licht (Index 8)
                _buildLightSlide(l10n),
              ],
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
        ),
      ),
    );
  }

  Widget _buildRootCheckSlide(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Text(
            l10n.germinationTitle4,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.germinationDesc4,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSeedOption(
                icon: '🌰',
                label: l10n.germinationSeedClosed,
                isSelected: _seedOpened == false,
                onTap: () => setState(() => _seedOpened = false),
              ),
              _buildSeedOption(
                icon: '🌱',
                label: l10n.germinationSeedOpened,
                isSelected: _seedOpened == true,
                onTap: () => setState(() => _seedOpened = true),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _seedOpened != null ? AppColors.growGreen : Colors.grey,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: _seedOpened == null
                  ? null
                  : () {
                      if (_seedOpened == true) {
                        _jumpToPage(6);
                      } else {
                        _jumpToPage(5);
                      }
                    },
              child: Text(
                l10n.germinationNextButton,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSeedOption(
      {required String icon,
      required String label,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.growGreen.withOpacity(0.2)
              : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.growGreen : Colors.white24,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 12),
            Text(label,
                style: TextStyle(
                    color: isSelected ? AppColors.growGreen : Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildLightSlide(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.lightbulb, size: 80, color: AppColors.growGreen),
          const SizedBox(height: 32),
          Text(
            l10n.germinationTitle9,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.germinationDesc9,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            icon: const Icon(Icons.camera_alt),
            label: Text(_inputPpfd != null
                ? l10n.checkinMeasurePpfdAgain(_inputPpfd!.toStringAsFixed(0))
                : l10n.checkinMeasurePpfd),
            onPressed: () async {
              final result = await context
                  .push<double>('/ppfd_meter?plantId=${widget.plantId}');
              if (result != null) {
                setState(() {
                  _inputPpfd = result;
                });
              }
            },
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    side: const BorderSide(color: Colors.white54),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: _previousPage,
                  child: Text(l10n.checkinBack),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: _completeGermination,
                  child: Text(
                    l10n.germinationNext9,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
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
    required IconData icon,
    required String nextButtonText,
    required VoidCallback onNext,
    bool showBack = false,
    VoidCallback? onBack,
    String? altButtonText,
    VoidCallback? onAlt,
  }) {
    final l10n = AppLocalizations.of(context)!;
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
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          if (altButtonText != null && onAlt != null) ...[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                side: const BorderSide(color: AppColors.warningAmber),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: onAlt,
              child: Text(altButtonText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.warningAmber)),
            ),
            const SizedBox(height: 16),
          ],
          Row(
            children: [
              if (showBack)
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      side: const BorderSide(color: Colors.white54),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: onBack ?? _previousPage,
                    child: Text(l10n.checkinBack),
                  ),
                ),
              if (showBack) const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: onNext,
                  child: Text(
                    nextButtonText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
