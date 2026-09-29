# Plan: Onboarding & Grow Levels Update

## 1. Onboarding Screen anpassen
**Datei:** `lib/screens/app_onboarding_screen.dart`
- Entfernen der 4. Seite ("Bereit für den Start").
- Der Button auf der 3. Seite ("Loslegen") wird so angepasst, dass er direkt zur nächsten Seite (`/experience_assessment`) navigiert.

## 2. Grow Levels Vergleich verbessern
**Datei:** `lib/screens/experience_assessment_screen.dart`
- Die Darstellung der zwei Level-Karten (Level 1 und Level 2) wird in eine nebeneinanderliegende Ansicht (`Row`) geändert.
- Innerhalb der Karte (`_buildInfoCard`) wird das Layout von horizontal auf vertikal (Icon oben, Text darunter) umgestellt, da die Karten nebeneinander schmaler sind.
