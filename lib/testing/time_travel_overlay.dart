import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/time_provider.dart';
import 'scenario_launcher_screen.dart';

class TimeTravelOverlay extends ConsumerStatefulWidget {
  final Widget child;

  const TimeTravelOverlay({super.key, required this.child});

  @override
  ConsumerState<TimeTravelOverlay> createState() => _TimeTravelOverlayState();
}

class _TimeTravelOverlayState extends ConsumerState<TimeTravelOverlay> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final currentTime = ref.watch(timeProvider);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          // The floating time travel menu
          Positioned(
            bottom: 30,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_isMenuOpen) ...[
                    _buildTimeButton('+1 Tag', () => _addDays(1)),
                    const SizedBox(height: 8),
                    _buildTimeButton('+7 Tage', () => _addDays(7)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Simulation: ${currentTime.day}.${currentTime.month}.${currentTime.year}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildTimeButton('Szenario wechseln', () {
                      Navigator.of(context, rootNavigator: true)
                          .pushReplacement(
                        MaterialPageRoute(
                            builder: (context) =>
                                const ScenarioLauncherScreen()),
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                  FloatingActionButton(
                    heroTag: 'time_travel_fab',
                    backgroundColor: Colors.purpleAccent,
                    onPressed: () {
                      setState(() {
                        _isMenuOpen = !_isMenuOpen;
                      });
                    },
                    child: Icon(_isMenuOpen ? Icons.close : Icons.access_time),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple.shade700,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  void _addDays(int days) {
    // Only works if the provider is a MockTimeNotifier
    final notifier = ref.read(timeProvider.notifier);
    if (notifier is MockTimeNotifier) {
      notifier.addDays(days);
    }
  }
}
