# Plan: Dashboard Check-In Button Logic

## Goal
1. Das Dashboard reaktiv machen (StreamBuilder), damit Änderungen am Check-in direkt sichtbar werden.
2. Die Check-in-Häufigkeit durch klare Zeitintervalle regeln.
3. Direkt nach dem Einpflanzen keinen sofortigen Check-in erzwingen.
4. Die Logik entfernen, die den Button rot macht, falls der pH-Wert minimal abweicht (da der Nutzer diesen ja im Check-in ohnehin korrigiert).

## Proposed Changes

### 1. Dashboard reaktiv machen
In `lib/screens/dashboard_screen.dart`:
Statt `FutureBuilder<List<Plant>>` (der sich beim Zurück-Navigieren evtl. nicht aktualisiert) nutze ich `StreamBuilder<List<Plant>>` mit `db.plants.where().watch(fireImmediately: true)`. So wird der Button garantiert grün, sobald man aus dem Check-in Screen zurückkehrt!

### 2. Zeitintervalle & pH-Kritik entfernen
In `_buildPlantCard`:
Ich entferne die `isPhOut` Logik (da der Nutzer den Wert ja beim Messen schon korrigiert).
Stattdessen gelten reine Zeitintervalle für den Button:
- **0 bis 48 Stunden**: GRÜN (`Alles okay`)
- **48 bis 96 Stunden (2-4 Tage)**: GELB (`Check-in empfohlen`)
- **Über 96 Stunden (> 4 Tage)**: ROT (`Check-in überfällig!`)

### 3. Frisch eingepflanzt (Noch kein Check-in)
Wenn `measurementHistory.isEmpty` ist und die Pflanze im Vegi-Stadium ist:
- **Tag 1 der Vegi-Phase**: Der Button ist GRÜN ("Alles okay"), da die Pflanze gerade erst eingepflanzt wurde.
- **Ab Tag 2**: Der Button wird ROT ("Erster Check-in fällig").

Dazu füge ich in die `app_de.arb` neue Texte ein (wie `plantStatusAllOk`, `plantStatusOverdue`).
