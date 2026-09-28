# Playbook: Hardware Onboarding Refactor

## Pre-requisites (Mocking)
- Start the app normally, as it should launch into onboarding automatically if `hasCompletedOnboarding` is false.

## Test 1: Navigation
- **Action:** Click through the 4 intro slides in the onboarding screen to reach the hardware advisor.
- **Expectation:** Hardware advisor opens.

## Test 2: UI & UX Validation
- **Action:** Look at the Hardware advisor screen.
- **Expectation:** It should be a scrollable list (no more swiping pages horizontally). Text and icons should be visible und nicht abschneiden. Badges (ALL-IN-ONE, PFLICHT, UPGRADE) distinct.

## Test 3: Proceeding
- **Action:** Scroll to the bottom and tap "Weiter zum Zeltaufbau".
- **Expectation:** Navigates to Tent Setup successfully.
