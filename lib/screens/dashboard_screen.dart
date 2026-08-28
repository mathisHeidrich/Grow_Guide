import '../providers/time_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../providers/database_provider.dart';
import '../models/plant.dart';
import '../theme/app_colors.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider).isar;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meine DWC Pflanzen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 32),
            onPressed: () => context.go('/add_plant'),
          ),
        ],
      ),
      body: FutureBuilder<List<Plant>>(
        future: db.plants.where().findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final plants = snapshot.data ?? [];
          final activePlants = plants
              .where((p) => p.currentPhase != PlantPhase.archived)
              .toList();
          final archivedCount = plants.length - activePlants.length;

          if (activePlants.isEmpty) {
            return _buildEmptyState(context, archivedCount);
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: activePlants.length + (archivedCount > 0 ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < activePlants.length) {
                return _buildPlantCard(context, activePlants[index]);
              } else {
                return _buildArchiveButton(context, archivedCount);
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, int archivedCount) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.eco_outlined,
              size: 80, color: AppColors.textSecondary),
          const SizedBox(height: 24),
          Text(
            'Dein Zelt ist leer.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            'Drücke das + um eine Pflanze hinzuzufügen.',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.textSecondary),
          ),
          if (archivedCount > 0) ...[
            const SizedBox(height: 48),
            _buildArchiveButton(context, archivedCount, centered: true),
          ]
        ],
      ),
    );
  }

  Widget _buildPlantCard(BuildContext context, Plant plant) {
    // Determine card status based on measurement history
    Color btnColor = AppColors.growGreen;
    String btnText = 'Check ok';

    if (plant.measurementHistory.isNotEmpty) {
      final lastLog = plant.measurementHistory.last;
      final hoursSinceLast =
          ref.watch(timeProvider).difference(lastLog.timestamp).inHours;
      final isPhOut = lastLog.ph < 5.5 || lastLog.ph > 6.3;

      if (hoursSinceLast >= 96 || isPhOut) {
        btnColor = AppColors.errorRed;
        btnText = 'Check dringend nötig';
      } else if (hoursSinceLast >= 48) {
        btnColor = AppColors.warningAmber;
        btnText = 'Check empfohlen';
      }
    } else {
      // No checks yet
      btnColor = AppColors.errorRed;
      btnText = 'Erster Check nötig';
    }

    String phaseText = '';
    switch (plant.currentPhase) {
      case PlantPhase.onboarding:
        phaseText = 'Onboarding';
        break;
      case PlantPhase.germination:
        phaseText = 'Keimung';
        break;
      case PlantPhase.veg:
        phaseText = 'Wachstum (Tag ${plant.currentDayInPhase})';
        break; // Could calculate weeks later
      case PlantPhase.flower:
        phaseText = 'Blüte (Tag ${plant.currentDayInPhase})';
        break;
      case PlantPhase.drying:
        phaseText = 'Trocknung';
        break;
      case PlantPhase.curing:
        phaseText = 'Curing';
        break;
      case PlantPhase.archived:
        phaseText = 'Archiviert';
        break;
    }

    String brandText = plant.nutrientBrand.toString().split('.').last;

    String lastCheckText = 'Letzter Check: Nie';
    if (plant.measurementHistory.isNotEmpty) {
      final days = ref.watch(timeProvider)
          .difference(plant.measurementHistory.last.timestamp)
          .inDays;
      if (days == 0) {
        lastCheckText = 'Letzter Check: heute';
      } else if (days == 1) {
        lastCheckText = 'Letzter Check: gestern';
      } else {
        lastCheckText = 'Letzter Check: vor $days Tagen';
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => context.go('/checkin/${plant.id}'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${plant.name} • ${plant.waterVolumeLiters.toInt()} L Eimer',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      // Show bottom sheet or navigate to edit
                      context.go('/edit_plant/${plant.id}');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '$phaseText • $brandText',
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 4),
              Text(
                lastCheckText,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btnColor,
                    foregroundColor: btnColor == AppColors.growGreen ||
                            btnColor == AppColors.warningAmber
                        ? Colors.black
                        : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => context.go('/checkin/${plant.id}'),
                  child: Text(
                    btnText,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArchiveButton(BuildContext context, int archivedCount,
      {bool centered = false}) {
    return Padding(
      padding: EdgeInsets.only(top: centered ? 0 : 24, bottom: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textWhite,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () => context.go('/archive'),
        child: Text(
          centered
              ? 'Ernte-Archiv ansehen ($archivedCount erfolgreiche Grows)'
              : 'Ernte-Archiv ($archivedCount Grows)',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
