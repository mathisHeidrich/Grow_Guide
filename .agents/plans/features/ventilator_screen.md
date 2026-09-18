# [Ventilator Screen]

This feature adds a new screen to explain the proper placement of ventilators in the grow tent, and the common errors associated with them (like wind burn or pointing directly at small plants).

## User Review Required

Please review the proposed placement and content of the Ventilator screen.

## Open Questions

1. Where should this screen be linked from? 
   - From the `TentSetupScreen` (e.g. as a "Deep Dive" info button on the circulation fan slide)?
   - From the `HardwareAdvisorScreen`?
   - Or just a standalone entry on the Dashboard?
   (Recommended: Add an Info button on the Circulation Fan slide in `TentSetupScreen` that opens this as a modal bottom sheet, as described in `SKILL.md`).

## Proposed Changes

### `lib/screens/ventilator_guide_screen.dart`
- [NEW] Create a new screen `VentilatorGuideScreen` (or a BottomSheet widget).
- It will include sections describing:
  - Where the ventilators should be placed (e.g., above and below the canopy, oscillating).
  - Common errors (e.g., wind burn from pointing directly at small plants).
- Will follow Dark Mode theme guidelines using `AppColors`.

### `lib/l10n/app_en.arb` and `lib/l10n/app_de.arb`
- [MODIFY] Add localization strings for the new screen's title, descriptions, and error warnings.

### `lib/router.dart` (Optional depending on access method)
- [MODIFY] Add a new route `/ventilator_guide` if this is a standalone screen (not a bottom sheet).

## Verification Plan

### Manual Verification
- Run the Flutter app using `flutter run -t lib/main_test_env.dart -d web-server --web-port 8080`.
- Verify the new screen matches Dark Mode and `AppColors`.
- Verify all texts are properly localized.
