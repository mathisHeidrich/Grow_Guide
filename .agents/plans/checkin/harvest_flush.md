---

> [!NOTE]
> **Status:** Implementiert. Alle UI-Texte sind über `AppLocalizations` (i18n) ausgelagert. Hardcodierte Strings sind nicht erlaubt.

type: CheckinStation
order: 4
---

### Vorreife-Check & Ernte-Kreislauf (Der 2-Stufen Spül- und Reife-Führer)
Da die Spülphase im DWC unbedingt vor dem Erreichen des finalen Harzkopf-Zustands begonnen werden muss, teilt sich Station 3 je nach aktuellem Pflanzenzustand intelligenterweise in zwei Phasen:

#### Stufe 1: Der Vorreife-Check zur Spülbad-Einleitung (In der regulären Blütephase ab Woche 6 aktiv)
Um am Erntetag reinsten, kratzfreien Geschmack zu garantieren, wird rund 7 Tage vor dem Schnitt jegliche Düngung gestoppt und mit reinem Wasser gespült. Hier wird ausschließlich nach den 2 optischen Praxis-Anhaltspunkten für den Spülstart geforscht (die theoretische, kalenderbasierte Blütedauer zählt bewusst NICHT als Kriterium, da die Natur ihr eigenes Tempo bestimmt):
- *Bild:* Nahaufnahme reifender Blüten: dunkelrot verfärbte Blütefäden und fast vollständig milchig-trübe Harzköpfe.
- *Text (Der Vorreife-Check):*  
  * *„Wir stoppen die Düngerzufuhr vor dem Schnitt für unser Spülbad mit reinem Wasser. Prüfe heute, ob die beiden klaren Praxis-Anhaltspunkte für den Startschuss eingetroffen sind:*  
  * **1. Die Blütefäden:** Sind etwa 60–80 % der vormals weißen Fäden rot-braun gebogen und verblüht, und es schießen kaum noch frische weiße Büschel nach?  
  * **2. Der Milchglas-Blick:** Sind die Harzköpfe unter deinem Taschenmikroskop nicht mehr durchsichtig, sondern fast alle weißlich-trüb (milchig)? (*Achtung: Bernstein soll jetzt noch kaum zu sehen sein!*)  
  * *Wenn beides passt, stoppen wir heute den Dünger!“*
- *Ergonomische Buttons am Boden (Rechts dein Standardklick zur Fortsetzung, Links der strategische Phasenwechsel):*  
  - Links: **`Spülen starten`** $\rightarrow$ Schaltet sofort zum Spül-Screen und verlegt die Pflanze ab sofort fest in den Spülmodus.  
  - Rechts (Dein Alltagsklick): **`Weiter düngen`** $\rightarrow$ Bleibt normal im Dünger-Rechner.

##### Exklusives Folge-Fenster nach Klick auf `Spülen starten`: Der Spül-Screen (Flush)
- *Bild:* Ein Reservoir gefüllt mit kristallklarem, reinem Wasser ohne jegliche Düngerzutaten.
- *Text:* *„Zeit für die Spülphase! In den kommenden Tagen füllen wir dein Reservoir ausschließlich mit reinem, pH-angepasstem Wasser (pH 5.5–6.3) ohne Dünger. Warum? Dadurch verbraucht die Pflanze alle in den Blättern verbliebenen Düngerelementen. Das Ergebnis ist eine saubere, kratzfreie und geschmacklich hervorragende Ernte.“*
- *Button unten rechts:* **`Weiter`** (leitet zum Thermomix-Rechner mit dem 0 ml Dünger-Rezept).

#### Stufe 2: Der Trichom-Check (NUR WÄHREND DER SPÜLPHASE AKTIV)
Sobald die Pflanze im Spülbad im Reservoir verbleibt, ändert Station 4 bei jedem täglichen Check ihr Gesicht, bis der Schnitt fällig wird:
- *Bild:* Mikroskop-Gegenüberstellung von Harzköpfen (Milchig vs. 10–20 % bernsteinfarbene Köpfe).
- *Text:* *„Dein System läuft sauber auf reinem Wasser und die Blüten reifen zu Ende. Prüfe ab sofort täglich mit dem Mikroskop deine Harzköpfe: Hast du den perfekten Reifegrad von **10 bis 20 % bernsteinfarbenen Harzköpfen** (bei 80 % milchigen) erreicht? Sobald ja, ergreife die Ernteschere!“*
- *Ergonomische Buttons am Boden:*  
  - Links: **`Ernten`** $\rightarrow$ Bricht den regulären Wasser-Check ab und katapultiert dich im Triumph direkt in die Trocknungs- und Veredelungs-Phase (siehe [V2_HARVEST_DRYING_AND_ARCHIVE_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_HARVEST_DRYING_AND_ARCHIVE_SPEC.md)).  
  - Rechts (Dein Alltagsklick): **`Weiter spülen`** $\rightarrow$ Schließt diese Station ab und verweist dich in den Thermomix für reines Wasser.
