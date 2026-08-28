import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
import '../models/app_settings.dart';

class TentSetupScreen extends ConsumerStatefulWidget {
  const TentSetupScreen({super.key});

  @override
  ConsumerState<TentSetupScreen> createState() => _TentSetupScreenState();
}

class _TentSetupScreenState extends ConsumerState<TentSetupScreen> {
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

  Future<void> _completeSetup() async {
    final db = ref.read(databaseProvider).isar;
    await db.writeTxn(() async {
      final settings = await db.appSettings.get(1);
      if (settings != null) {
        settings.hasCompletedTentSetup = true;
        await db.appSettings.put(settings);
      }
    });

    if (!mounted) return;
    context.go('/'); // Go to dashboard
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // Force using buttons
          children: [
            _buildSlide(
              title: 'Station 1: Standort & Fundament',
              text: 'Bevor du das Zelt aufbaust, wähle den richtigen Ort! Dein Zelt braucht Zugang zu Frischluft und ein Fenster in der Nähe für die Abluft.\n\nWenn dein Boden kalt ist, lege unbedingt eine Isolationsmatte unter das Zelt. Vergiss die wasserdichte Einlegewanne nicht!',
              icon: Icons.place,
              nextButtonText: 'Zelt steht & ist isoliert',
              onNext: _nextPage,
            ),
            _buildSlide(
              title: 'Station 2: Abluft & Geruchskontrolle',
              text: 'Hänge den Aktivkohlefilter (AKF) ganz oben unter die Zeltdecke. Verbinde ihn absolut luftdicht mit dem Rohrventilator und führe den Abluftschlauch nach draußen.\n\nNutze Schlauchschellen oder starkes Panzertape!',
              icon: Icons.air,
              nextButtonText: 'Abluft hängt bombensicher',
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: 'Station 3: Die Sonne (Licht & Kabel)',
              text: 'Bringe nun deine Grow-Lampe mittig im Zelt an. Nutze dafür stufenlos verstellbare Seilzugratschen. Führe das Stromkabel der Lampe sauber nach außen.',
              icon: Icons.lightbulb,
              nextButtonText: 'Lampe hängt',
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: 'Station 4: Der Wind (Umluft)',
              text: 'Klemme deine Ventilatoren an die seitlichen Zeltstangen. Ideal sind zwei Stück: Einer bläst später über das Blätterdach, der andere sorgt unterhalb der Blätter für Zirkulation.',
              icon: Icons.cyclone,
              nextButtonText: 'Ventilatoren montiert',
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: 'Station 5: DWC Eimer & Schläuche',
              text: 'Platziere deine leeren DWC-Eimer mittig unter der Lampe. Führe die leeren Luftschläuche durch die ganz unteren Zeltöffnungen nach draußen zur Luftpumpe. Schläuche nicht knicken!',
              icon: Icons.water,
              nextButtonText: 'Eimer positioniert',
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: 'Station 6: Strom & Luftpumpe',
              text: '⚠️ DIE WICHTIGSTE REGEL!\nWasser und Strom vertragen sich nicht.\n\n1. Steckdosen NIEMALS auf den Zeltboden legen!\n2. Die Luftpumpe MUSS außerhalb des Zelts und physisch höher stehen als der Wasserspiegel im Eimer.',
              icon: Icons.warning,
              iconColor: const Color(0xFFFF5252),
              nextButtonText: 'Verstanden & geprüft',
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: 'Station 7: Steuerung & Zeitschaltuhren',
              text: 'Verbinde jetzt alles mit dem Strom:\n\n1. Lampe: In die Zeitschaltuhr (noch nicht einstellen).\n2. Abluft & Umluft: Dauerstrom.\n3. Luftpumpe: Zwingend Dauerstrom (24/7).',
              icon: Icons.timer,
              nextButtonText: 'Alles verkabelt',
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: 'Station 8: Unterdruck & Lichtlecks',
              text: 'Der letzte Test! Schließe das Zelt.\n\n1. Unterdruck-Check: Ziehen sich die Zeltwände nach innen? Perfekt!\n2. Lichtleck-Check: Licht im Zimmer aus. Dringt irgendwo starkes Licht aus dem Zelt? Klette unnötige Öffnungen zu.',
              icon: Icons.check_circle,
              nextButtonText: 'Setup abgeschlossen!',
              onNext: _completeSetup,
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
    Color iconColor = const Color(0xFF00E676),
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
          Icon(icon, size: 100, color: iconColor),
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
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: _previousPage,
                    child: const Text('Zurück'),
                  ),
                ),
              if (showBack) const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E676),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
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
