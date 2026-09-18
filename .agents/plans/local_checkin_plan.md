# Local Push Notifications for Check-in

This plan outlines the integration of **Local Push Notifications** to deliver check-in reminders, along with an in-app setting to configure the frequency. This approach runs entirely on the device without requiring Firebase or any cloud backend.

## Proposed Changes

### Database
Update the local Drift database to store the user's preference.
#### [MODIFY] lib/database/tables.dart
- Add `TextColumn get checkinFrequency => text().withDefault(const Constant('daily'))();` to `AppSettingsTable`.

### Providers & Services
#### [NEW] lib/services/local_notification_service.dart
- Create `LocalNotificationService` that initializes `flutter_local_notifications`.
- Set up Android and iOS initialization settings.
- Request notification permissions on iOS and Android 13+.
- Add a method to schedule notifications: `scheduleCheckinReminder(String frequency)`.
  - Maps frequency ('daily', 'every_2_days', 'weekly') to periodic notification schedules.
  - Clears existing scheduled notifications if 'off' is selected.

#### [MODIFY] lib/providers/settings_provider.dart
- Add `checkinFrequency` to `SettingsNotifier.updateSettings`.
- Call `LocalNotificationService.scheduleCheckinReminder()` when the frequency setting changes to update the schedule.

### UI
#### [MODIFY] lib/screens/settings_screen.dart
- Add a new section for "Notifications" (Benachrichtigungen).
- Add a dropdown or segmented button to select the Check-in frequency (e.g., Daily, Every 2 Days, Weekly, Off).
#### [MODIFY] lib/l10n/app_en.arb & app_de.arb
- Add localized strings for the notification settings and the notification content itself (e.g., "Time to check on your plants!").

### App Entry
#### [MODIFY] lib/main.dart
- Initialize `LocalNotificationService` and request permissions if necessary before running the app.

## Verification Plan

### Automated Tests
- Run Drift database migrations type checks.
- Build the app to ensure no compilation errors.

### Manual Verification
- Go to Settings and change the Check-in frequency.
- Print logs to verify the local notification is successfully scheduled.
- Temporarily schedule a notification for 10 seconds in the future to verify it successfully pops up on the device.
