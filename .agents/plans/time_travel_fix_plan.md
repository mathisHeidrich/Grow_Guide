# Plan: Time-Travel Fix für Check-In Intervalle

## Problem
Beim Überspringen von Tagen in der Simulation (z.B. `+7 Tage`) werden die wöchentlichen Checks (Ventilator am Sonntag, Lampenabstand am Mittwoch) komplett übersprungen, wenn man nicht *exakt* an diesem Wochentag landet. 

## Ziel
Die App soll erkennen, ob seit dem letzten Log-Eintrag (`lastLog`) ein Mittwoch (für Lampe) oder ein Sonntag (für Ventilator) vergangen ist. Wenn ja, soll der entsprechende Check aufpoppen.

## Proposed Changes

### `lib/screens/checkin_screen.dart` [MODIFY]
- Hinzufügen einer Hilfsfunktion `_passedWeekday(DateTime? last, DateTime now, int targetWeekday)`, die auf Basis reiner Kalendertage berechnet, ob der Ziel-Wochentag seit dem letzten Check-In vergangen ist.
- Anpassung der Logik für `lampCheck`: `lampCheck = _passedWeekday(lastLog?.timestamp, now, DateTime.wednesday);`
- Anpassung der Logik für `ventCheck`: `ventCheck = _passedWeekday(lastLog?.timestamp, now, DateTime.sunday);`

## User Review Required
> [!IMPORTANT]
> Bitte bestätige diesen Bugfix-Plan, damit die "+7 Tage" Simulation die Checks zuverlässig triggert!
