import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the current application time.
/// In production, this simply returns the actual current time.
/// In the test environment, this can be overridden to provide a mock time.
class TimeNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }
}

final timeProvider = NotifierProvider<TimeNotifier, DateTime>(() {
  return TimeNotifier();
});

/// A specialized Notifier used for testing that allows time travel.
class MockTimeNotifier extends TimeNotifier {
  final DateTime initialTime;

  MockTimeNotifier(this.initialTime);

  @override
  DateTime build() {
    return initialTime;
  }

  void addDays(int days) {
    state = state.add(Duration(days: days));
  }

  void setTime(DateTime newTime) {
    state = newTime;
  }
}
