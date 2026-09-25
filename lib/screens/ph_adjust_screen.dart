import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
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
        child: _buildInput(l10n),
      ),
    );
  }

  Widget _buildInput(AppLocalizations l10n) {
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

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.growGreen,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              // No DB logging, just close.
              context.pop();
            },
            child: Text(l10n.checkinFinishTitle, // 'Erledigt' equivalent string if it makes sense, or general
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
