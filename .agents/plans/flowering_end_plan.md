# Plan: Ende der Blüte, Spülung & Ernte-Check

Dieser Plan beschreibt die Erweiterung des täglichen/wöchentlichen Check-Ins für die Endphase der Blüte (ab ca. Woche 7). 

## 1. Logik-Änderungen (`lib/screens/checkin_screen.dart`)
- **Bedingung für "Ernte-Check" (`_showHarvestCheck`)**: Wenn `plant.currentPhase == PlantPhase.flower` und `plant.getDayInPhase(now) >= 42` (ab Tag 42 / Woche 7).
- Hinzufügen der Slides zum `_buildCheckinSlides()` Ablauf, falls `_showHarvestCheck == true`.

## 2. Neue Screens / Slides im Check-in

### Slide 1: Blüten-Reife Check
- **Station / Screen:** Ernte-Check: Trichome & Stigmen
- **Haupttext:** Prüfe die Blüten. Die feinen Härchen (Stigmen) sollten sich zu 70-90% braun verfärbt haben. Die kleinen Harzdrüsen (Trichome) sollten milchig-trüb bis leicht bernsteinfarben sein.
- **Tipp:** Nutze eine Lupe oder ein Taschenmikroskop, um die Trichome zu prüfen.
- **Deep Dive (Warum?):** Trichome produzieren die Wirkstoffe. Klare Trichome sind unreif. Milchige bedeuten maximalen THC-Gehalt. Bernsteinfarbene sorgen für eine beruhigendere, körperliche Wirkung.
- **Bild-Beschreibung:** Nahaufnahme einer Cannabis-Blüte mit Fokus auf milchigen/bernsteinfarbenen Trichomen und braunen Härchen.
- **Interaktion:** Buttons "Noch nicht bereit" (geht zum Flush) / "Bereit für die Ernte" (Startet den Ernte/Trocknen-Prozess).

### Slide 2: Spülung (Flushing) Erklärung
- **Station / Screen:** Beginn der Spülung (Flushing)
- **Haupttext:** Wir nähern uns der Ernte! Jetzt senken wir den EC-Wert schrittweise. Die Pflanze bekommt weniger Nährstoffe und nutzt ihre eigenen Reserven.
- **Tipp:** Passe beim nächsten Wasserwechsel deinen Nährstoffplan an und nutze nur noch sehr wenig oder gar keinen Dünger (reines pH-angepasstes Wasser).
- **Deep Dive (Warum?):** Durch das "Spülen" zwingen wir die Pflanze, im Gewebe gespeicherte Nährstoffe zu verbrauchen. Das verbessert später den Geschmack, Geruch und das Abbrennverhalten der Blüten deutlich. Kratziger Rauch wird vermieden.
- **Bild-Beschreibung:** Eine Gießkanne oder Nährstofflösung, die in klares Wasser übergeht, oder eine symbolische Darstellung eines sinkenden EC-Werts.

### Slide 3: Pflanzen-Check (Herbst-Effekt)
- **Station / Screen:** Pflanzengesundheit (Herbsteln)
- **Haupttext:** Wie sieht deine Pflanze insgesamt aus? Keine Sorge: Gelbe Blätter am Ende der Blüte sind jetzt völlig normal.
- **Tipp:** Entferne alte, komplett vertrocknete Blätter, aber lass Blätter dran, die nur leicht gelb sind. Die Pflanze zieht gerade noch Energie aus ihnen.
- **Deep Dive (Warum?):** Weil wir den EC-Wert senken und die Pflanze an ihr Lebensende kommt, baut sie Chlorophyll ab. Das führt zu wunderschönen Herbstfarben (Gelb-, Rot- und Lilatöne). Dies ist ein Zeichen, dass das Spülen funktioniert.
- **Bild-Beschreibung:** Eine Cannabispflanze in der späten Blüte mit gelben und violetten (herbstlichen) Blättern.
- **Interaktion:** Button "Sieht gut aus" / "Ich sehe echte Probleme".

## 3. i18n (.arb Dateien)
- Alle Texte werden in `lib/l10n/app_de.arb` eingepflegt. Keine hartcodierten Strings.
