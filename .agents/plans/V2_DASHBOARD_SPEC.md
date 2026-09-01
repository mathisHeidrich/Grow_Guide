# Grow Guide V2: Spezifikation für das Minimalistische Dashboard
Version: 2.0.0-PRO
Erstellungsdatum: 05. August 2026

> [!NOTE]
> **Status:** Implementiert. Alle UI-Texte sind über `AppLocalizations` (i18n) ausgelagert. Hardcodierte Strings sind nicht erlaubt.

Ziel: Exakte Funktions-, Design- und Wortsinn-Spezifikation für die Hauptübersichtsseite des Züchters.

---

## 1. DIE PHILOSOPHIE DES DASHBOARDS

Das Dashboard dient als ruhige, aufgeräumte Leitzentrale für deine aktiven Hydroponik-Pflanzen.
- **Grundsatz (Die Ruhe-Regel):** Keinerlei unruhige Zahlenberge oder verunsicherndes Info-Chaos auf der Startseite. Die genauen Messwerte (pH, EC, Wasser-ml) sind im Hintergrund geschützt und werden erst beim Klick auf einen Check-In sichtbar.
- **Kein "Offline aktiv"-Banner:** Die Offline-Fähigkeit ist ein stilles Grundgerüst; kein überflüssiges Textschild lenkt die Aufmerksamkeit ab.
- **Kopfleiste (Header):**
  - Links: `Meine DWC Pflanzen`
  - Rechts: Ausschließlich das markante Symbol **`+`** zum Anlegen eines neuen Eimers (siehe [V2_ADD_PLANT_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_ADD_PLANT_SPEC.md)).

---

## 2. AUFBAU EINER PFLANZEN-KARTE (Card Architecture)

Jede aktive Pflanze oder Eimereinheit im Zelt erhält eine eigene, elegant voneinander getrennte Kachel in einer untereinander rollenden Liste:

### Zeile 1: Titel, Eimervolumen & Drei-Punkte-Menü
- *Wortlaut-Beispiel links:* `Canna Kush • 20 L Eimer`
- *Rechts oben am Kartenrand:* Das schlanke Drei-Punkte-Symbol (**`⋮`**), über das ein Schnellzugriff für `Pflanze bearbeiten` und `Fieberkurve ansehen` aufklappt (siehe [V2_EDIT_PLANT_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_EDIT_PLANT_SPEC.md)).

### Zeile 2: Phase & gewählte Dünger-Linie
- *Wortlaut-Beispiel:* `Blütephase (Woche 3 von 9) • General Hydroponics`

### Zeile 3: Zeiterfassung der letzten Messung
- *Wortlaut-Beispiel:* `Letzter Check: vor 3 Tagen` (oder `Letzter Check: heute` / `Letzter Check: vor 5 Stunden`)

### Zeile 4: Der dynamische Farb-Aktionsbutton
Der Button erstreckt sich groß, deutlich und hervorragend drückbar über die volle Breite des unteren Kartenrands. Keinerlei Emojis oder Klammern in der Tastenbeschriftung – purer, aussagekräftiger Text mit dynamischer Hintergrund-Farbgebung:

- 🟢 **`Check ok`** (Farbe: Sattgrün / `AppColors.growGreen`)  
  - *Bedingung:* Die letzte Messung liegt **weniger als 2 Tage (< 48 Stunden)** zurück und der letzte Messwert befand sich optimal im DWC-Toleranzband von pH 5.5 bis 6.3.
- 🟡 **`Check empfohlen`** (Farbe: Gelb-Amber Warnsignal / `AppColors.warningAmber`)  
  - *Bedingung:* Die letzte Messung liegt zwischen **2 bis 3 Tagen (48 bis 96 Stunden)** zurück. Eine routinemäßige Nachkontrolle des Reservoirs wird jetzt geraten.
- 🔴 **`Check dringend nötig`** (Farbe: Alarmrot / `AppColors.errorRed`)  
  - *Bedingung:* Die letzte Messung ist **4 oder mehr Tage ($\ge$ 96 Stunden)** alt **ODER** die allerletzte Messung der Pflanze hat das pH-Toleranzband (5.5 bis 6.3) signifikant verlassen (z. B. pH bei 7.1). In diesem Fall springt die Karte sofort in den roten Warnzustand, selbst wenn die letzte Messung erst wenige Stunden her ist!

---

## 3. DAS KLICK-VERHALTEN

Tippt der Nutzer direkt auf die Pflanzenkarte oder auf den farbigen Check-Button (egal ob Grün, Gelb oder Rot), wird er nahtlos in den **All-in-One Check-In Wizard** (siehe [V2_ALL_IN_ONE_CHECKIN_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_ALL_IN_ONE_CHECKIN_SPEC.md)) für exakt diese Pflanze geschaltet.

---

## 4. DER ZUGANG ZUM ERNTE-ARCHIV (Am Fußende der Liste)

Im Einklang mit unserer unantastbaren Ruhe-Regel wird der Startbildschirm im Zeltverlauf von keinerlei überflüssigem Navigationslärm oder dauerhaften Archiv-Reitern oben in der Kopfleiste dominiert. 
- **Der Stamm-Platz am Boden:** Unterhalb der allerletzten aktiven Pflanzenkarte (am Ende der untereinander rollenden Liste) ruht eine elegante, schlichte Kachel mit dem klaren Praxis-Wortlaut: **`Ernte-Archiv (3 Grows)`** *(Zahl passt sich dynamisch an deinen Bestand an)*. Ein Klick darauf schaltet sofort rüber in deine Offline-Ehrenhalle für Trocknung, Curing und Fieberkurven-Historie (siehe [V2_HARVEST_DRYING_AND_ARCHIVE_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_HARVEST_DRYING_AND_ARCHIVE_SPEC.md)).
- **Intelligente Unsichtbarkeit beim ersten Grow (0 Grows):** Verfügt ein Neuankömmling im System noch über keinerlei eingeholte Ernten, wird diese Schaltfläche **komplett ausgeblendet**. Das Dashboard bleibt für Einsteiger von der ersten Sekunde an 100 % aufgeräumt und zielgenau!
- **Leeres Zelt zwischen zwei Grow-Runden:** Befindet sich aktuell keine einzige aktive Pflanze im Hydroponik-System im Betrieb, leuchtet der Schalter **`Ernte-Archiv ansehen (3 erfolgreiche Grows)`** sauber zentriert am Bildschirmboden direkt unter dem Symbol zur Neuanlage.
