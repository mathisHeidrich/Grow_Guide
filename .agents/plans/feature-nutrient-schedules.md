# Plan: Implementierung der Hersteller-Düngeschemata

## Ziel
Hinzufügen der offiziellen Hydroponik-Düngeschemata für **CANNA**, **Advanced Nutrients** und **Plagron** in die App, basierend auf den Herstellerangaben.

## Änderungen

### 1. `lib/services/nutrient_service.dart`

**[MODIFY] `lib/services/nutrient_service.dart`**
- Implementierung neuer Klassen, die das Interface `NutrientSchedule` implementieren:
  - `CannaAquaSchedule`: Nutzt die Werte für Aqua Vega A+B und Aqua Flores A+B.
  - `AdvancedNutrientsSchedule`: Nutzt die Werte für Grow, Micro, Bloom (1-4 ml/L).
  - `PlagronHydroSchedule`: Nutzt die Werte für Hydro A und Hydro B (1.6-2.5 ml/L).
- Jede Klasse implementiert:
  - `brandName` (Rückgabe des Namens als String)
  - `getTargetEc(PlantPhase phase, int weekIndex)` (Rückgabe des optimalen EC-Werts für die Phase/Woche)
  - `getBaseMlPerLiter(PlantPhase phase, int weekIndex, List<String> userAdditives)` (Rückgabe der Komponenten in ml/L)
- Erweiterung der Switch-Anweisung in `NutrientService.getScheduleForBrand(NutrientBrand brand)`:
  - `case NutrientBrand.cannaAqua: return CannaAquaSchedule();`
  - `case NutrientBrand.advancedNutrients: return AdvancedNutrientsSchedule();`
  - `case NutrientBrand.plagron: return PlagronHydroSchedule();`

### 2. EC-Zielwerte (Target EC)
Für jede neue Klasse müssen sinnvolle Target-EC-Werte definiert werden, falls die Hersteller keine genauen EC-Verläufe angeben. In der Regel steigt der EC in der Wachstumsphase auf ~1.2-1.5 an und in der Blüte auf ~1.6-2.0. Die Werte werden analog zur bereits bestehenden `TerraAquaticaTriPartSchedule`-Implementierung oder den Herstellerangaben gesetzt.

## Offene Fragen zur Klärung (User Review Required)
- **Target EC:** Sollen die EC-Zielwerte für CANNA, Advanced Nutrients und Plagron analog zu Terra Aquatica gewählt werden (Wachstum ansteigend 0.8 -> 1.4, Blüte ansteigend 1.5 -> 1.8), oder hast du hier spezielle Vorgaben?
- **Zusätze (Additives):** Die Hersteller haben noch spezielle Zusätze (wie CANNAZYM, RHIZOTONIC etc.). Für diesen ersten Schritt implementieren wir primär die **Basisdünger (A+B bzw. Grow/Micro/Bloom)** sowie ggf. CalMag und Silica als Standard-Zusätze, korrekt?

## Verifizierung
- Ausführen der Unit-Tests (falls vorhanden) für den `NutrientService`.
- Manuelles Prüfen über den `main_test_env.dart` Test-Einstieg in der App, um zu sehen, ob bei Auswahl der neuen Marken die richtigen Werte für die Check-Ins berechnet werden.
