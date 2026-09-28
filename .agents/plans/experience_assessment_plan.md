# Plan: Onboarding Experience Assessment

## Ziel
Nutzer im Onboarding nach ihrem Erfahrungsstand fragen und die darauf folgenden Erklärungen, den Hardware-Ratgeber sowie zukünftige Tutorials (z.B. Zelt- und Wasser-Setup) an dieses Level anpassen.

## 1. Szenarien & Informationsbedarf (Brainstorming)

### Level 1: Absoluter Anfänger
- **Profil:** Hat noch nie Pflanzen angebaut, keine Ahnung von DWC.
- **Bedarf:** 
  - **Deep-Dive Intro:** Wie funktioniert eine Pflanze? (Lichtbedarf, Photosynthese-Basics). Was ist Deep Water Culture einfach erklärt? (Wurzeln im Wasser, Sauerstoffstein).
  - **Hardware:** Braucht die komplette Erklärung (wie in Option 2 gebaut), inkl. Basis-Ausstattung (Zelt, Abluft).
  - **Ton:** Sehr ermutigend, keine Fachbegriffe ohne Erklärung.

### Level 2: Erde-Umsteiger (Erfahren mit Pflanzen, neu bei DWC)
- **Profil:** Kennt sich mit Lichtzyklus (18/6, 12/12) und Zeltklima aus, hat aber noch nie Hydroponik gemacht.
- **Bedarf:**
  - **DWC Transition Guide:** Fokus auf die Unterschiede zur Erde. (Fehlender Puffer der Erde, direkte Nährstoffaufnahme, EC- und pH-Werte sind kritisch).
  - **Hardware:** Fokus auf DWC-spezifische Hardware (pH/EC-Messgerät, Luftpumpe, Hydro-Dünger). Zelt und Licht können oft übersprungen werden.
  - **Ton:** Fokussiert auf Hydro-Besonderheiten.

### Level 3: DWC-Erfahren (Zweiter Versuch / Pro)
- **Profil:** Hat DWC schon gemacht, vielleicht Rückschläge gehabt oder sucht nur ein Tracking-Tool.
- **Bedarf:**
  - **Deep-Dive Intro:** Komplett überspringen.
  - **Hardware:** Nur eine kompakte Checkliste anzeigen oder komplett überspringen.
  - **Fokus:** Eher auf Trouble-Shooting, Warnungen vor Wurzelfäule (Wassertemperatur!) und direkte Nutzung des Dashboards.

## 2. Technische Umsetzung (Proposed Changes)

1. **Datenmodell erweitern (`lib/models/app_settings.dart` & `lib/providers/database_provider.dart`):**
   - Neues Feld `experienceLevel` in den AppSettings (Enum: `beginner`, `soil`, `dwc_experienced`, `unspecified`).

2. **Neuer Screen (`lib/screens/experience_assessment_screen.dart`):**
   - Wird nach den ersten 4 generellen Slides (oder anstelle von Slide 4) eingeschoben.
   - Stellt die Frage: "Wie viel Erfahrung hast du bereits?" mit 3 schönen Auswahl-Karten.

3. **Adaptiver Flow (Router & Onboarding Logik):**
   - **Beginner:** Sieht nach der Auswahl einen neuen Screen `DeepDiveIntroScreen` (oder Erweiterung des Onboardings), danach den vollen Hardware-Ratgeber.
   - **Soil:** Sieht `HydroTransitionScreen` (Erde vs Wasser), dann gefilterten Hardware-Ratgeber.
   - **DWC Experienced:** Geht direkt aufs Dashboard oder zu einer kurzen Setup-Checkliste.

4. **Inhalte anpassen (Texte):**
   - `.arb` Dateien um die neuen Fragestellungen und Erklärungen ergänzen.

## Open Questions für den Nutzer
- Sollen wir für den Anfang erst einmal nur den Flow so verzweigen, dass wir je nach Level unterschiedliche Info-Screens (Deep Dive vs. Transition Guide) vorschalten, bevor es in den (ggf. gekürzten) Hardware-Ratgeber geht?
- Oder sollen die restlichen Steps (Zelt, Wasser) auch komplett umgeschrieben werden für die Level?
