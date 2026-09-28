# Playbook: Onboarding Flow

## Purpose
Ensure the new user onboarding experience is flawless, logically coherent, and visually sound.

## Pre-requisites
- Use `lib/main_test_env.dart`.
- The database MUST be empty or `hasCompletedOnboarding` MUST be false.
- App started via `flutter run -t lib/main_test_env.dart -d web-server --web-renderer html --web-port 8080`.

## Test 1: Navigation Redirect
- **Context:** A new user starts the app for the very first time.
- **Action:** Open `http://localhost:8080/`.
- **Expectation (Logic):** The app must immediately redirect to `http://localhost:8080/onboarding` because the database indicates onboarding is not complete.
- **Expectation (Visual):** Wait for rendering.

## Test 2: Onboarding Slider Content (AppOnboardingScreen)
- **Context:** User is on the first slide.
- **Action:** Read the DOM text using semantics (`<flt-semantics>`).
- **Expectation (Logic):** The title and text for slide 1 must be present. A "Next" (Weiter) button must exist.
- **Expectation (UX/UI):** Take a Screenshot. Ensure the text is vertically centered. Ensure the Green Eco icon (Icons.eco) is visible. Verify the "Next" button has enough padding.
- **Action:** Click the "Next" button.
- **Expectation (Logic):** Transition to slide 2. Verify text changes.
- **Action:** Click the "Next" button again (Slide 3).
- **Action:** Click the "Next" button again (Slide 4).
- **Expectation (Logic):** The text "Bevor wir loslegen, schauen wir uns an, was du für deinen Grow brauchst." must be present. The button must say "Weiter zum Hardware-Ratgeber".
- **Action:** Click "Weiter zum Hardware-Ratgeber".

## Test 3: Hardware Advisor Screen
- **Context:** User landed on the Hardware Advisor.
- **Expectation (Logic):** URL should be `/hardware_advisor`. The title should be visible.
- **Action:** Validate that the first card is a "Complete Set" card (marked with ⭐ ALL-IN-ONE).
- **UX/UI Check:** Take a screenshot. Ensure the orange highlight box "⭐ ALL-IN-ONE" does not overlap the icon or title. Check if the expand/collapse card for buying options looks clean.
- **Action:** Click "Weiter" (Next).
- **Expectation (Logic):** The page should switch to the "Grow Tent" hardware item (marked with 🔴 PFLICHT).
- **Action:** Click "Zurück" (Back).
- **Expectation (Logic):** Must return to the first hardware item.

## Test 4: Edge Case - Skipping via URL
- **Context:** User tries to bypass onboarding.
- **Action:** Manually navigate to `http://localhost:8080/` again.
- **Expectation (Logic):** Must redirect back to `/onboarding` because it is still not finished.

## Clean Up / Conclusion
If all tests pass without errors in the browser console or unexpected visual glitches, the Onboarding flow is stable.
