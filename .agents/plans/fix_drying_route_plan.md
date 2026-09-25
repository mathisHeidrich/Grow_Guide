# Plan: Routing für "Trocknung abgeschlossen" fixen

## Problem
Auf dem Dashboard heißt der Button bei einer Pflanze in der Trocknungsphase korrekt "Trocknung abgeschlossen (Snap-Test)". Klickt man ihn, wird man jedoch zum regulären Check-In-Screen (`CheckinScreen`) weitergeleitet, der für diese Phase gar nicht gedacht ist. Stattdessen sollte man zum "Lagern und Burpen"-Wizard (`FinishWizardScreen`) gelangen, der das Trimmen und Curing erklärt und die Pflanze danach archiviert.

## Ursache
Der zentrale GoRouter fängt unter `/checkin/:id` zwar die Keimungsphase ab (und leitet auf `GerminationWizardScreen` um), aber nicht die Trocknungs- oder Curing-Phase. Dadurch fällt das Routing auf den Standard-Check-In zurück.

## Proposed Changes

### `lib/router.dart` [MODIFY]
- Erweiterung der Logik in der Route `/checkin/:id`:
  Wenn `plant.currentPhase == PlantPhase.drying` (oder `curing`), wird statt `CheckinScreen` der `FinishWizardScreen(plantId: id)` zurückgegeben.
  Dadurch führt der Klick auf "Trocknung abgeschlossen" endlich korrekt zum "Lagern und Burpen"-Wizard.

## User Review Required
> [!IMPORTANT]
> Bitte bestätige diesen Bugfix-Plan, damit der Klick auf "Trocknung abgeschlossen" dich richtig zum Trimmen, Lagern und Burpen weiterleitet!
