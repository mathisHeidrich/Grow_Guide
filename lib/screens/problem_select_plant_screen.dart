import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
import '../models/plant.dart';
import 'package:app/l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class ProblemSelectPlantScreen extends ConsumerWidget {
  const ProblemSelectPlantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider).db;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.problemSelectPlantPrompt),
      ),
      body: StreamBuilder<List<Plant>>(
        stream: db.select(db.plants).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final plants = snapshot.data ?? [];
          final activePlants = plants.where((p) => p.currentPhase != PlantPhase.archived).toList();

          if (activePlants.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  l10n.dashboardEmptyText,
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: activePlants.length,
            itemBuilder: (context, index) {
              final plant = activePlants[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  leading: const Icon(Icons.eco, color: AppColors.growGreen, size: 32),
                  title: Text(
                    plant.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${plant.waterVolumeLiters.toInt()} L Eimer'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    context.pushReplacement('/problems?plantId=${plant.id}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
