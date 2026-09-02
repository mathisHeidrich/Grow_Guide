import '../providers/time_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboardTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 32),
            onPressed: () => context.go('/add_plant'),
          ),
        ],
      ),
      body: StreamBuilder<List<Plant>>(
        stream: db.plants.where().watch(fireImmediately: true),
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
                return _buildPlantCard(context, ref, activePlants[index]);
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
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.eco_outlined,
              size: 80, color: AppColors.textSecondary),
          const SizedBox(height: 24),
          Text(
            l10n.dashboardEmptyTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.dashboardEmptyText,
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

  Widget _buildPlantCard(BuildContext context, WidgetRef ref, Plant plant) {
    final l10n = AppLocalizations.of(context)!;
    // Determine card status based on measurement history
    Color btnColor = AppColors.growGreen;
    String btnText = l10n.plantStatusAllOk;
    
    final currentDayInPhase = plant.getDayInPhase(ref.watch(timeProvider));

    if (plant.currentPhase == PlantPhase.germination) {
      if (!plant.germinationStarted) {
        btnColor = AppColors.growGreen;
        btnText = l10n.dashboardStartGermination;
      } else {
        final now = ref.watch(timeProvider);
        final referenceDate = plant.lastGerminationCheck ?? plant.phaseStartDate;
        final elapsedHours = referenceDate != null 
            ? now.difference(referenceDate).inHours 
            : 0;
            
        if (elapsedHours < 12) {
          btnColor = AppColors.growGreen;
          btnText = l10n.dashboardWaitGermination;
        } else {
          btnColor = AppColors.growGreen;
          btnText = l10n.dashboardCheckRoot;
        }
      }
    } else {
      bool isOverdue = false;
      bool isWarning = false;

      if (plant.measurementHistory.isEmpty) {
        if (currentDayInPhase > 1) {
          isOverdue = true; 
        }
      } else {
        final now = ref.watch(timeProvider);
        final last = plant.measurementHistory.last.timestamp;
        
        final daysDiff = DateTime(now.year, now.month, now.day)
            .difference(DateTime(last.year, last.month, last.day))
            .inDays;
        final hoursSinceLast = now.difference(last).inHours;
        
        bool isNextDayTriggered(int targetDays) {
          return daysDiff >= targetDays && (hoursSinceLast >= 12 || daysDiff > targetDays);
        }

        if (!plant.rootsReachedWater) {
          if (isNextDayTriggered(1)) {
            isOverdue = true;
          }
        } else {
          if (isNextDayTriggered(4)) {
            isOverdue = true;
          } else if (isNextDayTriggered(1)) {
            isWarning = true;
          }
        }
      }

      if (isOverdue) {
        btnColor = AppColors.errorRed;
        btnText = l10n.plantStatusOverdue;
      } else if (isWarning) {
        btnColor = AppColors.warningAmber;
        btnText = l10n.plantStatusCheckRecommended;
      }
    }

    String phaseText = '';
    switch (plant.currentPhase) {
      case PlantPhase.onboarding:
        phaseText = l10n.phaseOnboarding;
        break;
      case PlantPhase.germination:
        phaseText = l10n.phaseGermination;
        break;
      case PlantPhase.veg:
        phaseText = l10n.phaseVeg(currentDayInPhase);
        break; // Could calculate weeks later
      case PlantPhase.flower:
        phaseText = l10n.phaseFlower(currentDayInPhase);
        break;
      case PlantPhase.drying:
        phaseText = l10n.phaseDrying;
        break;
      case PlantPhase.curing:
        phaseText = l10n.phaseCuring;
        break;
      case PlantPhase.archived:
        phaseText = l10n.phaseArchived;
        break;
    }

    String brandText = plant.nutrientBrand.toString().split('.').last;

    String lastCheckText = l10n.lastCheckNever;
    if (plant.measurementHistory.isNotEmpty) {
      final days = ref.watch(timeProvider)
          .difference(plant.measurementHistory.last.timestamp)
          .inDays;
      if (days == 0) {
        lastCheckText = l10n.lastCheckToday;
      } else if (days == 1) {
        lastCheckText = l10n.lastCheckYesterday;
      } else {
        lastCheckText = l10n.lastCheckDaysAgo(days);
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
                      l10n.plantBucketText(plant.name, plant.waterVolumeLiters.toInt()),
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
    final l10n = AppLocalizations.of(context)!;
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
              ? l10n.dashboardArchiveButtonCenter(archivedCount)
              : l10n.dashboardArchiveButton(archivedCount),
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
