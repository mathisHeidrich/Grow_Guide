# Grow Guide V2: Spezifikation für App-Einstellungen & Einheiten (`SettingsScreen`)
Version: 2.0.0-PRO
Erstellungsdatum: 05. August 2026

> [!WARNING]
> **Status:** Noch nicht implementiert im Code.

Ziel: Exakte Definition des Einstellungsmenüs für Maßeinheiten, Themes und Offline-Garantien.

---

## 1. DIE PHILOSOPHIE DER EINSTELLUNGEN

Das Einstellungs-Menü ist aus der Kopfzeile des Dashboards erreichbar (über ein schlichtes Zahnrad- oder Menü-Icon oben links).
- **Das Ziel:** Jeder Züchter soll in seiner gewohnten Einheiten-Welt arbeiten können, ohne bei jedem Check mühsam umrechnen zu müssen.
- **Offline-Garantie & Gastmodus:** Die App erfordert grundsätzlich **keine Registrierung, kein Login und keine Cloud-Verbindung**. Alle Einstellungen und Protokolle bleiben physisch direkt auf dem Gerät des Nutzers gehostet.

---

## 2. OPTIONEN & SCHNELL-SELECTIONEN

### 1. Push-Benachrichtigungen (Der aktive Assistent)
- *Beschriftung:* `Erinnerungen (Check-In, Keimung, Burping)`
- *Auswahl-Chips:*
  - **`Aktiviert`** *(Standard)*
  - **`Deaktiviert`**
- *Zusatzfeld (Nur wenn aktiviert):* Ein Uhrzeit-Wähler (z. B. `19:00 Uhr`), zu der die täglichen Push-Benachrichtigungen für zeitkritische Aktionen wie den Warteraum der Keimung oder das Curing-Burping gesendet werden.

### 2. Nährstoff- und Messwerte (Leitfähigkeit)
- *Beschriftung:* `Einheit für Wasserleitfähigkeit`
- *Auswahl-Chips:*
  - **`EC (mS/cm)`** *(Standard - Europäischer DWC Standard)*
  - **`PPM (TDS 500 Scala)`**
  - **`PPM (TDS 700 / 0.7 Scala)`**

### 2. Wasservolumen & Füllmenge
- *Beschriftung:* `Volumen-Einheit für Eimer und Nachgießen`
- *Auswahl-Chips:*
  - **`Liter (L)`** *(Standard)*
  - **`US Gallonen (Gal)`**

### 3. Reservoir- und Wassertemperatur
- *Beschriftung:* `Temperatur-Einheit für deinen Wurzel-Check`
- *Auswahl-Chips:*
  - **`Celsius (°C)`** *(Standard - z. B. Warnsignal ab 22°C)*
  - **`Fahrenheit (°F)`** *(z. B. Warnsignal ab 71.6°F)*

### 4. Erntegewicht & Trocknungsmaß
- *Beschriftung:* `Gewichtseinheit für Ertrag und Ernte-Archiv`
- *Auswahl-Chips:*
  - **`Gramm (g)`** *(Standard - EU/Global)*
  - **`Unzen (oz)`** *(US-System / Ounces für nordamerikanische Anwender)*

### 5. Erscheinungsbild (Theme)
- *Beschriftung:* `Design & Farbschema im Zelt`
- *Auswahl-Chips:*
  - **`System-Standard`**
  - **`Dark Mode (Zelt-freundlich)`** *(Schont das Auge bei hellem LED-Pflanzenlicht)*
  - **`Light Mode`**

---

## 3. AUSWIRKUNG DER EINSTELLUNGEN AUF DIE RECHNER
Sobald eine Einheit (z. B. von Liter auf Gallonen oder EC auf PPM) umgestellt wird, konvertieren sämtliche Thermomix-Rechner und Dashboard-Anzeigen die Eingabefelder und Misch-Anweisungen automatisch, ohne dass Datenbankwerte verloren gehen oder verfälscht werden.
