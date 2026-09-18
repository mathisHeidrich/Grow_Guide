# Plan: Fix Check-In Logic & DB Schema auf `feature-water-adjustment`

## Ziel
Behebung der identischen Logikfehler im Check-In Flow (Datenverlust, vorzeitiges Speichern) auf dem `feature-water-adjustment` Branch.

## 1. Datenbank-Schema anpassen
**Datei:** `lib/database/tables.dart`
- Die Spalten `ph` und `ec` in der Tabelle `LogEntries` werden `nullable` gemacht (`RealColumn get ph => real().nullable()();`).

## 2. Check-In Speichern anpassen
**Datei:** `lib/screens/checkin_screen.dart`
- In der Methode `_completeCheckin()`:
  - Der `if (_inputPh != null && _inputEc != null)` Check wird entfernt.
  - Beim Speichern von `ph` und `ec` wird `drift.Value.absent()` als Fallback benutzt.
  - Der `rootsReachedWater`-Status wird hier am Ende für `_tempRootsInWater == true` aktualisiert.

## 3. Zwischenspeichern reparieren
**Datei:** `lib/screens/checkin_screen.dart`
- Im `_buildRootsCheckSlide()` (Klick auf Next-Button):
  - Das sofortige Speichern von `rootsReachedWater = true` in der Datenbank wird entfernt.

---
Bitte antworte mit "Plan approved", um diese Anpassungen auch auf diesem Branch durchzuführen.
