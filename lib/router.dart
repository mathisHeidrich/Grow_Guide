import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers/database_provider.dart';
import 'screens/app_onboarding_screen.dart';
import 'screens/tent_setup_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/add_plant_screen.dart';
import 'screens/checkin_screen.dart';
import 'screens/germination_wizard_screen.dart';
import 'models/plant.dart';
import 'models/app_settings.dart';
import 'screens/ppfd_meter_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final db = ref.watch(databaseProvider).isar;

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      final settings = await db.appSettings.get(1);
      final hasCompletedOnboarding = settings?.hasCompletedOnboarding ?? false;
      // final hasCompletedTentSetup = settings?.hasCompletedTentSetup ?? false;

      if (!hasCompletedOnboarding && state.uri.path != '/onboarding' && state.uri.path != '/tent_setup') {
        return '/onboarding';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const AppOnboardingScreen(),
      ),
      GoRoute(
        path: '/tent_setup',
        builder: (context, state) => const TentSetupScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/add_plant',
        builder: (context, state) => const AddPlantScreen(),
      ),
      GoRoute(
        path: '/checkin/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '');
          if (id == null) return const DashboardScreen();
          
          final plant = db.plants.getSync(id);
          if (plant == null) return const DashboardScreen();
          
          if (plant.currentPhase == PlantPhase.germination || plant.currentPhase == PlantPhase.onboarding) {
            return GerminationWizardScreen(plantId: id);
          }
          
          return CheckinScreen(plantId: id);
        },
      ),
      GoRoute(
        path: '/ppfd_meter',
        builder: (context, state) => const PpfdMeterScreen(),
      ),
    ],
  );
});

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
