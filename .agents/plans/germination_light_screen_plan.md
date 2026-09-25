# Plan: UI-Updates & Check-In Fixes (Licht, Venti, Wasserwechsel)

## Problem 1: LichtAnpassenScreen in der Keimung
Der Screen zur PPFD-Messung am Ende des Keimungs-Assistenten weicht optisch von dem im Check-In ab. In der Keimung fehlt die schöne grüne PPFD-Zielbox.

## Problem 2: Ventilatoren-Check Info
Der Ventilatoren-Check im Check-In liefert auf dem Haupt-Screen zu wenig Informationen bezüglich der Gefahren von Windbrand.

## Problem 3: Lampenabstand-Abfrage zu nervig
Aktuell wird der Lampenabstand (PPFD) bei *jedem* Check-In abgefragt, falls der Nutzer ihn bisher ignoriert hat. 

## Problem 4: Fehlender Zurück-Button beim Wasserwechsel
Auf dem Wasserwechsel-Screen gibt es unten keinen "Zurück"-Button, wie es bei den anderen Wizards üblich ist.

## Proposed Changes

### 1. `lib/screens/germination_wizard_screen.dart` [MODIFY]
- Hinzufügen der markanten grünen Box, die den PPFD-Zielbereich anzeigt, analog zum Check-In (Werte 100 - 300).

### 2. `lib/l10n/app_de.arb` & `checkin_screen.dart` [MODIFY]
- Ergänzen von `checkinVentilatorDesc` um den Hinweis: `\n\nTIPP: Richte den Luftstrom niemals direkt auf die Pflanzen. Ein starrer Luftstrom führt zu Windbrand und trocknet die Blätter aus.`
- Umstellung von `_buildVentilatorSlide` in `checkin_screen.dart` auf `TipFormattedText`.

### 3. Check-In Intervall für Lampe anpassen (`checkin_screen.dart`) [MODIFY]
- Die Logik für `lampCheck` wird vereinfacht: Die PPFD-Messung wird **nur noch strikt mittwochs** abgefragt (genau wie der Ventilator-Check am Sonntag). 

### 4. Zurück-Button beim Wasserwechsel (`water_change_screen.dart`) [MODIFY]
- Hinzufügen eines "Zurück"-Buttons (OutlinedButton) links neben dem "Fertig"-Button, um das Layout an die anderen Assistenten (mit der `Row(flex:1, flex:2)`) anzugleichen. Beim Klick darauf wird der Screen ohne Änderungen geschlossen (`context.pop(false)`).

## User Review Required
> [!IMPORTANT]
> Bitte bestätige diesen Plan: 
> 1. Licht-Box (100-300 PPFD) in Keimung. 
> 2. Windbrand-Warnung beim Venti-Check.
> 3. Lampenabstand nur noch 1x pro Woche.
> 4. Zurück-Button beim Wasserwechsel hinzufügen.
