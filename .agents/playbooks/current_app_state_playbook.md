# Playbook: Current App State Validation (Full Test)

## Pre-requisites
- Start the app using `flutter run -t lib/main_test_env.dart -d web-server --web-renderer html --web-port 8080`.
- Ensure the database is fresh or we understand the current onboarding state.

## Test 1: Onboarding Flow (Initial Launch)
- **Action:** Launch the app without any prior database state.
- **Expectation:** The app should redirect to `/onboarding` because `hasCompletedOnboarding` is false.
- **UX/UI Check:** Take a screenshot. Check if the onboarding screen text is readable, the "Next" or "Start" button is easily clickable, and contrast is good.

## Test 2: Hardware & Water Setup
- **Action:** Proceed through onboarding to the Hardware Advisor and Water Setup screens.
- **Expectation:** Screens load without crashing. Input fields (if any) can be interacted with.
- **Logic Check:** Ensure completing these steps correctly flags onboarding as completed in the database and redirects to the Dashboard (`/`).

## Test 3: Dashboard Validation
- **Action:** Arrive at the Dashboard.
- **Expectation:** Dashboard is visible. It should likely show an empty state (no plants yet).
- **UX/UI Check:** Check if the floating action button (or "Add Plant" button) is clearly visible and not overlapping critical text.

## Test 4: Add Plant Flow (Edge Case)
- **Action:** Click "Add Plant". Leave all fields empty and try to save.
- **Expectation:** Form validation should trigger. The app MUST NOT crash. Error messages should be visible.
- **Action:** Fill in valid dummy data and save.
- **Expectation:** Redirects back to Dashboard and the new plant is visible in the list.

## Test 5: Water Change (State Check)
- **Action:** Navigate to `/water_change`.
- **Expectation:** Screen loads. Check if the UI correctly handles the fact that there might be no plants or a newly added plant.
