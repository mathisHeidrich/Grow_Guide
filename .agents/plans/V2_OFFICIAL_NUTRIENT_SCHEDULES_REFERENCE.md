# Grow Guide V2: Offizielle Hersteller-Düngertabellen & Rechner-Referenzen
Version: 2.0.1-PRO
Erstellungsdatum: 05. August 2026

> [!WARNING]
> **Status:** Noch nicht implementiert im Code.

Ziel: Eindeutige, aus den offiziellen Herstellerdatenblatt-Quellen recherchierte Dosierungsformeln (pro 10 Liter Nährlösung) als Rechenbasis für unseren Thermomix-Rechner.

---

## 🚀 DAS KÜCHENDATEN-FORMAT FÜR DIE REZEPTUR-AUSGABE (Station 8b)
Um im feuchten Zelt oder mit Messgläsern in den Händen eine blitzschnelle Lesbarkeit zu garantieren, verbannt der Rechner lange Fließtexte. Jede Anweisung wird nach folgenden Vorgaben aufgebaut:
- **Dosierungs-Badges:** Jede Mengenangabe wird prominent und sofort erfassbar am Anfang des Schrittes platziert (z. B. `[ 15.0 ml ] Canna Aqua Vega A`).
- **Klare Trennung:** Einzelschritte werden als übersichtliche Rezept-Karten gerendert. Kommandos wie *"Gut umrühren!"* oder *"Niemals mischen!"* erhalten durch Fett- und Farbmarkierung den visuellen Vorrang.

---

## 1. CANNA AQUA (Aqua Vega A/B & Aqua Flores A/B)

- **Typ:** 2-Komponenten DWC-/Hydro-Dünger für rezirkulierende Systeme.
- **Wichtigste Hersteller-Regel:** Niemals Konzentrat A und B direkt unverdünnt zusammenschütten! Immer erst Komponente A ins Wasser einrühren, gut durchmischen, danach Komponente B einrühren. Dosierung stets im **Verhältnis 1:1**.
- **Ziel-pH im DWC:** 5.2 – 6.2 (enthält integrierte pH-Stabilisatoren).

### Offizielles Dosierschema (Angaben in ml pro 10 Liter Wasser)
| Wachstumsphase | Produkt | Dosis Komponente A | Dosis Komponente B |
| :--- | :--- | :--- | :--- |
| **Vegetationsphase I** (Woche 1) | Aqua Vega A & B | 22 ml / 10 L | 22 ml / 10 L |
| **Vegetationsphase II** (Woche 2+) | Aqua Vega A & B | 28 ml / 10 L | 28 ml / 10 L |
| **Blütephase I & II** (Früh bis Mitte) | Aqua Flores A & B | 34 ml / 10 L | 34 ml / 10 L |
| **Blütephase III** (Späte Blüte) | Aqua Flores A & B | 25 ml / 10 L | 25 ml / 10 L |
| **Spülphase** (Letzte 5-7 Tage) | Reines Wasser | **0 ml** | **0 ml** |

---

## 2. GENERAL HYDROPONICS (GHE / Terra Aquatica - Flora Series / Trio)
- **Typ:** 3-Komponenten Hydro-Dünger (FloraMicro, FloraGro, FloraBloom).
- **Wichtigste Hersteller-Regel:** **Immer zuerst FloraMicro einrühren** und gut verteilen, bevor FloraGro und FloraBloom zugegeben werden, um Nährstoffblockaden zu verhindern!
- **Ziel-pH im DWC:** 5.5 – 6.3.
- **Berechnungsbasis:** Umgerechnet von offiziellen ml/Gallone Hydroponics Vorgaben auf ml pro 10 Liter Wasser (Faktor ~2.64).

### Offizielles DWC-Rezirkulations-Schema (Angaben in ml pro 10 Liter Wasser)
| Wachstumsphase | Woche im Zyklus | FloraMicro | FloraGro | FloraBloom |
| :--- | :--- | :--- | :--- | :--- |
| **Keimling / Steckling** | Woche 1 | 6.5 ml / 10 L | 6.5 ml / 10 L | 6.5 ml / 10 L |
| **Vegetative Phase** | Woche 2 & 3 | 13.0 ml / 10 L | 13.0 ml / 10 L | 13.0 ml / 10 L |
| **Blüte-Übergang / Stretch**| Blütewoche 1 & 2 | 26.0 ml / 10 L | 26.0 ml / 10 L | 26.0 ml / 10 L |
| **Mittlere Blütephase** | Blütewoche 3 – 7 | 26.0 ml / 10 L | 13.0 ml / 10 L | 39.5 ml / 10 L |
| **Späte Blüte / Ausreifen** | Blütewoche 8 & 9 | 13.0 ml / 10 L | **0.0 ml / 10 L** | 26.0 ml / 10 L |
| **Spülphase (Flush)** | Letzte Woche | **0 ml** | **0 ml** | **0 ml** |

---

## 3. ADVANCED NUTRIENTS (pH Perfect Grow, Micro, Bloom)
- **Typ:** 3-Komponenten System mit patentierter "pH Perfect"-Pufferchemie.
- **Wichtigste Hersteller-Regel:** Stets **erst Micro einrühren**, danach Grow, zuletzt Bloom. Bei Nutzung der Serie puffert der Dünger das Leitungswater automatisch in das Zielband (5.5–6.3) – der Rechner ordnet hier bei Normalbetrieb **keine Zugabe von pH-Minus** an!

### Offizielles Basiskript-Schema (Angaben in ml pro 10 Liter Wasser)
| Wachstumsphase | Woche im Zyklus | pH Perfect Micro | pH Perfect Grow | pH Perfect Bloom |
| :--- | :--- | :--- | :--- | :--- |
| **Vegetative Phase** | Woche 1 | 10 ml / 10 L | 10 ml / 10 L | 10 ml / 10 L |
| **Vegetative Phase** | Woche 2 | 20 ml / 10 L | 20 ml / 10 L | 20 ml / 10 L |
| **Vegetative Phase** | Woche 3 | 30 ml / 10 L | 30 ml / 10 L | 30 ml / 10 L |
| **Vegetation W4+ & Blüte** | Blütewoche 1 bis 8 | 40 ml / 10 L | 40 ml / 10 L | 40 ml / 10 L |
| **Spülphase (Flush)** | Letzte Woche vor Ernte| **0 ml** | **0 ml** | **0 ml** |

---

## 4. PLAGRON (100% Hydro A & B)
- **Typ:** 2-Komponenten Hochleistung-Hydroponiklinie.
- **Wichtigste Hersteller-Regel:** Hydro A und Hydro B werden ausnahmslos im Verhältnis **1:1** verabreicht (maximale Herstellervorgabe: 2,5 ml pro Liter bzw. 25 ml pro 10 L). Zuerst A einrühren, danach B zugeben.
- **Ziel-pH im DWC:** 5.5 – 6.3 (beim Mischen stets den Zielwert unter 2.5 mS/cm halten).

### Offizielles Hydro-Düngerschema (Angaben in ml pro 10 Liter Wasser)
| Wachstumsphase | Woche im Zyklus | Hydro A | Hydro B |
| :--- | :--- | :--- | :--- |
| **Vegetative Phase** | Woche 1 | 15 ml / 10 L | 15 ml / 10 L |
| **Vegetative Phase** | Woche 2+ | 17 ml / 10 L | 17 ml / 10 L |
| **Frühe Blüte** | Blütewoche 1 & 2 | 19 ml / 10 L | 19 ml / 10 L |
| **Mittlere Blüte** | Blütewoche 3 | 22 ml / 10 L | 22 ml / 10 L |
| **Vollblüte / Hochphase**| Blütewoche 4 bis 8 | 25 ml / 10 L | 25 ml / 10 L |
| **Spülphase (Flush)** | Letzte Woche vor Ernte| **0 ml** | **0 ml** |

---

## 5. UMRECHNUNGS-LOGIK FÜR TOP-OFF IM THERMOMIX-RECHNER
Wenn der Züchter in Station 7 des Check-Ins einen **100% Wassertausch** durchführt, wird das obige Verhältnis direkt auf sein volles Eimervolumen hochgerechnet (z. B. 20 L Eimer $\rightarrow$ Werte mal 2).  
Füllt er hingegen lediglich verdunstetes Wasser über die Schnelltasten (z. B. `5 L Top-Off`) nach, errechnet unser System den Nährstoffbedarf dynamisch:
1. **Pflanze isst mehr als sie trinkt (EC-Wert im Eimer sinkt):** Der Nährstoffbedarf wird exakt auf Basis dieser 5 Liter Nachfüllwasser berechnet (Werte mal 0,5).
2. **Pflanze trinkt mehr als sie isst (EC-Wert im Eimer steigt):** Die Lösung im Eimer ist bereits zu scharf. Der Rechner stoppt die Düngerzugabe für das Top-Off-Wasser (Ausgabe: 0 ml Dünger) und lässt den Nutzer mit reinem pH-angepasstem Wasser verdünnen, um eine schleichende Überdüngung (Nährstoff-Lockout / Salzkrusten) sicher zu unterbinden!
