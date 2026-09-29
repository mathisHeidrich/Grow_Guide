# Onboarding Grow Levels UI Update

## User Review Required
- The user wants the grow levels comparison to "pop" more and be easier to read, while keeping the side-by-side layout.
- We will replace the text blocks with visually structured lists using icons for key metrics.

## Proposed Changes

### [MODIFY] [app_de.arb](file:///Users/mathis/development/Grow_Guide/.worktrees/onboarding-grow-levels-ui/lib/l10n/app_de.arb)
Add specific string keys for the different properties of the grow levels:
- `growLevel1Yield` / `growLevel2Yield`
- `growLevel1Effort` / `growLevel2Effort`
- `growLevel1Methods` / `growLevel2Methods`
- `growLevel1Subtitle` / `growLevel2Subtitle`

### [MODIFY] [experience_assessment_screen.dart](file:///Users/mathis/development/Grow_Guide/.worktrees/onboarding-grow-levels-ui/lib/screens/experience_assessment_screen.dart)
Update the `_buildInfoCard` method to accept and display the new structured data (yield, effort, methods) using small icons (e.g. `Icons.scale`, `Icons.timer`, `Icons.build`) next to the text instead of a single block of text.

## Verification Plan
### Automated Tests
- Run `flutter analyze` and `flutter test`

### Manual Verification
- Visual check of the `ExperienceAssessmentScreen` to ensure the layout is clean, fits on the screen, and "pops" as requested.
