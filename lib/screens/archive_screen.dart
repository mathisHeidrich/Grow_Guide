import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/database_provider.dart';
import '../database/tables.dart' show PlantPhase, Plants;
import 'package:app/l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class ArchiveScreen extends ConsumerWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final db = ref.watch(databaseProvider).db;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.archiveTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: StreamBuilder<List<dynamic>>(
        // Using dynamic here just to bypass type issues with drift's generated classes in this generic context
        stream: (db.select(db.plants)..where((tbl) => tbl.currentPhase.equals(PlantPhase.archived.index))).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red)));
          }

          final archivedPlants = snapshot.data ?? [];
          if (archivedPlants.isEmpty) {
            return Center(
              child: Text(
                l10n.archiveNoPlants,
                style: const TextStyle(color: Colors.white54, fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: archivedPlants.length,
            itemBuilder: (context, index) {
              final plant = archivedPlants[index];
              
              int days = 0;
              if (plant.startDate != null && plant.endDate != null) {
                days = plant.endDate!.difference(plant.startDate!).inDays;
              }

              return Card(
                color: AppColors.surface,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            plant.name,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const Icon(Icons.inventory_2, color: AppColors.growGreen),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildStatItem(
                              context,
                              icon: Icons.scale,
                              label: l10n.archiveYield,
                              value: '${plant.yieldGrams?.toStringAsFixed(1) ?? "0.0"} g',
                            ),
                          ),
                          Expanded(
                            child: _buildStatItem(
                              context,
                              icon: Icons.calendar_today,
                              label: l10n.archiveDays,
                              value: '$days ${l10n.archiveDays}',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, {required IconData icon, required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: Colors.white54),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
