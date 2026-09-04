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
import 'screens/ppfd_meter_screen.dart';
import 'screens/hardware_advisor_screen.dart';
import 'screens/water_guide_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final db = ref.watch(databaseProvider).db;

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      final settings = await (db.select(db.appSettingsTable)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();
      final hasCompletedOnboarding = settings?.hasCompletedOnboarding ?? false;
      
      final isAllowedPath = state.uri.path == '/onboarding' || 
                            state.uri.path == '/hardware_advisor' || 
                            state.uri.path == '/water_guide' || 
                            state.uri.path == '/tent_setup';

      if (!hasCompletedOnboarding && !isAllowedPath) {
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
        path: '/hardware_advisor',
        builder: (context, state) => const HardwareAdvisorScreen(),
      ),
      GoRoute(
        path: '/water_guide',
        builder: (context, state) => const WaterGuideScreen(),
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
          
          return FutureBuilder<Plant?>(
            future: (db.select(db.plants)..where((tbl) => tbl.id.equals(id))).getSingleOrNull(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(body: Center(child: CircularProgressIndicator()));
              }
              
              final plant = snapshot.data;
              if (plant == null) return const DashboardScreen();
              
              if (plant.currentPhase == PlantPhase.germination || plant.currentPhase == PlantPhase.onboarding) {
                return GerminationWizardScreen(plantId: id);
              }
              
              return CheckinScreen(plantId: id);
            },
          );
        },
      ),
      GoRoute(
        path: '/ppfd_meter',
        builder: (context, state) {
          final plantIdStr = state.uri.queryParameters['plantId'];
          final plantId = plantIdStr != null ? int.tryParse(plantIdStr) : null;
          return PpfdMeterScreen(plantId: plantId);
        },
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
