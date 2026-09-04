# Plan: Licht-Einstellungs-Screen (PPFD Meter)

## Ziel
Der PPFD-Meter-Screen (`PpfdMeterScreen`) soll so überarbeitet werden, dass der Benutzer intuitiv das Licht seiner Pflanze messen und einstellen kann. Der Screen soll den aktuellen Ziel-Wert basierend auf der Lebensphase der Pflanze anzeigen, sowie Start/Stop-Funktionalität für die Messung bieten.

## Workflow für den Nutzer
1. **Screen betreten:** Die Kamera startet automatisch und zeigt den Live-PPFD-Wert. **WICHTIG: Ein Hinweis weist den Nutzer deutlich darauf hin, dass ein Diffusor (z. B. ein Stück Papier) über der Kamera benötigt wird.**
2. **Ziel-Wert abgleichen:** Oben auf dem Bildschirm sieht der Nutzer den Ziel-PPFD-Bereich für die aktuelle Phase (z.B. Veg-Phase: 300 - 600 µmol/m²/s). 
3. **Visuelles Feedback & Pfeile:** Die Farbe des aktuellen Werts zeigt an, ob man im Zielbereich ist (Rot = zu viel, Blau/Gelb = zu wenig, Grün = perfekt). Zusätzlich wird ein **Pfeil nach oben (⬆️)** angezeigt, wenn mehr Licht benötigt wird, und ein **Pfeil nach unten (⬇️)**, wenn das Licht zu stark ist.
4. **Lampe anpassen:** Der Nutzer verstellt die Höhe oder den Dimmer der Lampe. Der Wert und die Pfeile aktualisieren sich live.
5. **Wert einfrieren:** Über einen großen "Pause / Wert festhalten"-Button kann die Messung gestoppt werden.
6. **Entscheidung:** Ist der Wert eingefroren, ändern sich die Buttons zu "Neu Messen" (Kamera startet wieder) und "Wert speichern" (beendet den Screen und speichert den Wert im Check-in).

## Technische Änderungen

### 1. `lib/models/plant.dart` & `lib/database/tables.dart`
- Hinzufügen einer Helper-Extension für `PlantPhase`, die den Ziel-PPFD-Bereich als `(int min, int max)` zurückgibt.
  - Onboarding/Archived: (0, 0)
  - Germination: (100, 300)
  - Veg: (300, 600)
  - Flower: (600, 1000)
  - Drying/Curing: (0, 0)

### 2. Router / Check-in Screen
- Der `Router` (`router.dart`) und der Check-in Screen (`checkin_screen.dart`) müssen so angepasst werden, dass die aktuelle Plant-ID oder die `PlantPhase` als Argument an den `PpfdMeterScreen` übergeben wird.
- Bisheriger Aufruf: `context.push<double>('/ppfd_meter')` -> Neuer Aufruf: `context.push<double>('/ppfd_meter?plantId=X')`.

### 3. `lib/screens/ppfd_meter_screen.dart`
- **Zustand (State):** Ein boolscher State `isMeasuring` (default: true).
- **UI-Aufbau:**
  - **Hinweis:** Warnung / Hinweis für die Benutzung eines Diffusors.
  - **Header-Karte:** Zeigt "Zielbereich: X - Y µmol" an.
  - **Live-Wert & Pfeile:** Groß zentriert, mit farblichem Feedback (Grün, wenn im Zielbereich) und entsprechenden Pfeilen (⬆️/⬇️).
  - **Controls (Start/Stop):** 
    - Wenn `isMeasuring == true`: Zeige "Wert festhalten" (Pause-Icon).
    - Wenn `isMeasuring == false`: Zeige "Neu Messen" (Play-Icon) und daneben "Speichern".

### 4. `lib/l10n/app_de.arb` (und andere Sprachen)
- Neue Strings hinzufügen:
  - `ppfdTargetRange`: "Zielbereich: {min} - {max}"
  - `ppfdHoldValue`: "Wert festhalten"
  - `ppfdMeasureAgain`: "Neu messen"
  - `ppfdSaveValue`: "Wert speichern"
  - `ppfdDiffuserWarning`: "Bitte lege einen Diffusor (z. B. ein Blatt Papier) flach über die Kamera, um präzise zu messen."
  - `ppfdNeedsMoreLight`: "Mehr Licht"
  - `ppfdNeedsLessLight`: "Weniger Licht"
