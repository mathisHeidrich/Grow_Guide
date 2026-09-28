# Hardware Ratgeber Onboarding Plan

## Ziel
Den Hardware-Ratgeber während des Onboardings benutzerfreundlicher machen. Die 23 Slides werden in eine einzige, kompakte und scrollbare Liste umgebaut. So muss der Nutzer nicht 23 Mal swipen und kann direkt zum Ende der Seite scrollen.

## Beschlossene Umsetzung (Option 2)
- **`lib/screens/hardware_advisor_screen.dart`** wird grundlegend refactored.
- Statt `PageView` nutzen wir einen `ListView` oder eine `CustomScrollView` mit `SliverList`.
- Jeder Hardware-Artikel wird als kompakter Karte/Eintrag dargestellt.
- Kategorisierung (All-In-One, Pflicht, Upgrade) wird durch Sections oder kleine Badges optisch hervorgehoben.
- Am Ende der Liste steht ein großer "Weiter zum Zeltaufbau" Button.
