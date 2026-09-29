# Plan: Optionale Messungen eintragen (EC & pH)

## 1. Ziel
Der Benutzer möchte nach dem Anpassen von EC und pH seine neuen, finalen Messwerte optional eintragen können. Es wird *keine* neue Slide erstellt. Stattdessen werden die Eingabefelder direkt in die bestehenden "Anpassen"-Slides integriert.

## 2. Änderungen

### `lib/l10n/app_de.arb`
- Hinzufügen von Text-Strings für die Eingabefelder:
  - `checkinOptionalEcLabel`: "Neuer EC-Wert (optional)"
  - `checkinOptionalPhLabel`: "Neuer pH-Wert (optional)"

### `lib/screens/checkin_screen.dart`
- **State-Variablen:** 
  Hinzufügen von `double? _inputPostEc;` und `double? _inputPostPh;`.
- **Slide 1: EC anpassen (`_buildEcAdjustSlide`)**
  Am Ende der Slide (vor den "Zurück" / "Weiter" Buttons) wird ein optionales Textfeld für den nachgemessenen EC-Wert (`_inputPostEc`) hinzugefügt.
- **Slide 2: pH anpassen (`_buildPhMeasureSlide`)**
  Am Ende der Slide (vor den Buttons) wird ein optionales Textfeld für den nachgemessenen pH-Wert (`_inputPostPh`) hinzugefügt.
- **Speichern (`_completeCheckin`):**
  - Beim Speichern in die Tabelle `LogEntries` wird für `ec` der Wert `_inputPostEc ?? _inputEc` verwendet.
  - Für `ph` wird der Wert `_inputPostPh` gespeichert.

## 3. Review & Bestätigung
Bitte mit "Plan approved" freigeben. Anschließend setze ich die Code-Änderungen um.
