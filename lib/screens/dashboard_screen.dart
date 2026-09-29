import '../providers/time_provider.dart';
import 'package:app/l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' hide Column;
import '../providers/database_provider.dart';
import '../models/plant.dart';
import '../theme/app_colors.dart';
import '../widgets/tent_dialog.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showAddTentDialog() async {
    final TentsCompanion? newTent = await showDialog<TentsCompanion>(
      context: context,
      builder: (ctx) => const TentDialog(),
    );

    if (newTent != null) {
      final db = ref.read(databaseProvider).db;
      await db.into(db.tents).insert(newTent);
    }
  }

  void _showEditTentDialog(Tent tent) async {
    final TentsCompanion? updatedTent = await showDialog<TentsCompanion>(
      context: context,
      builder: (ctx) => TentDialog(existingTent: tent),
    );

    if (updatedTent != null) {
      final db = ref.read(databaseProvider).db;
      await db
          .update(db.tents)
          .replace(updatedTent.copyWith(id: Value(tent.id)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider).db;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboardTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_home, size: 28),
            tooltip: 'Zelt hinzufügen',
            onPressed: _showAddTentDialog,
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 32),
            onPressed: () => context.go('/add_plant'),
          ),
          IconButton(
            icon: const Icon(Icons.settings, size: 28),
            tooltip: 'Settings',
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: StreamBuilder<List<Tent>>(
        stream: db.select(db.tents).watch(),
        builder: (context, tentSnapshot) {
          if (tentSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final tents = tentSnapshot.data ?? [];

          return StreamBuilder<List<Plant>>(
            stream: db.select(db.plants).watch(),
            builder: (context, plantSnapshot) {
              if (plantSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final plants = plantSnapshot.data ?? [];
              final activePlants = plants
                  .where((p) => p.currentPhase != PlantPhase.archived)
                  .toList();
              final archivedCount = plants.length - activePlants.length;

              if (tents.isEmpty && activePlants.isEmpty) {
                return _buildEmptyState(context, archivedCount);
              }

              final unassignedPlants =
                  activePlants.where((p) => p.tentId == null).toList();
              final pageCount =
                  tents.length + (unassignedPlants.isNotEmpty ? 1 : 0);

              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: pageCount,
                      itemBuilder: (context, index) {
                        if (index < tents.length) {
                          final tent = tents[index];
                          final tentPlants = activePlants
                              .where((p) => p.tentId == tent.id)
                              .toList();
                          return _buildTentPage(context, tent, tentPlants);
                        } else {
                          // Unassigned plants page
                          return _buildUnassignedPage(
                              context, unassignedPlants);
                        }
                      },
                    ),
                  ),
                  if (pageCount > 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: _buildPageIndicators(pageCount),
                    ),
                  if (archivedCount > 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TextButton(
                        onPressed: () => context.push('/archive'),
                        child: Text(l10n.dashboardArchiveButton(archivedCount),
                            style: const TextStyle(color: Colors.white54)),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPageIndicators(int count) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double page =
            _pageController.hasClients ? (_pageController.page ?? 0) : 0;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (index) {
            bool isSelected = (page.round() == index);
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.growGreen : Colors.white24,
              ),
            );
          }),
        );
      },
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
          Text(l10n.dashboardEmptyTitle,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            l10n.dashboardEmptyText,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildTentPage(BuildContext context, Tent tent, List<Plant> plants) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border:
            Border.all(color: AppColors.growGreen.withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    tent.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white54),
                  onPressed: () => _showEditTentDialog(tent),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Lamp Visual
          const Icon(Icons.light, size: 64, color: Colors.amberAccent),
          const SizedBox(height: 8),
          Text(
            tent.lightSchedule,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),

          const Spacer(), // Schiebt die Pflanzen nach unten

          // Pflanzen Grid/Row
          if (plants.isEmpty)
            const Padding(
              padding: EdgeInsets.only(bottom: 64.0),
              child: Text("Dieses Zelt ist leer.\nFüge eine Pflanze hinzu!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54)),
            )
          else ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 32,
                children: plants.map((p) => _buildVisualPlant(p)).toList(),
              ),
            ),
            TextButton.icon(
              onPressed: () => _showEditTentDialog(tent),
              icon: const Icon(Icons.settings, size: 18),
              label: const Text('Zelt & Umgebung verwalten'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.growGreen,
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildUnassignedPage(BuildContext context, List<Plant> plants) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white24, width: 2),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Ohne Zelt",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0, left: 16, right: 16),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 24,
              runSpacing: 32,
              children: plants.map((p) => _buildVisualPlant(p)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisualPlant(Plant plant) {
    final db = ref.read(databaseProvider).db;
    return StreamBuilder<LogEntry?>(
      stream: (db.select(db.logEntries)
            ..where((tbl) => tbl.plantId.equals(plant.id))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
            ..limit(1))
          .watchSingleOrNull(),
      builder: (context, snapshot) {
        final lastLog = snapshot.data;
        final l10n = AppLocalizations.of(context)!;
        Color statusColor = AppColors.growGreen;
        String actionText = l10n.plantStatusAllOk;
        final currentDayInPhase = plant.getDayInPhase(ref.watch(timeProvider));

        if (plant.currentPhase == PlantPhase.germination) {
          if (!plant.germinationStarted) {
            statusColor = AppColors.growGreen;
            actionText = l10n.dashboardStartGermination;
          } else {
            final now = ref.watch(timeProvider);
            final referenceDate = plant.phaseStartDate;
            final elapsedHours = referenceDate != null
                ? now.difference(referenceDate).inHours
                : 0;
            if (elapsedHours < 24) {
              statusColor = AppColors.growGreen;
              actionText = l10n.dashboardWaitGermination;
            } else {
              statusColor = AppColors.warningAmber;
              actionText = l10n.dashboardCheckRoot;
            }
          }
        } else if (plant.currentPhase == PlantPhase.drying) {
          statusColor = AppColors.growGreen;
          actionText = l10n.dashboardDryingFinishedBtn;
        } else {
          bool isOverdue = false;
          bool isWarning = false;

          if (lastLog == null) {
            if (currentDayInPhase > 1) isOverdue = true;
          } else {
            final now = ref.watch(timeProvider);
            final last = lastLog.timestamp;
            final daysDiff = DateTime(now.year, now.month, now.day)
                .difference(DateTime(last.year, last.month, last.day))
                .inDays;
            final hoursSinceLast = now.difference(last).inHours;

            bool isNextDayTriggered(int targetDays) {
              return daysDiff >= targetDays &&
                  (hoursSinceLast >= 12 || daysDiff > targetDays);
            }

            if (!plant.rootsReachedWater) {
              if (isNextDayTriggered(1)) isOverdue = true;
            } else {
              if (isNextDayTriggered(4)) {
                isOverdue = true;
              } else if (isNextDayTriggered(1)) {
                isWarning = true;
              }
            }
          }

          if (isOverdue) {
            statusColor = AppColors.errorRed;
            actionText = l10n.plantStatusOverdue;
          } else if (isWarning) {
            statusColor = AppColors.warningAmber;
            actionText = l10n.plantStatusCheckRecommended;
          }
        }

        IconData plantIcon = Icons.local_florist;
        if (plant.currentPhase == PlantPhase.germination) plantIcon = Icons.spa;
        if (plant.currentPhase == PlantPhase.drying) plantIcon = Icons.dry;

        return GestureDetector(
          onTap: () {
            if (plant.currentPhase == PlantPhase.drying) {
              context.push('/finish_wizard?plantId=${plant.id}');
            } else {
              context.go('/checkin/${plant.id}');
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Plant Icon
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                  border: Border.all(color: statusColor, width: 3),
                ),
                child: Icon(plantIcon, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 8),
              // Name in colored box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  plant.name,
                  style: const TextStyle(
                    color: Colors.black, // Dark text on bright backgrounds
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 80,
                child: Text(
                  actionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
