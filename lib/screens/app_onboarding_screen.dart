import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppOnboardingScreen extends ConsumerStatefulWidget {
  const AppOnboardingScreen({super.key});

  @override
  ConsumerState<AppOnboardingScreen> createState() =>
      _AppOnboardingScreenState();
}

class _AppOnboardingScreenState extends ConsumerState<AppOnboardingScreen> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            _buildSlide(
              title: l10n.onboardingTitle1,
              text: l10n.onboardingText1,
              buttonText: l10n.onboardingNextButton,
              onButtonPressed: _nextPage,
            ),
            _buildSlide(
              title: l10n.onboardingTitle2,
              text: l10n.onboardingText2,
              buttonText: l10n.onboardingNextButton,
              onButtonPressed: _nextPage,
            ),
            _buildSlide(
              title: l10n.onboardingTitle3,
              text: l10n.onboardingText3,
              buttonText: l10n.onboardingStartButton,
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
    final l10n = AppLocalizations.of(context)!;
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
            l10n.onboardingFinalTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            "Bevor wir loslegen, schauen wir uns an, was du für deinen Grow brauchst.",
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
            onPressed: () => context.go('/hardware_advisor'),
            child: const Text(
              "Weiter zum Hardware-Ratgeber",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
