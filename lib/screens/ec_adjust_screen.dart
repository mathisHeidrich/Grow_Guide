import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' as drift;
import '../providers/database_provider.dart';
import '../providers/time_provider.dart';
import '../models/plant.dart';
import 'package:app/l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../services/nutrient_service.dart';

class EcAdjustScreen extends ConsumerStatefulWidget {
  final int plantId;
  const EcAdjustScreen({super.key, required this.plantId});

  @override
  ConsumerState<EcAdjustScreen> createState() => _EcAdjustScreenState();
}

class _EcAdjustScreenState extends ConsumerState<EcAdjustScreen> {
  Plant? _plant;
  double? _inputEc;
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _loadPlant();
  }

  Future<void> _loadPlant() async {
    final db = ref.read(databaseProvider).db;
    final plant = await (db.select(db.plants)
          ..where((tbl) => tbl.id.equals(widget.plantId)))
        .getSingleOrNull();
    if (mounted) {
      setState(() {
        _plant = plant;
      });
    }
  }

  Future<void> _saveLog() async {
    if (_plant == null || _inputEc == null) return;
    
    final db = ref.read(databaseProvider).db;
    await db.into(db.logEntries).insert(
      LogEntriesCompanion.insert(
        plantId: _plant!.id,
        timestamp: ref.read(timeProvider),
        ec: drift.Value(_inputEc!),
      ),
    );
    
    if (mounted) {
      setState(() {
        _isSaved = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    if (_plant == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.problemActionEcAdjust),
      ),
      body: SafeArea(
        child: _isSaved ? _buildSuccess(l10n) : _buildInput(l10n),
      ),
    );
  }

  Widget _buildInput(AppLocalizations l10n) {
    int weekIndex = 0;
    if (_plant!.phaseStartDate != null) {
      final now = ref.read(timeProvider);
      weekIndex = now.difference(_plant!.phaseStartDate!).inDays ~/ 7;
    }

    final schedule = NutrientService.getScheduleForBrand(_plant!.nutrientBrand);
    double targetEc = schedule.getTargetEc(_plant!.currentPhase, weekIndex);

    bool isEcTooHigh = false;
    bool hasNutrientsToAdd = false;
    List<NutrientAmount> nutrientsToAdd = [];

    if (_inputEc != null) {
      isEcTooHigh = _inputEc! > (targetEc + 0.3);
      final nutes = NutrientService.calculateNutrients(
          brand: _plant!.nutrientBrand,
          phase: _plant!.currentPhase, 
          weekIndex: weekIndex,
          waterAddedLiters: 0, // standalone adjust assumes no new water added, just fixing current
          totalVolumeLiters: _plant!.waterVolumeLiters,
          currentEc: _inputEc!,
      );
      nutrientsToAdd = nutes.nutrients.where((n) => n.amountMl >= 0.1).toList();
      hasNutrientsToAdd = nutrientsToAdd.isNotEmpty;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.science, size: 80, color: AppColors.growGreen),
          const SizedBox(height: 24),
          Text(l10n.checkinEcMeasureTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(l10n.checkinEcMeasureDesc,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center),
          const SizedBox(height: 32),
          TextFormField(
            decoration: InputDecoration(
                labelText: l10n.checkinEcLabel,
                border: const OutlineInputBorder()),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (val) => setState(
                () => _inputEc = double.tryParse(val.replaceAll(',', '.'))),
          ),
          const SizedBox(height: 32),
          
          if (_inputEc != null) ...[
            if (isEcTooHigh) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.redAccent)
                ),
                child: Column(
                  children: [
                    const Icon(Icons.warning, color: Colors.redAccent, size: 40),
                    const SizedBox(height: 8),
                    Text(
                      l10n.checkinEcTooHighPartial,
                      style: const TextStyle(color: Colors.redAccent, fontSize: 16),
                      textAlign: TextAlign.center
                    ),
                  ],
                ),
              )
            ] else if (hasNutrientsToAdd) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.checkinNutrientDesc,
                      style: const TextStyle(color: Colors.white70, fontSize: 16)),
                    const SizedBox(height: 16),
                    ...nutrientsToAdd.map((n) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                          "${n.name}: ${n.amountMl.toStringAsFixed(1)} ml",
                          style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                    )),
                  ],
                ),
              )
            ] else ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.growGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.growGreen)
                ),
                child: Text(l10n.checkinNutrientNone,
                    style: const TextStyle(color: AppColors.growGreen, fontSize: 16),
                    textAlign: TextAlign.center),
              )
            ],
            
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.growGreen,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: _saveLog,
              child: Text(l10n.checkinSaveValues,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildSuccess(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.check_circle, size: 100, color: AppColors.growGreen),
          const SizedBox(height: 24),
          Text(
            l10n.checkinFinishTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surface,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () => context.pop(),
            child: const Text('Zurück', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
