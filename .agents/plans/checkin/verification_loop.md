---

> [!NOTE]
> **Status:** Implementiert. Alle UI-Texte sind über `AppLocalizations` (i18n) ausgelagert. Hardcodierte Strings sind nicht erlaubt.

type: CheckinStation
order: 11
---

### Die smarte Nachmessung & Der Verifikations-Loop
- *Text:* *„Rühre einmal kräftig durch und miss nochmal.“*
- *Eingabe:* Zwei kurze Tippfelder für deinen **neuen pH-Wert** und **EC-Wert**.
- *Button unten rechts:* **`Weiter`**
- *Die intelligente Sicherheitsabzweigung (Loop):*
  - 🟢 **Volltreffer:** Werte sitzen sicher im grünen Bereich $\rightarrow$ Weiter zu Station 11!
  - 🟡 **1. Abweichungs-Versuch:** Werte passen noch nicht $\rightarrow$ Loop zurück zu Station 9 (Feine Korrektur-Dosis)!
  - 🔴 **2. Gescheitert hintereinander:** Werte tanzen immer noch aus dem Lot $\rightarrow$ System leitet sofort und automatisch ab zu **`Problemdiagnose`**!
