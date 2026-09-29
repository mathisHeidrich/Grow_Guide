# Hardware List Grow Levels Plan

## Goal
The user wants the hardware list (`HardwareAdvisorScreen`) to reflect that certain items are only needed depending on the chosen "Anbau Stufe" (Grow Level). Currently, all items are shown in one large list. 

## Open Questions for the User
> [!IMPORTANT]
> Wie möchtest du, dass die Level in der Liste dargestellt werden?
> 
> **Option A (Toggle/Tabs):** Oben auf der Seite gibt es Buttons (z.B. "Level 1" und "Level 2"). Wenn man auf "Level 1" klickt, sieht man nur die Basis-Hardware. Bei "Level 2" kommen die Profi-Sachen (EC-Meter, ScrOG-Netz etc.) dazu.
> 
> **Option B (Gruppiert in einer Liste):** Alles bleibt in einer scrollbaren Liste, aber es gibt klare Überschriften: "Basis Hardware (Level 1)" und weiter unten "Profi Hardware (Level 2)".
> 
> **Option C (Badges):** Die Liste bleibt wie sie ist, aber die Level 2 Items bekommen ein klares Badge "Nur für Level 2".

## Proposed Changes

### 1. Update `_HardwareItemData` in `hardware_advisor_screen.dart`
- Add a new property `requiredLevel` (e.g., `int? requiredLevel`) to `_HardwareItemData`.
  - `null` (or `1`) = Needed for all levels.
  - `2` = Only needed for Level 2 (Profi).

### 2. Add New Level 2 Specific Items
We will add new hardware items specific to Level 2 (as mentioned in the Level 2 description in `app_de.arb`):
- **ScrOG-Netz (Screen of Green)**: Für LST und Ertragssteigerung.
- **CalMag / Zusätzliche Dünger (Booster)**: Optional, aber in Level 2 erwähnt. (Evtl. nur das ScrOG Netz und Messgeräte als Hardware).
- Existing items like `EC/TDS-Messgerät`, `Durchlaufkühler` (Water Chiller), `Zweiter DWC-Eimer` (Second bucket), and `Umkehrosmose-Anlage` (RO System) will be marked as **Level 2**.

### 3. Localization Update (`app_de.arb`)
- Add new strings for the Level toggle or sections (z.B. `hw_level1_filter`, `hw_level2_filter`, `hw_scrog_netTitle`, `hw_scrog_netDesc`).

### 4. UI Implementation (`hardware_advisor_screen.dart`)
- Depending on the user's feedback (Option A, B, or C), update the `build` method of `HardwareAdvisorScreen` to filter, group, or badge the hardware items based on their `requiredLevel`.

## Verification Plan
- Build the app and verify the `HardwareAdvisorScreen` visually.
- Ensure the newly added Level 2 items are correctly translated and have Amazon Links / Options if necessary.
- Ensure the routing back and forth works as before.
