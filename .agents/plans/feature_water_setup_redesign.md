# Plan: Water Setup Redesign & EC Messung

## User Review Required
> [!IMPORTANT]
> Bitte prüfe, ob die neuen Texte (i18n) und der überarbeitete Flow (PageView statt Wizard) so für dich passen. Besonders die Erklärungen zum Grund-EC und dessen Einfluss auf den Dünger sind neu hinzugekommen.

## Open Questions -> Resolved
Wir haben uns darauf geeinigt: Wenn der User "Ich habe mein Messgerät noch nicht" klickt, speichern wir den Wert vorerst als `unknown`. Da das Messgerät für die Keimung noch nicht zwingend gebraucht wird, kann der Nutzer die App so erst einmal in Ruhe kennenlernen. 
Wir blenden einen kurzen Hinweis ein: *"Kein Problem! Für die Samen-Keimung brauchst du es noch nicht. Wir erinnern dich daran, bevor du das erste Mal Dünger anmischst."*

## Background & Research: Grund-EC und Dünger
Der Grund-EC (Base EC) des Leitungswassers besteht hauptsächlich aus Kalzium, Magnesium und Karbonaten/Bikarbonaten. 
- **Einfluss auf Dünger:** In der Hydroponik / DWC gibt es ein Limit, wie hoch der Gesamt-EC-Wert für die Pflanze sein darf (z.B. 1.5 in der Wachstumsphase). Wenn das Wasser schon einen Grund-EC von 0.6 hat, bleibt nur noch 0.9 für den tatsächlichen N-P-K-Dünger. Bei einem Grund-EC von 0.2 bleibt mehr Platz (1.3) für essenzielle Nährstoffe. 
- **Zusätze:** Bei weichem Wasser (niedriger EC) muss oft CalMag hinzugefügt werden. Bei hartem Wasser (hoher EC) ist meist genug CalMag vorhanden, manchmal sogar zu viel, weshalb spezielle "Hard Water" Dünger verwendet werden.
Diese Infos werden im neuen Flow leicht verständlich an den Nutzer kommuniziert.

## Proposed Changes

### `lib/l10n/app_de.arb`
Wir fügen neue Übersetzungen für die PageView-Slides im Water Setup hinzu und passen die Erklärungen für das Messen mit dem EC-Meter an.
- Neue Texte für die Anleitung zum EC-Messen (Glas nehmen, Wasser rein, Messgerät rein, Wert ablesen).
- Text für den Knopf "Ich habe mein Messgerät noch nicht" und den Hinweis, dass man die App trotzdem für die Keimung nutzen kann.
- Erklärung zum Grund-EC und dessen Auswirkung auf den Dünger.

### `lib/screens/water_setup_screen.dart`
Wir ersetzen den internen "Wizard" (AnimatedSwitcher & ListView) durch einen `PageView`, der denselben visuellen Aufbau wie der `TentSetupScreen` verwendet.
- **Slide 1:** Intro & Erklärung, warum der Grund-EC wichtig für die Düngermischung ist.
- **Slide 2:** Anleitung zum Messen mit dem EC-Messgerät.
- **Slide 3:** Auswahl des gemessenen EC-Wertes (0.0-0.3, 0.4-0.6, etc.) oder der "Ich habe mein Messgerät noch nicht"-Button.
- **Slide 4:** Abfrage zum Thema Chlor (wie vorher, aber als eigenständiger Slide).
- **Slide 5:** Abschluss des Setups.

---

#### [MODIFY] `lib/l10n/app_de.arb`
Hinzufügen/Ändern der Texte für das Water Setup, passend zum neuen Flow.

#### [MODIFY] `lib/screens/water_setup_screen.dart`
Umschreiben zu einem `ConsumerStatefulWidget` mit `PageView` (analog zu `TentSetupScreen`). Nutzung von `_buildSlide(...)` Methoden für eine einheitliche UX.

## Verification Plan
### Manual Verification
1. App neu starten und Onboarding-Flow durchgehen.
2. Prüfen, ob nach dem Zeltaufbau das neue Water-Setup als PageView erscheint.
3. Kontrollieren, ob der Button "Ich habe mein Messgerät noch nicht" den EC-Wert korrekt als `unknown` speichert.
4. UI & Texte der Slides auf Konsistenz prüfen.
