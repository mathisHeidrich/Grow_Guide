import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/light_source.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/ppfd_provider.dart';

class PpfdMeterScreen extends ConsumerStatefulWidget {
  const PpfdMeterScreen({super.key});

  @override
  ConsumerState<PpfdMeterScreen> createState() => _PpfdMeterScreenState();
}

class _PpfdMeterScreenState extends ConsumerState<PpfdMeterScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Start camera session
    ref.read(ppfdCameraServiceProvider).startSession();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Stop camera session
    ref.read(ppfdCameraServiceProvider).stopSession();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(ppfdCameraServiceProvider).startSession();
    } else if (state == AppLifecycleState.paused) {
      ref.read(ppfdCameraServiceProvider).stopSession();
    }
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
                    onChanged: (val) => ref.read(calibrationFactorProvider.notifier).state = val,
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final factor = ref.watch(calibrationFactorProvider);
                  return Text(l10n.ppfdCalibrationFactor(factor.toStringAsFixed(2)));
                }
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.ppfdCalibrationDone),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final ppfdStream = ref.watch(ppfdStreamProvider);
    final selectedLight = ref.watch(selectedLightSourceProvider);

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
            // Permanent Instruction Text
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white30),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.white, size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      l10n.ppfdInstruction,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
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
            ppfdStream.when(
              data: (ppfd) {
                return Column(
                  children: [
                    Text(
                      ppfd.toStringAsFixed(0),
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 96,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l10n.ppfdUnit,
                      style: const TextStyle(color: Colors.white70, fontSize: 24),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text(l10n.ppfdError(err.toString()), style: const TextStyle(color: Colors.red)),
            ),

            const Spacer(),

            // Giant Capture Button
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // Get current value from stream provider if possible
                    final currentValue = ref.read(ppfdStreamProvider).valueOrNull ?? 0.0;
                    Navigator.of(context).pop(currentValue); // Return value to check-in flow
                  },
                  child: Text(
                    l10n.ppfdTakeValue,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
