# Plan: Onboarding Experience Assessment & Contextual Learning

## Ziel
Den Nutzer beim ersten App-Start nach seinem Erfahrungslevel fragen, ohne ihn danach mit langen Text-Wüsten zu überfordern. Die App soll auf "Learning by Doing" setzen: Erklärungen und Hintergrundwissen werden kontextbezogen genau dann vermittelt, wenn der Nutzer die entsprechende Aktion ausführt (z.B. beim täglichen Check-in).

## 1. Die Erfahrungs-Level
- **Anfänger:** Braucht detaillierte Erklärungen zum "Warum" (z.B. warum pH-Wert wichtig ist), aber häppchenweise im Alltag.
- **Erde-Umsteiger:** Braucht den Vergleich zu Erde (z.B. "Hier gibt es keinen Puffer, Nährstoffe wirken sofort").
- **DWC-Erfahren:** Braucht kaum Theorie, Fokus auf Effizienz und Troubleshooting.

## 2. Technische Umsetzung (Proposed Changes)

### Phase 1: Die Abfrage (Onboarding)
1. **Datenbank & Settings:** 
   - `lib/models/app_settings.dart`: Neues Feld `experienceLevel` (z.B. String `beginner`, `soil`, `pro`).
2. **Neuer Screen (`lib/screens/experience_assessment_screen.dart`):**
   - Wird in den Onboarding-Flow integriert (z.B. direkt nach den Willkommens-Slides).
   - Ein simpler, schöner Screen mit 3 Karten zur Auswahl.
3. **Flow-Anpassung:**
   - Onboarding bleibt super kurz! Nach der Auswahl geht es direkt weiter. Keine "Deep Dive" Theorie-Screens im Onboarding.

### Phase 2: Contextual Learning (Learning by Doing)
1. **Tägliche Check-ins & Setup:**
   - In den Screens (z.B. `WaterSetupScreen`, `CheckinScreen`, `PhAdjustScreen`) lesen wir das `experienceLevel` aus.
   - **Anfänger** sehen eine kleine, freundliche Info-Box ("Wusstest du schon: Der pH-Wert...").
   - **Pros** sehen nur die Eingabefelder.
2. **Wissensvermittlung während der Fahrt:**
   - Wenn ein Anfänger z.B. seinen ersten EC-Wert misst, erklären wir ihm genau in diesem Moment, was der EC-Wert eigentlich misst.
