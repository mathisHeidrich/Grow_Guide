import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
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
    if (_plant == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    // Simple implementation of the germination flow
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          
          children: [
            _buildSlide(
              title: 'Das Wasserglas & Die Steinwolle',
              text: 'Fülle ein Glas mit handwarmem Wasser und lass deinen Samen sanft hineinfallen.\n\nLege deinen Steinwollwürfel in Wasser (pH 5.5). Er muss 24h einweichen!',
              icon: Icons.local_drink,
              nextButtonText: 'Erledigt & Weiter',
              onNext: _nextPage,
            ),
            _buildSlide(
              title: 'Die Dunkelheit',
              text: 'Cannabis-Samen sind Dunkelkeimer. Stelle das Glas an einen warmen, absolut dunklen Ort.',
              icon: Icons.nightlight_round,
              nextButtonText: 'Ab in den Schrank',
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: 'Der Warteraum',
              text: 'Lass den Samen nun für 12 bis 24 Stunden im Wasser ruhen. Wir warten darauf, dass sich die Schale öffnet.',
              icon: Icons.hourglass_empty,
              nextButtonText: 'Wurzel prüfen',
              onNext: _nextPage,
              showBack: true,
            ),
            // Wurzel Check (Index 3)
            _buildSlide(
              title: 'Der Wurzel-Check',
              text: 'Hol das Glas aus dem Schrank. Ist die Samenschale aufgeplatzt und zeigt sich eine kleine, weiße Wurzelspitze?',
              icon: Icons.search,
              nextButtonText: 'Wurzel ist da!',
              onNext: () => _jumpToPage(5), // Skip wait screens
              showBack: true,
              altButtonText: 'Noch geschlossen',
              onAlt: () => _jumpToPage(4),
            ),
            // Geduld! (Index 4)
            _buildSlide(
              title: 'Geduld!',
              text: 'Manche Samen brauchen bis zu 48 Stunden. Stelle das Glas wieder in den Schrank und schau morgen noch mal rein.',
              icon: Icons.timelapse,
              nextButtonText: 'Wurzel prüfen',
              onNext: () => _jumpToPage(3),
              showBack: true,
            ),
            // Einzug in die Steinwolle (Index 5)
            _buildSlide(
              title: 'Einzug in die Steinwolle',
              text: 'Setze den Samen etwa 1-2 cm tief in das Pflanzloch deines eingeweichten Steinwollwürfels.\n\nWichtig: Wurzelspitze nach unten!',
              icon: Icons.eco,
              nextButtonText: 'Samen ist eingepflanzt',
              onNext: _nextPage,
              showBack: true,
              onBack: () => _jumpToPage(3),
            ),
            // Netztopf (Index 6)
            _buildSlide(
              title: 'Netztopf & Blähton',
              text: 'Spüle deinen Blähton gut ab. Setze den Steinwollwürfel in den Netztopf und fülle ihn mit Blähton auf.',
              icon: Icons.kitchen,
              nextButtonText: 'Im Netztopf gesichert',
              onNext: _nextPage,
              showBack: true,
            ),
            // Finale (Index 7)
            _buildSlide(
              title: 'DWC-Start & Klima',
              text: 'Hänge den Netztopf in deinen DWC-Eimer.\n\n1. Keine Nährstoffe: Nur reines pH-Wasser.\n2. Pumpe voll an!\n3. Sanftes Licht (18h) bei 24°C.',
              icon: Icons.wb_sunny,
              nextButtonText: 'Keimung abschließen',
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
                    child: const Text('Zurück'),
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
