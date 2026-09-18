---
name: screen-creation
description: Rules and guidelines for creating new screens in the Grow Guide app.
---

# Screen Creation Guidelines

When building or updating a screen in this Flutter app (Grow Guide), you must follow these strictly derived rules to ensure architectural consistency, maintain the dark-mode aesthetic, and prevent regressions.

## 1. File Location & Naming
- **Directory**: Place all screen files in `lib/screens/`.
- **File Name**: Use snake_case with the `_screen.dart` suffix (e.g., `water_guide_screen.dart`).
- **Class Name**: Use PascalCase ending with `Screen` (e.g., `WaterGuideScreen`).

## 2. State Management (Riverpod)
- Extend `ConsumerWidget` (stateless) or `ConsumerStatefulWidget` (stateful).
- Access providers using `ref.watch()` for reactivity in the `build` method, and `ref.read()` inside callbacks.
- **Time/Date**: NEVER use `DateTime.now()`. You MUST use `ref.watch(timeProvider)` or `ref.read(timeProvider)` to support time-travel testing.
- **Database**: Access the Drift database via `ref.watch(databaseProvider).db` or `ref.read(databaseProvider).db`. Watch queries using streams where applicable (e.g., `db.select(...).watch()`).

## 3. Localization (i18n)
- **No Hardcoded Strings**: All user-facing text must go through localization.
- Import `package:app/l10n/app_localizations.dart`.
- Fetch the localization instance at the top of your build method: `final l10n = AppLocalizations.of(context)!;`
- Add new strings to the `.arb` files (e.g., `lib/l10n/app_en.arb`, `lib/l10n/app_de.arb`) and use them in the widget.

## 4. Theming & Colors
- **No Hardcoded Colors**: Do not use hex colors (e.g., `Color(0xFF00E676)` or `Colors.white`) directly in the screen code. Use `AppColors` instead.
- Import the color palette: `import '../theme/app_colors.dart';`
- Use the defined constants: 
  - `AppColors.background`
  - `AppColors.surface` (for cards/containers)
  - `AppColors.growGreen` (primary actions)
  - `AppColors.warningAmber`
  - `AppColors.errorRed`
  - `AppColors.textWhite`
  - `AppColors.textSecondary`
- Use `Theme.of(context).textTheme` for text styling.
- The app defaults to Dark Mode.

## 5. UI Components & Layout
- Start your screen with a `Scaffold` and an `AppBar`.
- If the screen contains forms or dynamic content, wrap the `body` in a `SingleChildScrollView` with appropriate padding (e.g., `padding: const EdgeInsets.all(24.0)` or `16.0`).
- **Cards**: Use `Card` with a rounded shape: `shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))`.
- **Buttons**: Use `ElevatedButton` for primary actions with a rounded shape (`BorderRadius.circular(12)` or `16`) and symmetric vertical padding (e.g., `padding: const EdgeInsets.symmetric(vertical: 16)`).
- **Inputs**: Use `ChoiceChip` for discrete selections and `TextFormField` for text/number input.

## 6. Routing (GoRouter)
- Import `package:go_router/go_router.dart`.
- Use `context.go('/route_name')` or `context.push('/route_name')` to navigate. Do not use standard `Navigator.push`.

## 7. Wizards & Check-In Pages
- **Deep Dive Info Button**: Any screen that functions as a Wizard, Check-In, or step-by-step guide MUST include a small information button (e.g., `IconButton(icon: Icon(Icons.info_outline))`) on every page/slide.
- **Deep Dive Content**: Tapping this button must open a BottomSheet (using `showModalBottomSheet`) that contains a detailed "deep dive" text explaining the topic of the current slide in depth. This helps users understand the "why" behind the step.
- All titles and deep dive texts must be localized.
