import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
import '../models/app_settings.dart';

class AppOnboardingScreen extends ConsumerStatefulWidget {
  const AppOnboardingScreen({super.key});

  @override
  ConsumerState<AppOnboardingScreen> createState() => _AppOnboardingScreenState();
}

class _AppOnboardingScreenState extends ConsumerState<AppOnboardingScreen> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeOnboarding(bool goTentSetup) async {
    final db = ref.read(databaseProvider).isar;
    await db.writeTxn(() async {
      final settings = await db.appSettings.get(1);
      if (settings != null) {
        settings.hasCompletedOnboarding = true;
        await db.appSettings.put(settings);
      }
    });

    if (!mounted) return;

    if (goTentSetup) {
      context.go('/tent_setup');
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          
          children: [
            _buildSlide(
              title: 'Growen ohne Erde. Ohne Raten.',
              text: 'Willkommen bei deinem DWC-Companion. Vergiss Erde, Schädlinge und Gießkannen. Wir züchten in sprudelndem Wasser – schneller, sauberer und mit massiven Erträgen.',
              buttonText: 'Weiter',
              onButtonPressed: _nextPage,
            ),
            _buildSlide(
              title: 'Deine tägliche 5-Minuten Routine',
              text: 'Kein Vorwissen nötig. Unser täglicher, bilderbasierter Check-In Wizard nimmt dich jeden Tag an die Hand. Er sagt dir genau, wo du hinsehen musst, und schützt dich vor Anfängerfehlern.',
              buttonText: 'Weiter',
              onButtonPressed: _nextPage,
            ),
            _buildSlide(
              title: 'Nie wieder überdüngen',
              text: 'Du gibst nur deine Messwerte (pH/EC) ein – unsere smarte Rezept-Engine berechnet dir wie ein Thermomix exakt auf den Milliliter genau, was du ins Wasser mischen musst.',
              buttonText: 'Loslegen',
              onButtonPressed: _nextPage,
            ),
            _buildFinalSlide(),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide({
    required String title,
    required String text,
    required String buttonText,
    required VoidCallback onButtonPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          // Placeholder for image
          const Icon(Icons.eco, size: 120, color: Color(0xFF00E676)),
          const SizedBox(height: 48),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00E676),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: onButtonPressed,
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildFinalSlide() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.handyman, size: 120, color: Color(0xFF00E676)),
          const SizedBox(height: 48),
          Text(
            'Lass uns starten!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Hast du dein Zelt schon aufgebaut, oder brauchst du Hilfe beim Schrauben und Verkabeln?',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E1E1E), // Secondary button
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Color(0xFF00E676)),
              ),
            ),
            onPressed: () => _completeOnboarding(true),
            child: const Text(
              'Zelt gemeinsam aufbauen',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00E676),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => _completeOnboarding(false),
            child: const Text(
              'Zelt steht! Zum Dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
