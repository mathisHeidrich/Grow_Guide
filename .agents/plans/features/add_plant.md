# Grow Guide V2: Spezifikation für den Schalter `+` (Pflanze hinzufügen)
Version: 2.0.0-PRO
Erstellungsdatum: 05. August 2026

> [!NOTE]
> **Status:** Implementiert. Alle UI-Texte sind über `AppLocalizations` (i18n) ausgelagert. Hardcodierte Strings sind nicht erlaubt.

Ziel: Exakte Definition des Onboarding- und Einrichtungs-Screens beim Anlegen neuer Hydroponik-Pflanzen im Zelt.

---

## 1. DIE PHILOSOPHIE DES EINRICHTUNGS-SCREENS

Tippt der Nutzer im Dashboard oben rechts auf das schlanke Symbol **`+`**, öffnet sich diese aufgeräumte Einrichtungs-Webseite.  
- **Das Ziel:** Wir erfassen hier präzise alle Umgebungsfaktoren der Hydroponik, des Lichts und der Genetik, damit der Check-In Wizard später exakte ml-Dosierungen und cm-Abstände liefern kann – ganz ohne nervige Zwischenfragen!
- **Architektur (Strikes 1-to-1):** Jede Pflanze repräsentiert exakt einen isolierten DWC-Eimer mit eigenem Lebenszyklus (kein Shared-Reservoir / RDWC). Das isoliert Probleme und macht die Diagnose anfängerfreundlich.
- **Verbot von Custom-Düngern:** Wir beschränken uns auf 3-4 fest integrierte Top-Marken. Das garantiert 100% perfekte Thermomix-Rezepte ohne Fehlerpotenzial durch manuelle Nutzer-Eingaben.
- **Verbot von Schiebereglern (Slider-Free Guarantee):** Für alle Eingaben werden direkt wählbare Tastenchips und präzise numerische Tippfelder geboten.

---

## 2. DIE ABFRAGE-STATIONEN BEIM ANLEGEN

### 1. Pflanzenname / Eimerbezeichnung
- *Beschriftung:* `Name deiner Pflanze oder des Eimers`
- *Beispiel:* *„Canna Kush (Zelt links)“* oder *„Bucket #1“*

### 2. Reservoirvolumen (in Litern)
- *Beschriftung:* `Wie viel Liter Wasser fasst dein Eimer im Betrieb?`
- *Schnelltasten-Chips (ohne Schieberegler!):*  
  **`10 L`** | **`15 L`** | **`20 L`** | **`25 L`** | **`30 L`**  
  *(Plus ein Freitext-Tippfeld für individuelle Sondergrößen wie `18.5 L`)*

### 3. Wahl der Düngermarke (Offizieller Stammkatalog)
- *Beschriftung:* `Welche Nährstofflinie nutzt du für diese Pflanze?`
- *Auswahl-Kacheln:*
  - **Canna Aqua** (A & B Hydro-Linie)
  - **General Hydroponics** (Flora Trio / Lucas Formel)
  - **Advanced Nutrients** (pH Perfect Serie)
  - **Plagron** (100% Hydro A & B)

### 4. Pflanzen-Genetik (Photo vs. Auto)
- *Beschriftung:* `Um welchen Pflanzentyp handelt es sich?`
- *Auswahl-Chips:*
  - **`Photo` (Photoperiodisch)** $\rightarrow$ Schaltet später im Check-In den 3-Punkte Zelt-Stretch Leitfaden und den exklusiven 12/12 h Zeitschaltuhr-Screen frei.
  - **`Auto` (Autoflowering)** $\rightarrow$ Schaltet ab Woche 3 die ergonomische Blütefäden-Abfrage frei (`Ja, Blüte beginnt` links | `Noch nicht` als dein Standardklick rechts).

### 5. Beleuchtungs- & Lampen-Daten (Für den intelligenten Abstands-Rechner in Station 4)
- *Beschriftung:* `Deine Beleuchtungs-Daten (für exakte Abstandsempfehlungen)`
- **5a. Lampentyp:** Tasten-Chips für **`LED`** | **`NDL` (Natriumdampflampe)** | **`CMH / Ceramic`**
- **5b. Wattzahl der Lampe:** Schnelltasten für **`100W`** | **`150W`** | **`200W`** | **`300W`** | **`400W+`** **sowie zwingend ein präzises numerisches Tippfeld** (z. B. für exakte Werte wie `240` oder `320`).
- **5c. Anzahl der Pflanzen unter dieser Lampe:** Taster **`1`** | **`2`** | **`3`** | **`4+`** **sowie zwingend ein exaktes Ziffernfeld** (z. B. für `6` oder `8` Pflanzen) $\rightarrow$ Teilt die Watt-Leistung und Breiten-Ausbreitung im System für jeden Eimer sauber auf!

### 6. Aktueller Start-Stand & exakter Tag der Pflanze
- *Beschriftung:* `In welcher Phase & an welchem Tag befindet sich die Pflanze heute?`
- **6a. Wachstumsphase:** Auswahl-Chips: **`Keimling / Steckling`** | **`Vegetation (Woche 1)`** | **`Vegetation (Woche 2)`** | **`Blütephase (Start)`**
- **6b. Aktueller Tag in dieser Phase:** Zwingendes, exaktes numerisches Eingabefeld (z. B. `Tag 1`, `Tag 14`, `Tag 21`), um das Pflanzenalter ab dem Start punktgenau mit der App-Uhr zu synchronisieren.

---

## 3. DER ABSCHLUSS-BUTTON DES FORMS
Ganz unten am Ende des Einrichtungsformulars sitzt der markante Bestätigungsknopf:
- **Button-Wortlaut:** **`Pflanze im Dashboard anlegen`**
- **Das Verhalten:** Nach dem Klick wird die neue Pflanze angelegt und du wirst sofort zurück aufs Dashboard geleitet – deine frische Kachel glänzt ab Minute eins im satten Grün von 🟢 **`Check ok`**!

