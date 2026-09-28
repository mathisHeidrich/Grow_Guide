# Playbook: Add Plant Flow

## Purpose
Validate the form logic, state management, and edge cases when creating a new plant profile.

## Pre-requisites
- Use `lib/main_test_env.dart`.
- The user has completed onboarding, so the Dashboard (`/`) is accessible.

## Test 1: Navigation to Add Plant
- **Action:** Open `http://localhost:8080/`. Click the floating action button or "Pflanze hinzufügen" button to go to `/add_plant`.
- **Expectation (Logic):** Form screen renders.
- **UX/UI Check:** Take a screenshot. The form should be scrollable. Ensure text contrast is high (Dark Mode background vs white text). Ensure choice chips (e.g. 10L, 15L, 20L) are easy to tap.

## Test 2: Validation Edge Case - Empty Submission
- **Context:** A user impatiently clicks "Save" without entering data.
- **Action:** Scroll to the bottom and click the "Speichern" (Submit) button.
- **Expectation (Logic):** The app MUST NOT navigate away. The `TextFormField` for "Name" must display a validation error (e.g., "Pflichtfeld" / Required). No database insert should occur.

## Test 3: Complex State Interactions (ChoiceChips vs TextFields)
- **Context:** The user interacts with predefined options and custom text fields.
- **Action:** In the "Water Volume" section, click the "20 L" chip.
- **Expectation (Logic):** The custom text field for liters must be empty.
- **Action:** Type "42.5" into the custom text field for liters.
- **Expectation (Logic):** The "20 L" chip should become deselected. 
- **Action:** Click "15 L".
- **Expectation (Logic):** The custom text field must clear itself.
- *(Note to QA Tester: Repeat this logic check for the Lamp Wattage and Plants Under Lamp sections)*.

## Test 4: Nutrient Brand Selection
- **Context:** The user selects a nutrient brand.
- **Action:** Find the radio button for "Advanced Nutrients" and select it.
- **Expectation (Logic):** The radio button visually updates.

## Test 5: Successful Submission
- **Context:** User fills out all required fields properly.
- **Action:** 
  1. Fill Name: "My Test Plant".
  2. Select Volume: 20 L.
  3. Select Brand: Canna Aqua.
  4. Type: Autoflower.
  5. Lamp: LED, 200W, 1 Plant.
  6. Phase: Veg (Wachstum).
  7. Current Day: 14.
  8. Click Submit.
- **Expectation (Logic):** Form validates. The app routes back to `/`. 
- **Expectation (State):** On the Dashboard, the newly created plant "My Test Plant" must be visible.

## Test 6: Cancel Action
- **Context:** User changes their mind.
- **Action:** Navigate back to `/add_plant`. Scroll to bottom and click "Zurück" (Back/Cancel).
- **Expectation (Logic):** Form is discarded. App routes back to `/`.
