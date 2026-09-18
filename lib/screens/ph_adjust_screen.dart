import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' as drift;
import '../providers/database_provider.dart';
import '../providers/time_provider.dart';
import '../models/plant.dart';
import 'package:app/l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class PhAdjustScreen extends ConsumerStatefulWidget {
  final int plantId;
  const PhAdjustScreen({super.key, required this.plantId});

  @override
  ConsumerState<PhAdjustScreen> createState() => _PhAdjustScreenState();
}

class _PhAdjustScreenState extends ConsumerState<PhAdjustScreen> {
  Plant? _plant;
  double? _inputPh;
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
    if (_plant == null || _inputPh == null) return;
    
    final db = ref.read(databaseProvider).db;
    await db.into(db.logEntries).insert(
      LogEntriesCompanion.insert(
        plantId: _plant!.id,
        timestamp: ref.read(timeProvider),
        ph: drift.Value(_inputPh!),
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
        title: Text(l10n.problemActionPhAdjust),
      ),
      body: SafeArea(
        child: _isSaved ? _buildSuccess(l10n) : _buildInput(l10n),
      ),
    );
  }

  Widget _buildInput(AppLocalizations l10n) {
    bool? isPhOk;
    if (_inputPh != null) {
      isPhOk = _inputPh! >= 5.5 && _inputPh! <= 6.5;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.science_outlined, size: 80, color: AppColors.growGreen),
          const SizedBox(height: 24),
          Text(l10n.checkinPhAdjustTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(l10n.checkinPhAdjustDesc,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center),
          const SizedBox(height: 32),
          TextFormField(
            decoration: InputDecoration(
                labelText: l10n.checkinPhLabel,
                border: const OutlineInputBorder()),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (val) => setState(
                () => _inputPh = double.tryParse(val.replaceAll(',', '.'))),
          ),
          const SizedBox(height: 32),
          
          if (_inputPh != null && isPhOk != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isPhOk ? AppColors.growGreen.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isPhOk ? AppColors.growGreen : Colors.orange)
              ),
              child: Column(
                children: [
                  Icon(isPhOk ? Icons.check_circle : Icons.warning,
                      size: 40, color: isPhOk ? AppColors.growGreen : Colors.orange),
                  const SizedBox(height: 8),
                  Text(
                    isPhOk ? l10n.checkinPhStatusOk : l10n.checkinPhStatusAdjust,
                    style: TextStyle(
                      color: isPhOk ? AppColors.growGreen : Colors.orange, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
            
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
