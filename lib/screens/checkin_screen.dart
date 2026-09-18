import '../providers/time_provider.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
import 'package:app/l10n/app_localizations.dart';
import '../models/plant.dart';
import '../theme/app_colors.dart';
import '../services/nutrient_service.dart';


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
  double? _inputWaterAdded;
  bool _isWaterChange = false;
  bool _needsWaterChange = false;
  bool? _willDoWaterChange;
  bool _needsLampCheck = false;
  bool _needsVentilatorCheck = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = ref.read(databaseProvider).db;
    final plant = await (db.select(db.plants)
          ..where((tbl) => tbl.id.equals(widget.plantId)))
        .getSingleOrNull();
    if (mounted && plant != null) {
      // check last water change
      final lastWcLog = await (db.select(db.logEntries)
            ..where((tbl) =>
                tbl.plantId.equals(widget.plantId) &
                tbl.isWaterChange.equals(true))
            ..orderBy([
              (t) => drift.OrderingTerm(
                  expression: t.timestamp, mode: drift.OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull();

      final now = ref.read(timeProvider);
      bool needsWc = false;
      if (lastWcLog == null) {
        if (plant.phaseStartDate != null &&
            now.difference(plant.phaseStartDate!).inDays >= 7) {
          needsWc = true;
        }
      } else {
        if (now.difference(lastWcLog.timestamp).inDays >= 7) {
          needsWc = true;
        }
      }

      final todayStart = DateTime(now.year, now.month, now.day);
      
      final lastPpfdLog = await (db.select(db.logEntries)
            ..where((tbl) =>
                tbl.plantId.equals(widget.plantId) & tbl.ppfd.isNotNull())
            ..orderBy([
              (t) => drift.OrderingTerm(
                  expression: t.timestamp, mode: drift.OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull();

      bool hasPpfdLogToday = lastPpfdLog != null && lastPpfdLog.timestamp.isAfter(todayStart);

      final lastLog = await (db.select(db.logEntries)
            ..where((tbl) => tbl.plantId.equals(widget.plantId))
            ..orderBy([
              (t) => drift.OrderingTerm(
                  expression: t.timestamp, mode: drift.OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull();
      
      bool hasLogToday = lastLog != null && lastLog.timestamp.isAfter(todayStart);

      bool lampCheck = false;
      if (now.weekday == DateTime.wednesday) {
        if (!hasPpfdLogToday) lampCheck = true;
      } else if (lastPpfdLog == null || now.difference(lastPpfdLog.timestamp).inDays > 7) {
        lampCheck = true;
      }

      bool ventCheck = false;
      if (now.weekday == DateTime.sunday) {
        if (!hasLogToday) ventCheck = true;
      }

      setState(() {
        _plant = plant;
        _initialRootsNotReached ??= _plant!.currentPhase == PlantPhase.veg &&
            !_plant!.rootsReachedWater;
        _needsWaterChange = needsWc;
        _needsLampCheck = lampCheck;
        _needsVentilatorCheck = ventCheck;
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


    final db = ref.read(databaseProvider).db;

    if (_initialRootsNotReached == true && _tempRootsInWater == true) {
      final updatedPlant = _plant!.copyWith(rootsReachedWater: true);
      await db.update(db.plants).replace(updatedPlant);
    }

    await db.into(db.logEntries).insert(
      LogEntriesCompanion.insert(
        plantId: _plant!.id,
        timestamp: ref.read(timeProvider),
        ph: _inputPh != null ? drift.Value(_inputPh!) : const drift.Value.absent(),
        ec: _inputEc != null ? drift.Value(_inputEc!) : const drift.Value.absent(),
        ppfd: _inputPpfd != null ? drift.Value(_inputPpfd!) : const drift.Value.absent(),
      ),
    );

    if (mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_plant == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                if (_needsWaterChange)
                  _wrapWithInfo(
                      _buildWaterChangeRecommendationSlide(),
                      l10n.checkinDeepDiveWaterChangeRecTitle,
                      l10n.checkinDeepDiveWaterChangeRecText),
                if (_initialRootsNotReached == true) ...[
                  _wrapWithInfo(
                      _buildRootsCheckSlide(),
                      l10n.checkinDeepDiveRootsCheckTitle,
                      l10n.checkinDeepDiveRootsCheckText),
                  if (_tempRootsInWater == false)
                    _wrapWithInfo(
                        _buildTopWateringSlide(),
                        l10n.checkinDeepDiveTopWateringTitle,
                        l10n.checkinDeepDiveTopWateringText),
                ],
                _wrapWithInfo(
                    _buildSlide(
                      title: l10n.checkinHealthTitle,
                      text: l10n.checkinHealthDesc,
                      icon: Icons.eco,
                      nextButtonText: l10n.checkinHealthNext,
                      onNext: _nextPage,
                      showBack:
                          _initialRootsNotReached == true || _needsWaterChange,
                      extraWidget: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.withValues(alpha: 0.2),
                          foregroundColor: Colors.orangeAccent,
                          side: const BorderSide(color: Colors.orangeAccent),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        icon: const Icon(Icons.healing),
                        label: Text(l10n.diagnoseProblemButton, style: const TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          context.push('/problems?plantId=${widget.plantId}');
                        },
                      ),
                    ),
                    l10n.checkinDeepDiveHealthTitle,
                    l10n.checkinDeepDiveHealthText),
                if (_initialRootsNotReached != true ||
                    _tempRootsInWater == true) ...[
                  if (!_isWaterChange)
                    _wrapWithInfo(
                        _buildWaterLevelSlide(),
                        l10n.checkinDeepDiveWaterLevelTitle,
                        l10n.checkinDeepDiveWaterLevelText),
                  _wrapWithInfo(
                      _buildEcMeasureSlide(),
                      l10n.checkinDeepDiveEcMeasureTitle,
                      l10n.checkinDeepDiveEcMeasureText),
                  _wrapWithInfo(
                      _buildEcAdjustSlide(),
                      l10n.checkinDeepDiveEcAdjustTitle,
                      l10n.checkinDeepDiveEcAdjustText),
                  _wrapWithInfo(
                      _buildPhMeasureSlide(),
                      l10n.checkinDeepDivePhMeasureTitle,
                      l10n.checkinDeepDivePhMeasureText),
                  _wrapWithInfo(
                      _buildPhAdjustSlide(),
                      l10n.checkinDeepDivePhAdjustTitle,
                      l10n.checkinDeepDivePhAdjustText),
                ],
                if (_needsLampCheck)
                  _wrapWithInfo(_buildLampSlide(), l10n.checkinDeepDiveLampTitle,
                      l10n.checkinDeepDiveLampText),
                if (_needsVentilatorCheck)
                  _wrapWithInfo(
                      _buildVentilatorSlide(),
                      l10n.checkinVentilatorDeepDiveTitle,
                      l10n.checkinVentilatorDeepDiveText),
                _wrapWithInfo(
                    _buildSlide(
                      title: l10n.checkinFinishTitle,
                      text: l10n.checkinFinishDesc,
                      icon: Icons.check_circle,
                      nextButtonText: l10n.checkinFinishNext,
                      onNext: _completeCheckin,
                      showBack: true,
                    ),
                    l10n.checkinDeepDiveFinishTitle,
                    l10n.checkinDeepDiveFinishText),
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

  Widget _wrapWithInfo(Widget child, String title, String text) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon:
                const Icon(Icons.info_outline, color: Colors.white54, size: 32),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.surface,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                        const SizedBox(height: 16),
                        Text(text,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                                height: 1.5)),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.growGreen,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(AppLocalizations.of(context)!.generalUnderstood,
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- NEW SLIDES ---

  Widget _buildWaterChangeRecommendationSlide() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.water_damage, size: 80, color: Colors.blueAccent),
          const SizedBox(height: 32),
          Text(
            l10n.checkinWaterChangeRecTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.checkinWaterChangeRecDesc,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ChoiceChip(
            label: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                    child: Text(l10n.checkinWaterChangeRecNow,
                        style: const TextStyle(fontSize: 16)))),
            selected: _willDoWaterChange == true,
            onSelected: (val) => setState(() => _willDoWaterChange = true),
          ),
          const SizedBox(height: 12),
          ChoiceChip(
            label: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                    child: Text(l10n.checkinWaterChangeRecLater,
                        style: const TextStyle(fontSize: 16)))),
            selected: _willDoWaterChange == false,
            onSelected: (val) => setState(() => _willDoWaterChange = false),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.growGreen,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: _willDoWaterChange == null
                ? null
                : () async {
                    if (_willDoWaterChange == true) {
                      final result = await context.push<bool>('/water_change');
                      if (!mounted) return;
                      if (result == true) {
                        setState(() {
                          _isWaterChange = true;
                        });
                        // Jump to next page instantly so we don't see the slide animating
                        _pageController.jumpToPage((_pageController.page ?? 0).toInt() + 1);
                      }
                      // If result != true, user cancelled. Stay on this slide.
                    } else {
                      _nextPage();
                    }
                  },
            child: Text(l10n.checkinContinue,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildWaterLevelSlide() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.water, size: 80, color: Colors.blueAccent),
          const SizedBox(height: 32),
          Text(l10n.checkinWaterLevelTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Text(l10n.checkinWaterLevelDesc,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white70),
              textAlign: TextAlign.center),
          const SizedBox(height: 32),
          TextFormField(
            decoration: InputDecoration(
                labelText: l10n.checkinWaterLevelLabel,
                border: const OutlineInputBorder()),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (val) =>
                _inputWaterAdded = double.tryParse(val.replaceAll(',', '.')),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              _inputWaterAdded = 0;
              _nextPage();
            },
            child: Text(l10n.checkinWaterLevelSkip),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(flex: 1, child: _backButton()),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _nextButton()),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildEcMeasureSlide() {
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
          Text(l10n.checkinEcMeasureTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(l10n.checkinEcMeasureDesc,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white70),
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
          const Spacer(),
          Row(
            children: [
              Expanded(flex: 1, child: _backButton()),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _nextButton(enabled: _inputEc != null)),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildEcAdjustSlide() {
    final l10n = AppLocalizations.of(context)!;

    // Calculate week index
    int weekIndex = 0;
    if (_plant!.phaseStartDate != null) {
      final now = ref.read(timeProvider);
      weekIndex = now.difference(_plant!.phaseStartDate!).inDays ~/ 7;
    }

    final schedule = NutrientService.getScheduleForBrand(_plant!.nutrientBrand);
    double targetEc = schedule.getTargetEc(_plant!.currentPhase, weekIndex);

    // Check if EC is too high (margin of +0.3 above target is considered high)
    bool isEcTooHigh = (_inputEc ?? 0) > (targetEc + 0.3);

    // Compute Nutrients
    final nutes = NutrientService.calculateNutrients(
      brand: _plant!.nutrientBrand,
      phase: _plant!.currentPhase,
      weekIndex: weekIndex,
      waterAddedLiters: _inputWaterAdded ?? 0,
      totalVolumeLiters: _plant!.waterVolumeLiters,
      currentEc: _inputEc ?? 0,
    );
    // Add nutrients if any value is >= 0.1 ml (to prevent showing 0.0 ml)
    final nutrientsToAdd =
        nutes.nutrients.where((n) => n.amountMl >= 0.1).toList();
    bool hasNutrientsToAdd = nutrientsToAdd.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Icon(isEcTooHigh ? Icons.warning : Icons.add_circle_outline,
              size: 80, color: isEcTooHigh ? Colors.red : AppColors.growGreen),
          const SizedBox(height: 24),
          Text(l10n.checkinNutrientTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 24),
          if (isEcTooHigh) ...[
            Text(
                _needsWaterChange
                    ? l10n.checkinEcTooHighFull
                    : l10n.checkinEcTooHighPartial,
                style: const TextStyle(color: Colors.redAccent, fontSize: 16),
                textAlign: TextAlign.center),
            if (_needsWaterChange) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.growGreen,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () async {
                  final result = await context.push<bool>('/water_change');
                  if (!mounted) return;
                  if (result == true) {
                    setState(() {
                      _isWaterChange = true;
                    });
                    _pageController.jumpToPage((_pageController.page ?? 0).toInt() - 1);
                  }
                },
                child: Text(l10n.checkinWaterChangeButton,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              )
            ]
          ] else if (hasNutrientsToAdd) ...[
            Text(l10n.checkinNutrientDesc,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70),
                textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nutrientsToAdd
                    .map((n) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              "${n.name}: ${n.amountMl.toStringAsFixed(1)} ml",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white)),
                        ))
                    .toList(),
              ),
            )
          ] else ...[
            Text(l10n.checkinNutrientNone,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70),
                textAlign: TextAlign.center),
          ],
          const Spacer(),
          Row(
            children: [
              Expanded(flex: 1, child: _backButton()),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _nextButton()),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPhMeasureSlide() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.science_outlined,
              size: 80, color: AppColors.growGreen),
          const SizedBox(height: 24),
          Text(l10n.checkinPhAdjustTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(l10n.checkinPhAdjustDesc,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white70),
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
          const Spacer(),
          Row(
            children: [
              Expanded(flex: 1, child: _backButton()),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _nextButton(enabled: _inputPh != null)),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPhAdjustSlide() {
    final l10n = AppLocalizations.of(context)!;
    bool phOk = _inputPh != null && _inputPh! >= 5.5 && _inputPh! <= 6.5;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Icon(phOk ? Icons.check_circle : Icons.warning,
              size: 80, color: phOk ? AppColors.growGreen : Colors.orange),
          const SizedBox(height: 24),
          Text(l10n.checkinPhStatusTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(phOk ? l10n.checkinPhStatusOk : l10n.checkinPhStatusAdjust,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white70),
              textAlign: TextAlign.center),
          const Spacer(),
          Row(
            children: [
              Expanded(flex: 1, child: _backButton()),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _nextButton()),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // --- EXISTING SLIDES ---

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
                  label: Center(
                      child: Text(l10n.checkinRootsCheckYes,
                          style: const TextStyle(fontSize: 18))),
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
                  label: Center(
                      child: Text(l10n.checkinRootsCheckNo,
                          style: const TextStyle(fontSize: 18))),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              if (_tempRootsInWater == null) {
                return;
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

  Widget _buildVentilatorSlide() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.info_outline, color: Colors.white54, size: 32),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          l10n.checkinVentilatorDeepDiveTitle,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.checkinVentilatorDeepDiveText,
                          style: const TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.growGreen,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(AppLocalizations.of(context)!.generalOk, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          const Icon(Icons.cyclone, size: 80, color: AppColors.growGreen),
          const SizedBox(height: 32),
          Text(
            l10n.checkinVentilatorTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.checkinVentilatorDesc,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(flex: 1, child: _backButton()),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _nextButton(text: l10n.checkinVentilatorNext, onPressed: _nextPage)),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLampSlide() {
    final l10n = AppLocalizations.of(context)!;
    final phase = _plant?.currentPhase ?? PlantPhase.veg;
    final range = phase.targetPpfdRange;

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
          Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.growGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.growGreen, width: 2),
              ),
              child: Column(children: [
                Text(
                  l10n.checkinLampTargetPpfdLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.growGreen,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  "${range[0]} - ${range[1]}",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ])),
          const SizedBox(height: 24),
          Text(
            l10n.checkinLampMeasureInstruction,
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            icon: const Icon(Icons.camera_alt),
            label: Text(_inputPpfd != null
                ? l10n.checkinMeasurePpfdAgain(_inputPpfd!.toStringAsFixed(0))
                : l10n.checkinMeasurePpfd),
            onPressed: () async {
              final result = await context
                  .push<double>('/ppfd_meter?plantId=${widget.plantId}');
              if (!mounted) return;
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
              Expanded(flex: 1, child: _backButton()),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _nextButton()),
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
    Widget? extraWidget,
  }) {
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
          if (extraWidget != null) ...[
            const SizedBox(height: 24),
            extraWidget,
          ],
          const Spacer(),
          Row(
            children: [
              if (showBack) Expanded(flex: 1, child: _backButton()),
              if (showBack) const SizedBox(width: 16),
              Expanded(
                  flex: 2,
                  child: _nextButton(text: nextButtonText, onPressed: onNext)),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _backButton() {
    final l10n = AppLocalizations.of(context)!;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        side: const BorderSide(color: Colors.white54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: _previousPage,
      child: Text(l10n.checkinBack),
    );
  }

  Widget _nextButton(
      {String? text, VoidCallback? onPressed, bool enabled = true}) {
    final l10n = AppLocalizations.of(context)!;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.growGreen,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: enabled ? (onPressed ?? _nextPage) : null,
      child: Text(text ?? l10n.checkinNext,
          style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
