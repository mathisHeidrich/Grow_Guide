# Grow Guide V2: Spezifikation für Hardware-Ratgeber (`HardwareAdvisorScreen`)
Version: 2.0.0-PRO
Erstellungsdatum: 01. September 2026

> [!WARNING]
> **Status:** Noch nicht implementiert im Code.

Ziel: Vorstellung des benötigten und optionalen Equipments für Anfänger über ein durchdachtes "Card Swipe" (Carousel) Erlebnis, anstatt einer simplen Checkliste.

---

## 1. DIE PHILOSOPHIE DES HARDWARE-RATGEBERS

- **Keine Checklisten-Wüste:** Wir präsentieren jedes Utensil einzeln. Der Nutzer wischt sich durch die Hardware (ähnlich wie bei Story-Cards oder einem Tinder-Swipe).
- **Fokus auf das "Warum":** Da der Nutzer nicht einfach abhakend durchrast, hat jede Karte genug Platz für ein ansprechendes Bild und eine detaillierte Erklärung, *warum* dieses Teil essenziell oder nützlich ist.
- **Klare Prioritäten:** Es muss auf den ersten Blick (visuell) erkennbar sein, ob eine Karte "Zwingend erforderlich" oder ein "Optionales Upgrade" ist.

---

## 2. DAS UI KONZEPT (SWIPEABLE CARDS)

- **Grundlayout:** Ein Full-Screen `PageView` oder Swipe-Deck. Im Hintergrund ein dezent dunkler Mode (`#121212`).
- **Die einzelne Karte:**
  1.  **Status-Badge (Top Left):** Ein sehr auffälliges Badge.
      - 🔴/🟢 "PFLICHT" (Erforderlich)
      - 🟡/🔵 "UPGRADE" (Optional)
  2.  **Visual (Zentrum):** Ein großes, hochwertiges Icon oder Bild des Utensils.
  3.  **Titel:** Name des Ausrüstungsteils (z.B. "Das pH-Messgerät").
  4.  **Erklärungstext (Wieso & Wozu):** Ein ausführlicherer Text, der den Nutzen im DWC-System präzise erklärt.
  5.  **Pro-Tipp Sektion:** Ein speziell hervorgehobener Bereich (z.B. leicht farblich abgesetzt) für tiefergehendes Wissen (z.B. "Nutze anorganische Säure").
- **Navigation:** Pfeile links/rechts oder intuitives Swipen (Wischen). Am unteren Rand ein Progress-Indikator (Dots), der zeigt, wie viele Items noch kommen.

---

## 3. DIE AUSRÜSTUNGS-KARTEN

Die Reihenfolge der Karten sollte einer logischen Aufbau-Reihenfolge folgen.

### Pflicht-Equipment (Klar als "Zwingend" markiert)
1.  **Grow-Zelt:** "Deine künstliche Biosphäre. Ein lichtdichtes Zelt sorgt für das perfekte Klima und schützt vor Störlicht in der Ruhephase."
2.  **LED-Pflanzenlampe:** "Die Sonne deines Setups. Cannabis liebt extrem viel Licht – ohne starke Lampe gibt es keine fetten Buds."
3.  **Abluft-Ventilator & AKF:** "Die Lunge. Erneuert die Luft, transportiert Hitze ab und der Aktivkohlefilter neutralisiert zu 100% jeden verräterischen Geruch."
4.  **Umluft-Ventilator:** "Der Wind. Sorgt für dicke Stängel durch Bewegung und verhindert Schimmelbildung in den Blüten."
5.  **DWC-Eimer & Netztopf:** "Das Herzstück. Das neue Zuhause deiner Wurzeln, in dem sie permanent baden."
6.  **Luftpumpe & Ausströmerstein:** "Sauerstoff ist Leben! Ohne Blubberblasen ertrinken die Wurzeln in der Nährlösung."
7.  **Blähton & Anzuchtwürfel:** "Dein steriles Medium anstelle von Erde. Gibt der Pflanze Halt über dem Wasser."
8.  **Hydrokultur-Dünger:** "Das Futter. Speziell mineralisiert für den Anbau in Wasser."
9.  **pH-Messgerät & Korrekturmittel (pH-Down):** "Der Türsteher der Nährstoffe. Nur bei einem pH-Wert um 5.8 kann die Pflanze optimal Nahrung aufnehmen. *Tipp: Messtropfen sind genauer als billige Stifte. Nutze zwingend anorganische Säure (Phosphorsäure) für pH-Down.*"
10. **EC/TDS-Messgerät:** "Der Tacho. Zeigt dir exakt an, wie viel Düngesalz im Wasser ist, um Überdüngung zu vermeiden."
11. **Zeitschaltuhr:** "Der Rhythmus. Steuert das Licht automatisch (18h Vegi, 12h Blüte)."

### Optionale Upgrades (Klar als "Optional" markiert)
12. **Zweiter DWC-Eimer:** "Erleichtert den Wasserwechsel enorm durch den schnellen 2-Eimer-Trick in der Wachstumsphase."
13. **Elektrische Mini-Tauchpumpe:** "Pumpt das alte Wasser per Knopfdruck aus dem Eimer. Nie wieder schwere Eimer schleppen!"
14. **Thermo-/Hygrometer:** "Der Klima-Checker. Hilft dir, Temperatur und Feuchtigkeit genau auf den Wohlfühlbereich der Pflanze (VPD) einzustellen."
15. **Durchlaufkühler (Water Chiller):** "Der Luxus. Kühlt die Nährlösung im Sommer auf perfekte 18-20°C und verhindert Wurzelfäule."
16. **Ernteschere & Lupe:** "Für den Feinschliff. Die Lupe brauchst du am Ende, um die Trichome (Harzköpfe) zu prüfen und den Erntezeitpunkt zu bestimmen."

---

## 4. TECHNISCHER UNTERBAU

*   **UI-Komponente:** Umsetzung mittels `PageView.builder` für performantes Swiping der einzelnen Karten.
*   **Keine Checkliste:** Das Drift-Modell `HardwareItem` (Speicherung des "Abgehakt"-Status) entfällt, da es sich rein um ein Info-Erlebnis handelt.
*   **Lokalisierung:** Texte werden via `app_de.arb` eingebunden.
*   **Flow:** Nach der letzten Karte erscheint ein Button "Weiter zur Wasser-Masterclass".
