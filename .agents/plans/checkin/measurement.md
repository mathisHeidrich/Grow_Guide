---

> [!NOTE]
> **Status:** Implementiert. Alle UI-Texte sind über `AppLocalizations` (i18n) ausgelagert. Hardcodierte Strings sind nicht erlaubt.

type: CheckinStation
order: 9
---

### Messung & Wasserbedarf (Eigene, getrennte Seite 1)
- *Ziel:* Reine Datenerfassung ohne kognitive Überlastung durch Dünge-Anweisungen auf derselben Seite.
- **Wasserauswahl-Chips:** **`0 L`** | **`1 L`** | **`2 L`** | **`3 L`** | **`4 L`** | **`5 L`** | **`10 L`** (plus schnelles Freitextfeld).
- **Zwei Zahlenfelder für Messwerte:** `Aktueller pH-Wert` und `Aktueller EC-Wert (mS/cm)`.
- **🚫 GESETZ ZU MESSWERTEN (Keine Vorbelegung!):** Bei den Messungen dürfen **keine** Werte vorher eingetragen sein! Die Felder starten absolut leer (`""`) mit dezenten Platzhaltern (z. B. `"z. B. 5.8"` und `"z. B. 1.3"`), damit der Nutzer rein das eintippt, was auf dem Display seines Geräts erscheint.
- **Smarte Analyse (Trinken vs. Essen):** Das System vergleicht die neuen Werte sofort mit dem Vortag! Steigt der EC und sinkt das Wasser, trinkt die Pflanze (Lösung zu stark) $\rightarrow$ Der Rechner dosiert den Dünger für das Top-Off-Wasser automatisch stark runter oder auf Null. Sinkt der EC, isst die Pflanze $\rightarrow$ Der Rechner dosiert nach!
- *Button unten rechts:* **`Weiter zur Zubereitung ➔`** $\rightarrow$ Schließt die Messung ab und wechselt zur Zubereitungs-Seite.
