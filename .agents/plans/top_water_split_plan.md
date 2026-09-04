# Plan: Split "Top Water" Screen in Check-in

## 1. Goal
The user wants to refine the flow in the Check-in screen when the plant's roots have not yet reached the water (typically during the early veg/seedling phase). 

Currently, the Check-in screen combines the question of whether roots have reached the water with instructions on how to water. Additionally, it always asks for pH and EC values regardless of the root state.

## 2. Changes
We will update the page flow in `lib/screens/checkin_screen.dart` and update localizations in `app_de.arb`.

### Flow Adjustment
1. **Roots Check Screen (`_buildRootsCheckSlide`)**
   - **Question**: "Sind die Wurzeln schon im Wasser?" (Are the roots already in the water?)
   - **UI**: A choice selection (e.g., Toggle or Radio buttons) for "Ja" or "Nein" at the top.
   - **Action**: A "Weiter" (Next) button at the bottom.

2. **Branching Logic**
   - **If "Nein" (Roots not in water)**:
     - Show **Top Watering Screen (`_buildTopWateringSlide`)**.
     - **Instructions**: Explicitly state that the user should take some water *from the pot* and pour it over the top, and they should *not* add extra new water. Also state that pH and EC control are not needed yet.
     - **Next**: Skips the measurement screen and goes directly to the next relevant check-in screen (e.g., Lamp check).
   - **If "Ja" (Roots in water)**:
     - Save to DB that roots reached water.
     - Show **Measurement Screen (`_buildMeasurementSlide`)** for pH and EC control (existing screen).
     - **Next**: Show a new **Adjustment Example Screen (`_buildAdjustmentExampleSlide`)**.

3. **Adjustment Example Screen (`_buildAdjustmentExampleSlide`)**
   - **UI**: A placeholder screen showing an example of how to adjust pH and EC.
   - **Action**: A "Weiter" button to continue the Check-in flow.

### Localization Changes (app_de.arb)
We will add/modify string keys for:
- Roots check question and options (Yes/No).
- The new top-watering instructions.
- The adjustment example screen placeholder texts.
