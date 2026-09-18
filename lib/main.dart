import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router.dart';
import 'services/database.dart';
import 'services/local_notification_service.dart';
import 'providers/database_provider.dart';
import 'providers/settings_provider.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbService = DatabaseService();
  await dbService.init();

  final notificationService = LocalNotificationService();
  await notificationService.init();
  await notificationService.requestPermissions();

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(dbService),
      ],
      child: const GrowGuideApp(),
    ),
  );
}

class GrowGuideApp extends ConsumerWidget {
  const GrowGuideApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);
    final settingsAsync = ref.watch(settingsProvider);
    
    final themeSetting = settingsAsync.valueOrNull?.theme ?? 'dark';
    final languageSetting = settingsAsync.valueOrNull?.language;

    ThemeMode themeMode = ThemeMode.dark;
    if (themeSetting == 'light') themeMode = ThemeMode.light;
    else if (themeSetting == 'system') themeMode = ThemeMode.system;

    Locale? locale;
    if (languageSetting != null) {
      locale = Locale(languageSetting);
    }

    return MaterialApp.router(
      title: 'Grow Guide V2',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        cardColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: AppColors.growGreen,
          error: Color(0xFFFF5252),
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.surface,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.growGreen,
          error: Color(0xFFFF5252),
          surface: Color(0xFF1E1E1E),
        ),
        useMaterial3: true,
      ),
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: goRouter,
    );
  }
}
