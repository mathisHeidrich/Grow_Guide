import '../providers/time_provider.dart';
import 'package:drift/drift.dart' as drift;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/plant.dart';
import '../theme/app_colors.dart';


class CheckinScreen extends ConsumerStatefulWidget {
  final int plantId;
  const CheckinScreen({super.key, required this.plantId});

  @override
  ConsumerState<CheckinScreen> createState() => _CheckinScreenState();
}

class _CheckinScreenState extends ConsumerState<CheckinScreen> {
  final PageController _pageController = PageController();
  Plant? _plant;
  bool? _initialRootsNotReached;
  bool? _tempRootsInWater;
  
  double? _inputPh;
  double? _inputEc;
  double? _inputPpfd;

  @override
  void initState() {
    super.initState();
    _loadPlant();
  }

  Future<void> _loadPlant() async {
    final db = ref.read(databaseProvider).db;
    final plant = await (db.select(db.plants)..where((tbl) => tbl.id.equals(widget.plantId))).getSingleOrNull();
    if (mounted && plant != null) {
      setState(() {
        _plant = plant;
        _initialRootsNotReached ??= _plant!.currentPhase == PlantPhase.veg && !_plant!.rootsReachedWater;
      });
    }
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  
  Future<void> _completeCheckin() async {
    if (_plant == null) return;
    
    if (_inputPh != null && _inputEc != null) {
      final db = ref.read(databaseProvider).db;
      await db.into(db.logEntries).insert(
        LogEntriesCompanion.insert(
          plantId: _plant!.id,
          timestamp: ref.read(timeProvider),
          ph: _inputPh!,
          ec: _inputEc!,
          ppfd: _inputPpfd != null ? drift.Value(_inputPpfd!) : const drift.Value.absent(),
        ),
      );
    }

    if (mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_plant == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              
              children: [
                if (_initialRootsNotReached == true) ...[
                  _buildRootsCheckSlide(),
                  if (_tempRootsInWater == false) _buildTopWateringSlide(),
                ],
                _buildSlide(
                  title: l10n.checkinHealthTitle,
                  text: l10n.checkinHealthDesc,
                  icon: Icons.eco,
                  nextButtonText: l10n.checkinHealthNext,
                  onNext: _nextPage,
                  showBack: _initialRootsNotReached == true,
                ),
                if (_initialRootsNotReached != true || _tempRootsInWater == true) ...[
                  _buildMeasurementSlide(),
                  _buildAdjustmentExampleSlide(),
                ],
                _buildLampSlide(),
                _buildSlide(
                  title: l10n.checkinFinishTitle,
                  text: l10n.checkinFinishDesc,
                  icon: Icons.check_circle,
                  nextButtonText: l10n.checkinFinishNext,
                  onNext: _completeCheckin,
                  showBack: true,
                ),
              ],
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white54, size: 32),
                onPressed: () => context.go('/'),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildRootsCheckSlide() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.grass, size: 80, color: Colors.green),
          const SizedBox(height: 32),
          Text(
            l10n.checkinRootsCheckTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.checkinRootsCheckDesc,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: Center(child: Text(l10n.checkinRootsCheckYes, style: const TextStyle(fontSize: 18))),
                  selected: _tempRootsInWater == true,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  onSelected: (selected) {
                    setState(() {
                      _tempRootsInWater = true;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ChoiceChip(
                  label: Center(child: Text(l10n.checkinRootsCheckNo, style: const TextStyle(fontSize: 18))),
                  selected: _tempRootsInWater == false,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  onSelected: (selected) {
                    setState(() {
                      _tempRootsInWater = false;
                    });
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.growGreen,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () async {
              if (_tempRootsInWater == null) {
                return;
              }
              if (_tempRootsInWater == true) {
                final db = ref.read(databaseProvider).db;
                final updatedPlant = _plant!.copyWith(rootsReachedWater: true);
                await db.update(db.plants).replace(updatedPlant);
                setState(() {
                  _plant = updatedPlant;
                });
              }
              _nextPage();
            },
            child: Text(
              l10n.checkinNext,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTopWateringSlide() {
    final l10n = AppLocalizations.of(context)!;
    return _buildSlide(
      title: l10n.checkinWateringTitle,
      text: l10n.checkinWateringDesc,
      icon: Icons.water_drop,
      nextButtonText: l10n.checkinNext,
      onNext: _nextPage,
      showBack: true,
    );
  }

  Widget _buildAdjustmentExampleSlide() {
    final l10n = AppLocalizations.of(context)!;
    return _buildSlide(
      title: l10n.checkinAdjustTitle,
      text: l10n.checkinAdjustDesc,
      icon: Icons.science_outlined,
      nextButtonText: l10n.checkinNext,
      onNext: _nextPage,
      showBack: true,
    );
  }

  Widget _buildMeasurementSlide() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.science, size: 80, color: AppColors.growGreen),
          const SizedBox(height: 24),
          Text(
            l10n.checkinMeasureTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(labelText: l10n.checkinPhLabel, border: const OutlineInputBorder()),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (val) => _inputPh = double.tryParse(val.replaceAll(',', '.')),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(labelText: l10n.checkinEcLabel, border: const OutlineInputBorder()),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (val) => _inputEc = double.tryParse(val.replaceAll(',', '.')),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    side: const BorderSide(color: Colors.white54),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: _previousPage,
                  child: Text(l10n.checkinBack),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {
                    // Only require ph and ec to continue
                    if (_inputPh != null && _inputEc != null) {
                      _nextPage();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.checkinValuesRequired)));
                    }
                  },
                  child: Text(
                    l10n.checkinSaveValues,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSlide({
    required String title,
    required String text,
    required IconData icon,
    required String nextButtonText,
    required VoidCallback onNext,
    bool showBack = false,
  }) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Icon(icon, size: 100, color: AppColors.growGreen),
          const SizedBox(height: 32),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            children: [
              if (showBack)
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      side: const BorderSide(color: Colors.white54),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: _previousPage,
                    child: Text(l10n.checkinBack),
                  ),
                ),
              if (showBack) const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: onNext,
                  child: Text(
                    nextButtonText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
  Widget _buildLampSlide() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.lightbulb, size: 80, color: AppColors.growGreen),
          const SizedBox(height: 32),
          Text(
            l10n.checkinLampTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.checkinLampDesc,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            icon: const Icon(Icons.camera_alt),
            label: Text(_inputPpfd != null ? l10n.checkinMeasurePpfdAgain(_inputPpfd!.toStringAsFixed(0)) : l10n.checkinMeasurePpfd),
            onPressed: () async {
              final result = await context.push<double>('/ppfd_meter');
              if (result != null) {
                setState(() {
                  _inputPpfd = result;
                });
              }
            },
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    side: const BorderSide(color: Colors.white54),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: _previousPage,
                  child: Text(l10n.checkinBack),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: _nextPage,
                  child: Text(
                    l10n.checkinLampNext,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
