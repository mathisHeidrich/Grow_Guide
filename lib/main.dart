import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router.dart';
import 'services/database.dart';
import 'providers/database_provider.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbService = DatabaseService();
  await dbService.init();

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

    return MaterialApp.router(
      title: 'Grow Guide V2',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.surface,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.growGreen,
          error: Color(0xFFFF5252),
          surface: Color(0xFF1E1E1E),
        ),
        fontFamily: 'Roboto', // Default fallback, can be updated later
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: goRouter,
    );
  }
}
