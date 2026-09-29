# Playbook: Onboarding & Experience Assessment Update

## Pre-requisites
- Ensure `lib/main_test_env.dart` or standard main starts at `/onboarding`.

## Test 1: Onboarding Flow Navigation
- **Action:** Open the app on the onboarding screen. Click "Weiter" on the first two slides. On the 3rd slide, click "Loslegen".
- **Expectation:** The 4th slide is completely gone. Clicking "Loslegen" navigates immediately to `/experience_assessment`.

## Test 2: Experience Assessment Layout (UI/UX)
- **Action:** View the `/experience_assessment` screen.
- **Expectation:** The two "Grow Level" cards (Level 1 and Level 2) should be displayed side-by-side.
- **Visual Checks:**
  - Are the cards evenly distributed?
  - Is the text fully visible (no clipping or wrapping in weird ways)?
  - Does the vertical layout within the cards (Icon -> Title -> Description) look balanced?
