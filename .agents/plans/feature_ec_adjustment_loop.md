# EC Adjustment Loop

Wenn der gemessene EC-Wert zu hoch ist, soll der User nicht einfach abspeichern können. Stattdessen wird er durch eine Schleife geführt, um den Wert tatsächlich anzupassen und neu zu messen.

## Vorgeschlagene Änderungen

### 1. `lib/screens/ec_adjust_screen.dart`
- **Wasser-Alter abfragen:** Beim Laden der Pflanze prüfen wir, wann der letzte komplette Wasserwechsel stattfand (oder Startdatum der Phase).
- **TextEditingController einführen:** Damit wir das Eingabefeld programmgesteuert leeren können.
- **State `_partialWaterChangesCount` (int, default = 0):** Um zu tracken, wie oft der User bereits einen Teilwasserwechsel versucht hat.
- **Save-Button verstecken:** Der Button "Werte speichern" wird ausgeblendet, solange `isEcTooHigh` `true` ist.

### 2. Logik der Warnungen & Buttons
Wenn `_inputEc > (targetEc + 0.3)`:

- **1. Versuch (`_partialWaterChangesCount == 0`):**
  - **Prüfung der Härte:** Ist das Wasser älter als 7 Tage ODER ist die Abweichung sehr groß (`_inputEc - targetEc > 0.8`)?
    - **JA (Alt / Extrem):** Zeige `checkinEcTooHighFull` (Kompletter Wechsel erforderlich).
    - **NEIN (Frisch / Leicht):** Zeige `checkinEcTooHighPartial` (30% abpumpen).
  - **Button:** "Erledigt, neu messen"
  - **Aktion:** `_partialWaterChangesCount` wird erhöht, `_ecController.clear()` und `_inputEc = null`.

- **Ab dem 2. Versuch (`_partialWaterChangesCount > 0`):**
  - Wenn der Wert *immer noch* zu hoch ist, wird **immer** `checkinEcTooHighFull` (Kompletter Wasserwechsel) angezeigt.
  - **Neu (Tipp):** Es wird ein zusätzlicher Hinweis eingeblendet: "Tipp: Wenn der Wert trotz frischem Wasser immer noch extrem hoch ist, überprüfe bitte dein EC-Messgerät. Möglicherweise muss es neu kalibriert werden."
  - **Button:** "Wasser komplett gewechselt, neu messen"
  - **Aktion:** Feld leeren für neue Messung.

### 3. `lib/l10n/app_de.arb` & `app_de.arb`
- **Neue Strings hinzufügen:**
  - "actionDoneMeasureAgain": "Erledigt, neu messen"
  - "actionFullWaterChangeDone": "Komplett gewechselt, neu messen"
  - "checkinEcCalibrationTip": "Tipp: Wenn der EC-Wert trotz Wasserwechsel immer noch sehr hoch ist, solltest du dringend dein EC-Messgerät mit Kalibrierflüssigkeit prüfen. Oft ist das Messgerät verstellt."
