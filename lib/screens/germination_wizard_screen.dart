import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/plant.dart';
import '../theme/app_colors.dart';

class GerminationWizardScreen extends ConsumerStatefulWidget {
  final int plantId;
  const GerminationWizardScreen({super.key, required this.plantId});

  @override
  ConsumerState<GerminationWizardScreen> createState() => _GerminationWizardScreenState();
}

class _GerminationWizardScreenState extends ConsumerState<GerminationWizardScreen> {
  final PageController _pageController = PageController();
  Plant? _plant;

  @override
  void initState() {
    super.initState();
    _loadPlant();
  }

  Future<void> _loadPlant() async {
    final db = ref.read(databaseProvider).isar;
    final plant = await db.plants.get(widget.plantId);
    if (mounted && plant != null) {
      setState(() => _plant = plant);
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

  Future<void> _completeGermination() async {
    if (_plant == null) return;
    
    final db = ref.read(databaseProvider).isar;
    await db.writeTxn(() async {
      _plant!.currentPhase = PlantPhase.veg;
      _plant!.currentDayInPhase = 1;
      await db.plants.put(_plant!);
    });

    if (mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_plant == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    // Simple implementation of the germination flow
    return Scaffold(
      body: SafeArea(
        child: PageView(
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
              nextButtonText: l10n.germinationNext5,
              onNext: _nextPage,
              showBack: true,
            ),
            // Wurzel Check (Index 3)
            _buildSlide(
              title: l10n.germinationTitle4,
              text: l10n.germinationDesc4,
              icon: Icons.search,
              nextButtonText: l10n.germinationNext4,
              onNext: () => _jumpToPage(5), // Skip wait screens
              showBack: true,
              altButtonText: l10n.germinationAlt4,
              onAlt: () => _jumpToPage(4),
            ),
            // Geduld! (Index 4)
            _buildSlide(
              title: l10n.germinationTitle5,
              text: l10n.germinationDesc5,
              icon: Icons.timelapse,
              nextButtonText: l10n.germinationNext5,
              onNext: () => _jumpToPage(3),
              showBack: true,
            ),
            // Einzug in die Steinwolle (Index 5)
            _buildSlide(
              title: l10n.germinationTitle6,
              text: l10n.germinationDesc6,
              icon: Icons.eco,
              nextButtonText: l10n.germinationNext6,
              onNext: _nextPage,
              showBack: true,
              onBack: () => _jumpToPage(3),
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
            _buildSlide(
              title: l10n.germinationTitle8,
              text: l10n.germinationDesc8,
              icon: Icons.wb_sunny,
              nextButtonText: l10n.germinationNext8,
              onNext: _completeGermination,
              showBack: true,
            ),
          ],
        ),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: onAlt,
              child: Text(altButtonText, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.warningAmber)),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
