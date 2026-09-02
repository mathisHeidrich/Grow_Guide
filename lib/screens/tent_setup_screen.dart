import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final db = ref.read(databaseProvider).db;
    final settings = await (db.select(db.appSettingsTable)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();
    if (settings != null) {
      final updatedSettings = settings.copyWith(
        hasCompletedTentSetup: true,
        hasCompletedOnboarding: true,
      );
      await db.update(db.appSettingsTable).replace(updatedSettings);
    }

    if (!mounted) return;
    context.go('/'); // Go to dashboard
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // Force using buttons
          children: [
            _buildIntroSlide(),
            _buildSlide(
              title: l10n.tentTitle1,
              text: l10n.tentDesc1,
              icon: Icons.place,
              nextButtonText: l10n.tentNext1,
              onNext: _nextPage,
            ),
            _buildSlide(
              title: l10n.tentTitle2,
              text: l10n.tentDesc2,
              icon: Icons.air,
              nextButtonText: l10n.tentNext2,
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: l10n.tentTitle3,
              text: l10n.tentDesc3,
              icon: Icons.lightbulb,
              nextButtonText: l10n.tentNext3,
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: l10n.tentTitle4,
              text: l10n.tentDesc4,
              icon: Icons.cyclone,
              nextButtonText: l10n.tentNext4,
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: l10n.tentTitle5,
              text: l10n.tentDesc5,
              icon: Icons.water,
              nextButtonText: l10n.tentNext5,
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: l10n.tentTitle6,
              text: l10n.tentDesc6,
              icon: Icons.warning,
              iconColor: const Color(0xFFFF5252),
              nextButtonText: l10n.tentNext6,
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: l10n.tentTitle7,
              text: l10n.tentDesc7,
              icon: Icons.timer,
              nextButtonText: l10n.tentNext7,
              onNext: _nextPage,
              showBack: true,
            ),
            _buildSlide(
              title: l10n.tentTitle8,
              text: l10n.tentDesc8,
              icon: Icons.check_circle,
              nextButtonText: l10n.tentNext8,
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
    final l10n = AppLocalizations.of(context)!;
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
                    child: Text(l10n.checkinBack),
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

  Widget _buildIntroSlide() {
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
            l10n.tentIntroTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.tentIntroDesc,
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
            onPressed: _nextPage,
            child: Text(
              l10n.tentIntroNext,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            onPressed: _completeSetup,
            child: Text(
              l10n.tentIntroSkip,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
