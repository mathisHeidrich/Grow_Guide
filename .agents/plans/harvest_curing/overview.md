---

> [!WARNING]
> **Status:** Noch nicht implementiert im Code.

type: HarvestCuringOverview
order: 0
---
# Grow Guide V2: Ernte, Trocknung & Curing
Version: 2.1.0

## Grundlogik der Post-Ernte-Phase
Sobald der Nutzer im regulären Pflanzen-Check-In auf "Ernten" klickt, verlässt die Pflanze den DWC-Zyklus. 
Auf dem Dashboard durchläuft sie ab dann eine klar getrennte Abfolge von Zuständen:
1. **Status `Trocknung`:** Der tägliche Check-In ist ein reiner Stängel-Knicktest.
2. **Status `Curing`:** Der tägliche Check-In ist ein 15-Minuten Burping-Timer (Lüften der Gläser) für die ersten 2-3 Wochen.
3. **Status `Archiviert`:** Die Pflanze ruht dauerhaft als Trophäe im Offline-Ernte-Archiv (inkl. Ertrag und pH-Fieberkurve).
