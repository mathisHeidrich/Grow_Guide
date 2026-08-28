import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/light_source.dart';
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
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Kalibrierung'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Nutze einen echten PAR-Meter, um den Wert abzugleichen. Ändere den Multiplikator, bis die Werte übereinstimmen.'),
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
                  return Text('Faktor: ${factor.toStringAsFixed(2)}x');
                }
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fertig'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final ppfdStream = ref.watch(ppfdStreamProvider);
    final selectedLight = ref.watch(selectedLightSourceProvider);

    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        title: const Text('PPFD Meter'),
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
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.white, size: 32),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Bitte lege ein Stück 80g Druckerpapier als Diffusor über die Frontkamera (oben am Bildschirmrand).',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
                  labelText: 'Leuchtmittel',
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
                    const Text(
                      'μmol/m²/s',
                      style: TextStyle(color: Colors.white70, fontSize: 24),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text('Fehler: $err', style: const TextStyle(color: Colors.red)),
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
                  child: const Text(
                    'Messwert übernehmen',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
