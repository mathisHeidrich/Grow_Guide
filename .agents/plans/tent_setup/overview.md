---

> [!NOTE]
> **Status:** Implementiert. Alle UI-Texte sind über `AppLocalizations` (i18n) ausgelagert. Hardcodierte Strings sind nicht erlaubt.

type: TentSetupOverview
order: 0
---
# Grow Guide V2: Hardware Setup Wizard (Der Zelt-Aufbau)
Version: 1.0.0

## Grundlogik des Setup-Wizards
Dieser Wizard richtet sich an Anfänger, die ihr Grow-Equipment gekauft haben und nun vor dem Berg an Kartons stehen. 
**Der Zelt-Aufbau ist der Türsteher der App:** Er wird direkt nach den initialen App-Erklärungs-Folien (App-Onboarding) angeboten. Klickt der Nutzer dort auf "Zelt gemeinsam aufbauen", startet dieser Guide. Überspringt der Nutzer ihn, kann er später jederzeit über das Menü `Equipment` abgerufen werden.
Der Flow nutzt das gleiche interaktive, ablenkungsfreie UI-Design wie der Check-In: Ein klärendes Bild pro Schritt, prägnanter Text, der typische Anfängerfehler vermeidet, und große Bestätigungs-Buttons.
