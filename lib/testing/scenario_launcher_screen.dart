import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';
import '../providers/database_provider.dart';
import '../providers/time_provider.dart';
import 'mock_database_service.dart';
import 'scenarios.dart';
import 'time_travel_overlay.dart';

class ScenarioLauncherScreen extends StatelessWidget {
  const ScenarioLauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scenarios = TestScenario.all;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🧪 Scenario Launcher'),
        backgroundColor: Colors.purple.shade900,
      ),
      body: ListView.builder(
        itemCount: scenarios.length,
        itemBuilder: (context, index) {
          final scenario = scenarios[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(scenario.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(scenario.description),
              trailing: const Icon(Icons.play_arrow, color: Colors.greenAccent),
              onTap: () => _launchScenario(context, scenario),
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchScenario(
      BuildContext context, TestScenario scenario) async {
    // Show a loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // 1. Initialize Mock Database
      final mockDb = MockDatabaseService(scenario);
      await mockDb.init();

      if (!context.mounted) return;

      // 2. Launch the app with overrides
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProviderScope(
            overrides: [
              databaseProvider.overrideWithValue(mockDb),
              timeProvider
                  .overrideWith(() => MockTimeNotifier(scenario.startTime)),
            ],
            child: const TimeTravelOverlay(
              child: GrowGuideApp(),
            ),
          ),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      Navigator.of(context).pop(); // dismiss loading
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}
