# Plan: Ernte- & Trocknungs-Tutorial (Harvest & Drying Wizard)

Dieser Plan beschreibt den neuen Wizard, der gestartet wird, wenn der Nutzer im Check-in auf "Bereit für die Ernte" klickt. Der Wizard führt Schritt für Schritt durch das Abschneiden, Trimmen und die optimale Trocknung.

## 1. Logik- & Navigations-Änderungen
- **Trigger:** Klick auf "Bereit für die Ernte" im `checkin_screen.dart` schließt den Check-in ab und öffnet den neuen `harvest_wizard_screen.dart`.
- **Abschluss des Wizards:** Ändert die Phase der Pflanze in der Datenbank auf `PlantPhase.drying`.

## 2. Screens im Harvest Wizard (Schritt-für-Schritt)

### Slide 1: Vorbereitung & Werkzeug
- **Station / Screen:** Die Erntevorbereitung
- **Haupttext:** Es ist soweit! Bevor wir die Pflanze fällen, bereite deinen Arbeitsplatz vor. Du brauchst eine scharfe, saubere Ernteschere, Einweghandschuhe und Reinigungsalkohol.
- **Tipp:** Das Harz der Blüten klebt extrem. Trage unbedingt Handschuhe und reinige die Schere zwischendurch mit Alkohol, wenn sie verklebt ist.
- **Deep Dive (Warum?):** Sauberkeit ist bei der Ernte das Wichtigste. Eine unsaubere Schere kann Schmutz oder Pilzsporen in die frischen Schnittstellen tragen. Das Harz (Trichome) enthält die gesamten Wirkstoffe – Handschuhe verhindern, dass du danach tagelang klebrige Hände hast.
- **Bild-Beschreibung:** Eine saubere, spitze Ernteschere (Pruning shears) neben einer Flasche Isopropanol und schwarzen Einweghandschuhen.

### Slide 2: Das Abschneiden
- **Station / Screen:** Die Pflanze fällen
- **Haupttext:** Schneide die Pflanze am Hauptstamm knapp über dem Netztopf (oder Grodan-Block) ab. Hänge sie danach als Ganzes kopfüber auf. Ist sie zu groß, kannst du sie auch Ast für Ast abschneiden und einzeln aufhängen.
- **Tipp:** Nutze Kleiderbügel, Gartendraht oder ein Trockennetz, um die Äste in deinem Grow-Zelt aufzuhängen.
- **Deep Dive (Warum?):** Durch das Kopfüber-Aufhängen trocknen die Pflanzen gleichmäßiger. Das Zelt ist der perfekte Ort dafür, da der Aktivkohlefilter den starken Geruch neutralisiert.
- **Bild-Beschreibung:** Eine Cannabis-Pflanze (oder ein großer Ast), die mit einer Schnur oder an einem Bügel kopfüber im Zelt hängt.

### Slide 3: Trimmen (Wet vs. Dry Trim)
- **Station / Screen:** Die Blätter entfernen (Trimmen)
- **Haupttext:** Entferne jetzt alle großen Sonnensegel (Blätter ohne Harz/Zucker). 
  Die kleinen harzigen Blätter an den Blüten (Zuckerblätter) kannst du entweder jetzt abschneiden (Wet Trim) oder erst nach dem Trocknen (Dry Trim). Wir empfehlen Anfängern den **Dry Trim**, da die Blüten so langsamer trocknen.
- **Tipp:** Hebe die harzigen Zuckerblätter auf! Du kannst daraus später Tee, Butter oder Extrakte herstellen.
- **Deep Dive (Warum?):** 
  - *Wet Trim:* Geht anfangs leichter. Gut, wenn deine Luftfeuchtigkeit sehr hoch ist, um Schimmel zu vermeiden.
  - *Dry Trim:* Die Blätter legen sich wie ein Schutzmantel um die Blüte. Das verlangsamt die Trocknung, was Geschmack (Terpene) schützt und ein kratziges Raucherlebnis verhindert.
- **Bild-Beschreibung:** Eine Hand mit Schere, die ein großes Fächerblatt von einer frisch geernteten Blüte abschneidet.

### Slide 4: Die perfekte Trocknungsumgebung
- **Station / Screen:** Die Trocknung (Drying)
- **Haupttext:** Deine Ernte hängt. Jetzt kommt die wichtigste Phase für den Geschmack.
  - **Temperatur:** Optimal sind 18-20°C.
  - **Luftfeuchtigkeit (RLF):** Optimal sind 55-60%.
  - **Licht:** Absolute Dunkelheit.
  - **Umluft:** Abluft an, aber richte keinen Ventilator direkt auf die Blüten.
- **Tipp:** Die Trocknung dauert in der Regel 7 bis 14 Tage. Die Blüten sind fertig getrocknet, wenn die kleinen Äste beim Biegen mit einem hörbaren "Knack" brechen, anstatt sich nur zu biegen (Snap-Test).
- **Deep Dive (Warum?):** Zu schnelles Trocknen (durch Hitze oder direkten Wind) zerstört die feinen Aromen (Terpene) und schließt Chlorophyll in der Blüte ein – das Resultat schmeckt nach Heu und kratzt im Hals. Licht zersetzt zudem das THC. Geduld ist hier der Schlüssel zu Top-Qualität.
- **Bild-Beschreibung:** Ein dunkles Zelt von innen, in dem Blüten kopfüber hängen. Ein Thermo-Hygrometer zeigt ca. 20°C und 55% RLF.

## 3. Nach der Trocknung (Das "Fertig"-Event)
Wenn die Trocknung läuft, gibt es keinen täglichen Check-in mehr. Auf dem Dashboard gibt es stattdessen einen Button: **"Trocknung abgeschlossen (Snap-Test bestanden)"**. Klickt der Nutzer darauf, startet der letzte Wizard:

### Slide 5: Der finale Dry Trim
- **Haupttext:** Die Äste knacken, die Blüten sind trocken! Jetzt machen wir den "Dry Trim". Schneide nun alle verbliebenen, kleinen Zuckerblätter nah an der Blüte ab.
- **Tipp:** Halte die Blüte am Stiel fest, um die Harzdrüsen nicht zu zerdrücken. 
- **Bild-Beschreibung:** Eine Detailaufnahme einer Schere, die trockene, harzige Blättchen von einer kompakten Blüte trimmt.

### Slide 6: Wiegen & Abschluss
- **Haupttext:** Deine Ernte ist fertig getrimmt! Wiege jetzt deine Ausbeute und trage sie ein, um diesen Grow erfolgreich abzuschließen.
- **Interaktion:** Ein Eingabefeld für das finale Gewicht in Gramm.

## 4. i18n (.arb Dateien)
- Die Texte werden nach Freigabe des Plans in `lib/l10n/app_de.arb` hinzugefügt.
