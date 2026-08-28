import 'package:isar/isar.dart';

part 'app_settings.g.dart';

@collection
class AppSettings {
  Id id = 1; // Single instance

  bool hasCompletedOnboarding = false;
  bool hasCompletedTentSetup = false;
}
