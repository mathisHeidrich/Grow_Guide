# Consistency Check Implementation Plan

This plan details the changes required to bring the Grow Guide app into full compliance with the consistency guidelines outlined in `SKILL.md`.

## User Review Required
> [!IMPORTANT]
> Please review the planned changes to theming and localization. I will proceed with execution once you approve this plan.

## Proposed Changes

### 1. Localization (i18n) Updates
Replace hardcoded German strings with localized keys.

#### [MODIFY] `lib/l10n/app_de.arb`
- Add `"generalUnderstood": "Verstanden"`
- Add `"generalOk": "OK"`

#### [MODIFY] `lib/screens/checkin_screen.dart`
- Replace `Text("Verstanden")` with `Text(l10n.generalUnderstood)`
- Replace `Text('OK')` with `Text(l10n.generalOk)`

#### [MODIFY] `lib/screens/ec_adjust_screen.dart`
- Replace `Text('Zurück')` with `Text(l10n.checkinBack)`

#### [MODIFY] `lib/screens/germination_wizard_screen.dart`
- Replace `Text("Verstanden")` with `Text(l10n.generalUnderstood)`

#### [MODIFY] `lib/screens/ph_adjust_screen.dart`
- Replace `Text('Zurück')` with `Text(l10n.checkinBack)`

---

### 2. Theming & Hardcoded Colors
Replace `Color(0xFF...)` with appropriate `Theme.of(context)` attributes to ensure dark mode and theme changes propagate correctly. Where `context` is not available, `AppColors` will be used.

#### [MODIFY] `lib/screens/app_onboarding_screen.dart`
#### [MODIFY] `lib/screens/checkin_screen.dart`
#### [MODIFY] `lib/screens/ec_adjust_screen.dart`
#### [MODIFY] `lib/screens/germination_wizard_screen.dart`
#### [MODIFY] `lib/screens/hardware_advisor_screen.dart`
#### [MODIFY] `lib/screens/problem_diagnosis_screen.dart`
#### [MODIFY] `lib/screens/tent_setup_screen.dart`
#### [MODIFY] `lib/screens/water_change_screen.dart`
#### [MODIFY] `lib/screens/water_guide_screen.dart`
- Replace `Color(0xFF00E676)` with `Theme.of(context).colorScheme.primary` or `AppColors.growGreen`.
- Replace `Color(0xFF1E1E1E)` with `Theme.of(context).cardColor` or `AppColors.surface`.
- Replace `Color(0xFF121212)` with `Theme.of(context).scaffoldBackgroundColor` or `AppColors.background`.
- Replace `Color(0xFFFF5252)` with `Theme.of(context).colorScheme.error` or `AppColors.errorRed`.

---

### 3. Flutter Analyzer Fixes (Code Quality)
Fix deprecated APIs and add missing `const` modifiers.

#### [MODIFY] `lib/screens/checkin_screen.dart`
#### [MODIFY] `lib/screens/ec_adjust_screen.dart`
#### [MODIFY] `lib/screens/ph_adjust_screen.dart`
- Replace `.withOpacity(...)` with `.withValues(alpha: ...)` to resolve deprecation warnings.

#### [MODIFY] `lib/screens/problem_diagnosis_screen.dart`
- Add `const` modifier to constructors where suggested by `flutter analyze`.

## Verification Plan

### Automated Tests
- Run `flutter analyze` to ensure 0 remaining issues (excepting new beta `RadioGroup` experimental warnings if they can't be easily suppressed).
- Build the app with `flutter run -t lib/main_test_env.dart -d web-server --web-renderer html --web-port 8080` to verify it compiles successfully.

### Manual Verification
- Review the screens to ensure colors match exactly as before and no UI regressions occurred.
