# Architektur-Plan: Zelt-Ebene (Tent Environment)

## Ziel
Umstellung des Datenmodells von einem "1 Pflanze = 1 Setup" Ansatz auf ein strukturiertes Modell, bei dem Pflanzen (Genetik, Wasserwerte) einem Zelt/Raum (Umgebung, Lampe) zugeordnet sind. Dies reduziert redundante Eingaben und spiegelt die Realität der Nutzer besser wider (Option A).

## 1. Datenbank-Änderungen (Drift)

### Neue Tabelle: `Tents`
*   `id`: Integer, Auto-Increment
*   `name`: Text (z.B. "Hauptzelt", "Veg-Zelt")
*   `lampWattage`: Integer
*   `lampType`: Text (z.B. "LED")
*   `lightSchedule`: Text (z.B. "18/6", "12/12")

### Anpassungen an `Plants`
*   **Hinzufügen:** `tentId` (Integer, verweist auf `Tents.id`)
*   **Entfernen / Deprecate:** `lampWattage`, `lampType`, `plantsUnderLamp` (diese wandern in das Zelt). *Anmerkung zu SQLite:* Da das Löschen von Spalten in SQLite aufwändig ist, werden wir die Spalten entweder ignorieren oder über Drifts `TableMigration` sauber entfernen.

### Migration (Version 5 -> 6)
1.  Erstelle die Tabelle `Tents`.
2.  Erstelle beim ersten App-Start nach dem Update automatisch ein "Default Zelt" (z.B. "Mein Zelt").
3.  Übertrage die Lampen-Daten der ersten gefundenen Pflanze in dieses Zelt.
4.  Setze bei allen bestehenden Pflanzen die `tentId` auf die ID dieses neuen Zelts.

## 2. UI & UX Änderungen

### Home Screen (`lib/screens/home_screen.dart`)
*   **Bisher:** Liste aller Pflanzen.
*   **Neu:** Liste der Zelte. Jedes Zelt ist eine Karte (Card), die aufklappbar ist oder direkt die darin befindlichen Pflanzen anzeigt.
*   **Quick-Actions am Zelt:** Zelt-Einstellungen bearbeiten (Lampe, Name).

### Zelt bearbeiten / Erstellen (Neuer Screen)
*   Eingabe von Zelt-Name, Lampentyp, Wattzahl.

### Pflanze erstellen / bearbeiten (`lib/screens/plant_setup_screen.dart` o.ä.)
*   **Entfernen:** Abfrage nach Lampe und Wattzahl.
*   **Hinzufügen:** Auswahl des Zelts (Dropdown), in das die Pflanze gestellt werden soll (falls mehr als 1 Zelt existiert).

### Batch-Aktionen (Bonus für die UX)
*   Wir könnten am Zelt einen Button hinzufügen: "Wasserwechsel für alle Pflanzen in diesem Zelt eintragen" oder "Lichtzyklus auf 12/12 ändern (Blüte einleiten)". Letzteres betrifft dann automatisch alle Photo-Pflanzen im Zelt.

## 3. Nächste Schritte nach Freigabe
1.  `tables.dart` und `database.dart` anpassen & `build_runner` ausführen.
2.  Migrations-Logik schreiben und testen (alte Daten dürfen nicht verloren gehen!).
3.  Riverpod-Provider (`lib/providers/`) für Zelte hinzufügen.
4.  Home-Screen UI umbauen.
5.  Pflanzen-Setup UI anpassen.

---
Bitte bestätige diesen Plan (z.B. mit "Plan approved"), bevor ich mit der Programmierung beginne.
