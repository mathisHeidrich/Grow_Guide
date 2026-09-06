import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/light_source.dart';
import 'package:app/l10n/app_localizations.dart';
import '../providers/ppfd_provider.dart';
import '../providers/database_provider.dart';
import '../models/plant.dart';

class PpfdMeterScreen extends ConsumerStatefulWidget {
  final int? plantId;
  const PpfdMeterScreen({super.key, this.plantId});

  @override
  ConsumerState<PpfdMeterScreen> createState() => _PpfdMeterScreenState();
}

class _PpfdMeterScreenState extends ConsumerState<PpfdMeterScreen>
    with WidgetsBindingObserver {
  bool _isPaused = false;
  double _capturedValue = 0.0;
  Plant? _plant;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(ppfdCameraServiceProvider).startSession();
    _loadPlant();
  }

  Future<void> _loadPlant() async {
    if (widget.plantId != null) {
      final db = ref.read(databaseProvider).db;
      final plant = await (db.select(db.plants)
            ..where((tbl) => tbl.id.equals(widget.plantId!)))
          .getSingleOrNull();
      if (mounted) {
        setState(() {
          _plant = plant;
        });
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ref.read(ppfdCameraServiceProvider).stopSession();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_isPaused) {
      ref.read(ppfdCameraServiceProvider).startSession();
    } else if (state == AppLifecycleState.paused) {
      ref.read(ppfdCameraServiceProvider).stopSession();
    }
  }

  void _togglePause(double currentValue) {
    setState(() {
      _isPaused = !_isPaused;
      if (_isPaused) {
        _capturedValue = currentValue;
        ref.read(ppfdCameraServiceProvider).stopSession();
      } else {
        ref.read(ppfdCameraServiceProvider).startSession();
      }
    });
  }

  void _showCalibrationDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(l10n.ppfdCalibrationTitle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.ppfdCalibrationDesc),
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, child) {
                    final factor = ref.watch(calibrationFactorProvider);
                    return Slider(
                      value: factor,
                      min: 0.1,
                      max: 3.0,
                      divisions: 290,
                      label: factor.toStringAsFixed(2),
                      onChanged: (val) => ref
                          .read(calibrationFactorProvider.notifier)
                          .state = val,
                    );
                  },
                ),
                Consumer(builder: (context, ref, child) {
                  final factor = ref.watch(calibrationFactorProvider);
                  return Text(
                      l10n.ppfdCalibrationFactor(factor.toStringAsFixed(2)));
                })
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.ppfdCalibrationDone),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final ppfdStream = ref.watch(ppfdStreamProvider);
    final selectedLight = ref.watch(selectedLightSourceProvider);

    final targetRange = _plant?.currentPhase.targetPpfdRange ?? [0, 0];
    final hasTarget = targetRange[0] != 0 || targetRange[1] != 0;

    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        title: Text(l10n.ppfdTitle),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: _showCalibrationDialog,
            tooltip: 'Kalibrieren',
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Diffuser Warning
            Container(
              padding: const EdgeInsets.all(12.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.redAccent),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.ppfdDiffuserWarning,
                      style: const TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            if (hasTarget)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  l10n.ppfdTargetRange(targetRange[0], targetRange[1]),
                  style: const TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ),

            const Spacer(),

            // Light Source Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: DropdownButtonFormField<LightSource>(
                value: selectedLight,
                dropdownColor: Colors.grey[900],
                style: const TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  labelText: l10n.ppfdLightSourceLabel,
                  labelStyle: const TextStyle(color: Colors.white54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white30),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: LightSource.values.map((src) {
                  return DropdownMenuItem(
                    value: src,
                    child: Text(src.name),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    ref.read(selectedLightSourceProvider.notifier).state = val;
                  }
                },
              ),
            ),

            const SizedBox(height: 32),

            // Big PPFD Display
            _isPaused
                ? _buildPpfdDisplay(
                    _capturedValue, hasTarget, targetRange, l10n)
                : ppfdStream.when(
                    data: (ppfd) =>
                        _buildPpfdDisplay(ppfd, hasTarget, targetRange, l10n),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, stack) => Text(l10n.ppfdError(err.toString()),
                        style: const TextStyle(color: Colors.red)),
                  ),

            const Spacer(),

            // Giant Capture/Action Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _isPaused
                  ? Row(children: [
                      Expanded(
                        child: SizedBox(
                          height: 70,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white54),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            icon: const Icon(Icons.refresh),
                            label: Text(l10n.ppfdMeasureAgain,
                                style: const TextStyle(fontSize: 18)),
                            onPressed: () => _togglePause(0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 70,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            icon: const Icon(Icons.save),
                            label: Text(l10n.ppfdSaveValue,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.of(context).pop(_capturedValue);
                            },
                          ),
                        ),
                      ),
                    ])
                  : SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(Icons.pause, size: 32),
                        label: Text(
                          l10n.ppfdHoldValue,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          final currentValue =
                              ref.read(ppfdStreamProvider).valueOrNull ?? 0.0;
                          _togglePause(currentValue);
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPpfdDisplay(double ppfd, bool hasTarget, List<int> targetRange,
      AppLocalizations l10n) {
    Color valueColor = Colors.white;
    String? feedbackText;
    IconData? feedbackIcon;

    if (hasTarget) {
      if (ppfd < targetRange[0]) {
        valueColor = Colors.blueAccent;
        feedbackText = l10n.ppfdNeedsMoreLight;
        feedbackIcon = Icons.arrow_upward;
      } else if (ppfd > targetRange[1]) {
        valueColor = Colors.redAccent;
        feedbackText = l10n.ppfdNeedsLessLight;
        feedbackIcon = Icons.arrow_downward;
      } else {
        valueColor = Colors.greenAccent;
        feedbackText = "Perfekt!";
        feedbackIcon = Icons.check_circle;
      }
    } else {
      valueColor = Colors.greenAccent;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ppfd.toStringAsFixed(0),
              style: TextStyle(
                color: valueColor,
                fontSize: 96,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (hasTarget && feedbackIcon != null) ...[
              const SizedBox(width: 16),
              Icon(feedbackIcon, color: valueColor, size: 48),
            ]
          ],
        ),
        Text(
          l10n.ppfdUnit,
          style: const TextStyle(color: Colors.white70, fontSize: 24),
        ),
        if (hasTarget && feedbackText != null) ...[
          const SizedBox(height: 8),
          Text(
            feedbackText,
            style: TextStyle(
                color: valueColor, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ]
      ],
    );
  }
}
