import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../database/database.dart';
import '../services/database.dart';
import '../services/local_notification_service.dart';
import 'database_provider.dart';

final settingsProvider = StreamProvider<AppSettings>((ref) {
  final dbService = ref.watch(databaseProvider);
  return dbService.db.select(dbService.db.appSettingsTable).watchSingle();
});

class SettingsNotifier {
  final DatabaseService dbService;
  final LocalNotificationService _notificationService = LocalNotificationService();

  SettingsNotifier(this.dbService);

  Future<void> updateSettings({
    String? theme,
    String? language,
    String? volumeUnit,
    String? temperatureUnit,
    String? conductivityUnit,
    String? checkinFrequency,
  }) async {
    await dbService.db.update(dbService.db.appSettingsTable).write(
          AppSettingsTableCompanion(
            theme: theme == null ? const Value.absent() : Value(theme),
            language: language == null
                ? const Value.absent()
                : Value(language == 'system' ? null : language),
            volumeUnit:
                volumeUnit == null ? const Value.absent() : Value(volumeUnit),
            temperatureUnit: temperatureUnit == null
                ? const Value.absent()
                : Value(temperatureUnit),
            conductivityUnit: conductivityUnit == null
                ? const Value.absent()
                : Value(conductivityUnit),
            checkinFrequency: checkinFrequency == null
                ? const Value.absent()
                : Value(checkinFrequency),
          ),
        );

    if (checkinFrequency != null) {
      await _notificationService.scheduleCheckinReminder(checkinFrequency);
    }
  }

  Future<void> updateLanguage(String? lang) async {
    await dbService.db.update(dbService.db.appSettingsTable).write(
          AppSettingsTableCompanion(
            language: Value(lang == 'system' ? null : lang),
          ),
        );
  }

  Future<void> resetApp() async {
    await dbService.db.delete(dbService.db.plants).go();
    await dbService.db.delete(dbService.db.logEntries).go();
    await dbService.db.update(dbService.db.appSettingsTable).write(
          const AppSettingsTableCompanion(
            hasCompletedOnboarding: Value(false),
            hasCompletedTentSetup: Value(false),
          ),
        );
  }
}

final settingsNotifierProvider = Provider<SettingsNotifier>((ref) {
  final dbService = ref.watch(databaseProvider);
  return SettingsNotifier(dbService);
});
