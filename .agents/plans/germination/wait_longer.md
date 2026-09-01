---

> [!NOTE]
> **Status:** Implementiert. Alle UI-Texte sind über `AppLocalizations` (i18n) ausgelagert. Hardcodierte Strings sind nicht erlaubt.

type: GerminationStation
order: 5
---
### Geduld! (Schleife Tag 2)
*(Wird angezeigt, wenn der Nutzer bei Station 4 zum ersten Mal auf "Noch geschlossen" klickt).*
- *Bild:* Eine Schildkröte oder ein entspanntes "Warten"-Symbol.
- *Text:* *„Kein Grund zur Sorge! Manche Samen haben eine dickere Schale und brauchen bis zu 48 Stunden. Stelle das Glas wieder in den Schrank und wir schauen morgen nochmal rein.“*
- *Buttons:*  
  - Rechts: **`Wieder in den Schrank (Bis morgen)`** $\rightarrow$ *Schließt den Wizard. Status bleibt auf "Keimung prüfen" für den nächsten Tag.*
