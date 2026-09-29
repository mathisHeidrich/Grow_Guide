# Plan: Grow Level (Schwierigkeitsgrad) pro Pflanze

## 1. Goal
Wir ersetzen das Konzept "Wissensstand" durch "Grow Level" (z.B. Level 1 & Level 2). Die Level werden im Onboarding lediglich **erklärt**, aber erst **beim Anlegen einer Pflanze** ausgewählt.
Dadurch wird der Vergleich transparenter und mit Schätzungen versehen.

## 2. Proposed Changes

### 2.1 Datenbank & Schema
- **`lib/database/tables.dart`**:
  - Füge `TextColumn get growLevel => text().nullable()();` zur `Plants` Tabelle hinzu (Werte `'level1'`, `'level2'`).
  - Entferne `experienceLevel` aus der `AppSettingsTable`.
- **`lib/database/database.dart`**:
  - Erhöhe `schemaVersion` auf 5.
  - Füge einen Migrationsschritt hinzu: `await m.addColumn(plants, plants.growLevel);`

### 2.2 Onboarding (Erklärung statt Abfrage)
- **`lib/screens/experience_assessment_screen.dart`**:
  - Wird umgebaut zu einem reinen Info-Screen (z.B. "Grow Levels erklärt"), der die Unterschiede zwischen Level 1 und Level 2 vergleichend darstellt (ohne Speicherung in der DB).
  - Der "Weiter"-Button verweist wie bisher danach auf `/hardware_advisor`.
- **`lib/screens/app_onboarding_screen.dart`**:
  - Passe den Text der letzten Folie an (z.B. "Lass uns kurz die verschiedenen Grow Levels ansehen...").

### 2.3 Pflanze anlegen (Add Plant)
- **`lib/screens/add_plant_screen.dart`**:
  - Füge im Formular einen neuen Abschnitt "Grow Level" hinzu.
  - Auswahl zwischen "Level 1" und "Level 2".
  - Speichere die Auswahl in der neuen Spalte `growLevel` beim Speichern der Pflanze.

### 2.4 Lokalisierung (l10n)
- **`lib/l10n/app_de.arb`**:
  - Ändere die `experience...` Strings zu Info-Texten über die Grow Levels.
  - Füge neue Strings für das Pflanzen-Formular und den Erklär-Screen hinzu:
    - Level 1 Beschreibung (Vergleich/Schätzung): "Leichter Einstieg. ~50-80g Ertrag. Aufwand: Niedrig. Methoden: LST (Draht) & Defoliation. Einfacher Dünger."
    - Level 2 Beschreibung (Vergleich/Schätzung): "Maximales Potenzial. ~100-150g+ Ertrag. Aufwand: Hoch. Methoden: ScrOG, CalMag-Optimierung, etc."

## 3. Verification
- App lässt sich kompilieren.
- Drift-Datenbank-Generierung (`dart run build_runner build -d`) läuft fehlerfrei durch.
- Neue Pflanze kann erfolgreich mit einem Grow Level angelegt werden.
- Onboarding zeigt die Erklärung an und blockiert den Nutzer nicht mit einer erzwungenen Auswahl.
