import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/settings_provider.dart';
import 'package:app/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);
    final l10n = AppLocalizations.of(context)!;
    final notifier = ref.read(settingsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: settingsAsync.when(
        data: (settings) {
          return ListView(
            children: [
              _buildSectionHeader(context, l10n.settingsAppearance),

              ListTile(
                title: Text(l10n.settingsLanguage),
                trailing: DropdownButton<String>(
                  value: settings.language ?? 'system',
                  onChanged: (val) {
                    if (val != null) notifier.updateLanguage(val);
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'system',
                      child: Text(l10n.settingsLanguageSystem),
                    ),
                    DropdownMenuItem(
                      value: 'de',
                      child: Text(l10n.settingsLanguageDe),
                    ),
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(l10n.settingsLanguageEn),
                    ),
                  ],
                ),
              ),
              const Divider(),
              _buildSectionHeader(context, l10n.settingsUnits),
              ListTile(
                title: Text(l10n.settingsVolumeUnit),
                trailing: DropdownButton<String>(
                  value: settings.volumeUnit ?? 'l',
                  onChanged: (val) {
                    if (val != null) notifier.updateSettings(volumeUnit: val);
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'l',
                      child: Text(l10n.settingsVolumeLiters),
                    ),
                    DropdownMenuItem(
                      value: 'gal',
                      child: Text(l10n.settingsVolumeGallons),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(l10n.settingsTempUnit),
                trailing: DropdownButton<String>(
                  value: settings.temperatureUnit ?? 'c',
                  onChanged: (val) {
                    if (val != null) notifier.updateSettings(temperatureUnit: val);
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'c',
                      child: Text(l10n.settingsTempC),
                    ),
                    DropdownMenuItem(
                      value: 'f',
                      child: Text(l10n.settingsTempF),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(l10n.settingsCondUnit),
                trailing: DropdownButton<String>(
                  value: settings.conductivityUnit ?? 'ec',
                  onChanged: (val) {
                    if (val != null) notifier.updateSettings(conductivityUnit: val);
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'ec',
                      child: Text(l10n.settingsCondEc),
                    ),
                    DropdownMenuItem(
                      value: 'ppm500',
                      child: Text(l10n.settingsCondPpm500),
                    ),
                    DropdownMenuItem(
                      value: 'ppm700',
                      child: Text(l10n.settingsCondPpm700),
                    ),
                  ],
                ),
              ),
              const Divider(),
              _buildSectionHeader(context, l10n.settingsNotifications),
              ListTile(
                title: Text(l10n.settingsCheckinFreq),
                trailing: DropdownButton<String>(
                  value: settings.checkinFrequency,
                  onChanged: (val) {
                    if (val != null) {
                      notifier.updateSettings(checkinFrequency: val);
                    }
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'daily',
                      child: Text(l10n.settingsFreqDaily),
                    ),
                    DropdownMenuItem(
                      value: 'every_2_days',
                      child: Text(l10n.settingsFreqEvery2Days),
                    ),
                    DropdownMenuItem(
                      value: 'weekly',
                      child: Text(l10n.settingsFreqWeekly),
                    ),
                    DropdownMenuItem(
                      value: 'off',
                      child: Text(l10n.settingsFreqOff),
                    ),
                  ],
                ),
              ),
              const Divider(),
              _buildSectionHeader(context, l10n.settingsDangerZone),
              ListTile(
                title: Text(
                  l10n.settingsResetApp,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(l10n.settingsResetApp),
                      content: Text(l10n.settingsResetWarning),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: Text(l10n.settingsCancel),
                        ),
                        TextButton(
                          onPressed: () {
                            notifier.resetApp();
                            Navigator.of(ctx).pop();
                            context.go('/');
                          },
                          child: Text(
                            l10n.settingsDelete,
                            style: TextStyle(color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: \$err')),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
