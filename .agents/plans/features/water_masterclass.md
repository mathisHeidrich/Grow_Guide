# Grow Guide V2: Spezifikation für Wasser-Masterclass (`WaterGuideScreen`)
Version: 2.0.0-PRO
Erstellungsdatum: 01. September 2026

> [!WARNING]
> **Status:** Noch nicht implementiert im Code.

Ziel: Exakte Definition des Wasser-Guides im Onboarding, um dem Nutzer die kritischsten Faktoren im DWC-Anbau (pH, EC, Wasserwerte) verständlich zu erklären.

---

## 1. DIE PHILOSOPHIE DER WASSER-MASTERCLASS

- **Vermeidung von Anfängerfehlern:** Falsches Wasser ist der Grund Nr. 1 für gescheiterte DWC-Grows. Diese Seite fungiert als interaktives Seminar, bevor der Nutzer den Samen keimt.
- **Hands-on Anleitung:** Statt trockener Theorie leitet die Seite den Nutzer an, die Werte seines lokalen Trinkwasserversorgers online abzufragen und diese direkt in der App zu interpretieren.
- **Lineare Platzierung:** Kommt direkt nach dem Hardware-Ratgeber, da das Wissen für den Start fundamental ist.

---

## 2. DAS UI KONZEPT

Die Masterclass ist in drei gut verdauliche Kapitel (z.B. als scrollbare Sektionen oder Cards) unterteilt:

### Kapitel 1: Die Regeln des Wasserwechsels
- **Warum wechseln?** Erklärung, dass Pflanzen Toxine ausscheiden und sich Salze anstauen ("EC-Creep"). Ein wöchentlicher Wechsel stabilisiert den pH-Wert und die Nährstoffaufnahme.
- **Methoden-Visualisierung:** Vorstellung des 2-Eimer-Wechsel-Tricks (für die Vegi) und der Nutzung einer kleinen Tauchpumpe.

### Kapitel 2: Den lokalen Wasserbericht interpretieren (Das Ampelsystem)
Hier soll der Nutzer den "Grund-EC-Wert" (oder die Gesamthärte) seines Leitungswassers nachschlagen. Wir präsentieren ein klares Ampelsystem für den **Start-EC (ohne Dünger)**. 
Tipp: "Suche online nach 'Wasserwerte [Dein Wohnort]', um den Bericht deines Versorgers zu finden, und prüfe den Grund-EC-Wert (ohne Dünger)."

- 🟢 **EC 0.0 - 0.2 (Sehr weich / Osmosewasser):**
  - *Diagnose:* Nahezu salzfrei.
  - *Anweisung:* Du MUSST CalMag (Calcium/Magnesium) hinzufügen, bis der EC ca. 0.4 erreicht, bevor der Hauptdünger beigemischt wird.
- 🟢 **EC 0.2 - 0.4 (Perfektes Wasser):**
  - *Diagnose:* Jackpot! 
  - *Anweisung:* Das ideale Leitungswasser. Kein zusätzliches CalMag nötig.
- 🟡 **EC 0.5 - 0.7 (Hartes Wasser):**
  - *Diagnose:* Das Wasser hat bereits viele Salze (meist Calcium).
  - *Anweisung:* **Kein CalMag nutzen!** Nutze speziellen "Hard-Water"-Dünger und wechsle den Tank strikt wöchentlich.
  - *Pro-Tipp Bittersalz:* Wenn in diesem harten Wasser nur Magnesium fehlt, füge reines **Bittersalz (Epsom Salt, 0,1-0,3 g/L)** hinzu statt CalMag. So gleichst du den Mangel aus, ohne den EC-Wert unnötig zu erhöhen.
- 🔴 **EC > 0.7 (Sehr hart / Salzig):**
  - *Diagnose:* Ungeeignet für DWC, da kaum noch EC-Budget für Dünger übrig bleibt.
  - *Anweisung:* Zwingend aufbereiten!

Zusatz-Warnung: Achte im Wasserbericht auf **Natrium (< 50 mg/L)** und **Chlorid (< 70 mg/L)**, da diese ab den Grenzwerten toxisch wirken.

### Kapitel 3: Wasser aufbereiten (Lösungen)
- **Der "Cut"-Trick:** Die einfachste Lösung für zu hartes Wasser: Mische das Leitungswasser 50/50 mit destilliertem Wasser (aus dem Supermarkt).
- **Die Filter-Wahrheit:** Normale Tischwasserfilter (wie Brita) filtern primär Kalk/Geschmack, senken den EC-Wert aber fast gar nicht. ZeroWater senkt ihn zwar, ist aber bei hartem Wasser extrem schnell verbraucht (teuer!).
- **Die Langzeitlösung:** Eine kleine Umkehrosmose-Anlage (z.B. "RO Buddy") ist oft günstiger als wöchentlich Kanister zu schleppen.
- **Chlor ausgasen:** Der absolute Basis-Tipp: Leitungswasser immer 24-48 Stunden (am besten mit Sprudelstein) in einem Eimer abstehen lassen, bevor man es benutzt, da Chlor die Wurzeln schädigt.

---

## 3. TECHNISCHER UNTERBAU

*   **Darstellung:** Statischer Screen, aufbereitet mit ansprechenden Visualisierungen (Icons, Badges für die EC-Ampel).
*   **Lokalisierung:** Sämtliche Fließtexte und Hinweise werden über `app_de.arb` eingebunden.
*   **Navigation:** Vom `HardwareAdvisorScreen` geht es weiter zum `WaterGuideScreen`, und von dort abschließend zum `TentSetupScreen`.
