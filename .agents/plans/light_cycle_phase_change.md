# Plan: Light Cycle Info on Phase Change

## Goal
When a plant transitions to a new phase (e.g., Veg or Flower), the user should see a screen explaining the new light cycle (hours on/off) and the effects this cycle has on the plant.

## Open Questions for the User
1. **Triggering Flower Phase:** Currently, the app transitions from *Germination* to *Veg* via the Germination Wizard, but there is no button to switch a plant from *Veg* to *Flower*. Should I add a "Switch to Flower Phase" button to the Dashboard (e.g., in the `...` menu) so we can trigger this new screen?
2. **Autoflowers:** Photoperiod plants change to 12/12 for flower, but Autoflowers can stay on 18/6. Should the text mention this distinction, or keep it simple for now?

## Proposed Changes

### 1. New Screen: `lib/screens/phase_change_screen.dart`
Create a new screen that is shown when a phase changes. It will display:
- **For Veg Phase:** 
  - Light Cycle: 18 hours ON / 6 hours OFF.
  - Effects: Simulates summer. The plant focuses on structural growth (stems, leaves, roots).
- **For Flower Phase:**
  - Light Cycle: 12 hours ON / 12 hours OFF.
  - Effects: Simulates autumn. The plant stops growing taller and starts producing buds. Uninterrupted darkness is critical.
- **UI Components:** Will follow `screen-creation` rules (Scaffold, AppBar, rounded Cards, dark mode colors). Include a button to acknowledge ("Verstanden") which then routes back to the Dashboard.

### 2. Localization (`lib/l10n/app_de.arb` & `app_en.arb` if exists)
Add new localized strings:
- `phaseChangeTitle` ("Neuer Lichtzyklus")
- `phaseChangeVegCycle` ("18 Stunden an / 6 Stunden aus")
- `phaseChangeVegEffects` ("Simuliert den Sommer...")
- `phaseChangeFlowerCycle` ("12 Stunden an / 12 Stunden aus")
- `phaseChangeFlowerEffects` ("Simuliert den Herbst...")

### 3. Routing (`lib/router.dart`)
Add a new route `/phase_change/:id/:newPhase` to handle the display of this screen and update the database phase accordingly.

### 4. Integration
- Update `germination_wizard_screen.dart`: After completing germination, instead of going straight to the dashboard, redirect to the new Phase Change screen to explain the Veg light cycle.
- Update `dashboard_screen.dart`: Add an action to the `...` menu to switch to the Flower phase, which routes to this new screen.

## Verification
- Test the transition from Germination -> Veg.
- Test the transition from Veg -> Flower (via the new menu option).
- Ensure the correct text and light cycles are displayed.
