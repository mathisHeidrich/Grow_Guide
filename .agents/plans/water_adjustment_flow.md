# Water & Measurement Screen Flow Update

## Hintergrund & Erkenntnisse (Research)
Basierend auf deinem Feedback und weiteren Recherchen haben wir den Plan für den DWC Check-in verfeinert. 

**1. Beziehung zwischen Wasserverbrauch, EC und Düngung:**
Es ist *sehr gut*, zu wissen, wie viel Wasser die Pflanze getrunken hat. In DWC ist die Kombination aus Wasserverbrauch und EC-Veränderung der wichtigste Indikator dafür, was die Pflanze braucht:
*   **Wasser sinkt + EC steigt:** Die Pflanze trinkt mehr Wasser als sie Nährstoffe isst (oft bei Hitze/niedriger RLF). Es darf **kein** weiterer Dünger rein.
*   **Wasser sinkt + EC sinkt:** Die Pflanze hat großen Hunger. Wir füllen mit voll gedüngtem Wasser nach.
*   **Wasserverbrauch messen:** Im neuen Screen fragen wir: *"Wie viele Liter hast du nachgefüllt, um die optimale Füllhöhe wieder zu erreichen?"* So trackt die App den genauen Wasserverbrauch.

**2. Automatische Wasserwechsel-Empfehlung (Neu)**
Unabhängig von den gemessenen Werten sollte das Wasser alle 7-10 Tage komplett gewechselt werden.
*   **Logik:** Die App prüft beim Start des Check-ins, ob der letzte Wasserwechsel 7 oder mehr Tage her ist.
*   **Neuer Empfehlungs-Screen:** Ist dies der Fall, wird dem User als erstes ein Screen angezeigt: "Dein letzter Wasserwechsel ist 7 Tage her. Möchtest du heute das Wasser wechseln?"
    *   **UI-Design:** Der User sieht zwei auswählbare Optionen (z.B. als auswählbare Boxen/Chips): "Ja, jetzt wechseln" und "Nein, später/nicht heute". Unten gibt es einen zentralen "Weiter"-Knopf.
    *   *Klickt er auf Weiter mit "Jetzt wechseln":* Leitet direkt in den Wasserwechsel-Screen.
    *   *Klickt er auf Weiter mit "Später":* Merkt sich die Entscheidung und geht in den normalen Check-in Ablauf (nur Wasser nachfüllen).

**3. EC zu hoch & Wasserwechsel-Logik (Edge Cases)**
Wenn der gemessene EC-Wert zu hoch ist, greift eine zusätzliche intelligente Logik:
*   **Letzter Wasserwechsel war erst vor Kurzem (< 7 Tage):** Die App empfiehlt einen **Teilwasserwechsel**, um die Lösung zu verdünnen (z.B. "Pumpe 30% des Wassers ab und ersetze es durch klares, ungedüngtes Wasser").
*   **Letzter Wasserwechsel ist schon länger her:** Falls der User die automatische Empfehlung (siehe Punkt 2) übersprungen hat, der EC nun aber *zu hoch* ist, poppt die strikte Empfehlung für einen kompletten **Wasserwechsel** auf.

**4. pH Edge Cases**
*   **pH fällt rapide:** Ein schnell fallender pH-Wert (saures Wasser) ist oft ein frühes Warnsignal für Wurzelfäule (Root Rot). Hinweis: "Achtung: pH fällt schnell. Prüfe die Wurzeln auf braune Stellen."

---

## Neuer Wasserwechsel Screen (Water Change Screen)
Um den Wasserwechsel für den User ansprechend und verständlich zu gestalten, planen wir einen dedizierten Screen, der aus dem Check-in heraus aufgerufen werden kann.

*   **Zwei Methoden zur Auswahl:**
    1.  **Tauchpumpe (Empfohlen):** Anleitung, wie man eine kleine Pumpe nutzt, um das Wasser direkt in einen leeren Eimer zu pumpen. Das ist stressfreier für die Pflanze, da die Wurzeln nicht bewegt werden müssen.
    2.  **Zweiter Eimer (Alternativ):** Anleitung, wie man die Pflanze mitsamt Deckel kurz in einen bereitgestellten zweiten (leeren) Eimer stellt, während man den Haupt-Tank ausleert und säubert.
*   **Ablauf nach dem Wasserwechsel:**
    *   Nachdem der User den Wasserwechsel in der App als "Erledigt" markiert, wird er **zurück zum normalen EC-Mess- und Anpassungs-Screen** geleitet, um die frische Nährlösung korrekt einzustellen.

---

## Neuer, erweiterter Check-in Ablauf (Checkin Screen)

0. **Wasserwechsel Empfehlung (Optional)** (Neu)
   * Nur sichtbar, wenn Wasserwechsel fällig (>= 7 Tage). 
   * UI: Zwei Auswahl-Optionen ("Jetzt" / "Später") und ein "Weiter"-Knopf unten.
1. **Gesundheits-Check** (Blätter gesund?)
2. **Wasserstand**
   * **Frage:** "Wie viel Liter Wasser hast du heute nachgefüllt?" (Eingabe in Liter). *(Wird übersprungen, wenn Wasser komplett gewechselt wurde).*
3. **EC Messen**
   * Eingabe des aktuellen EC-Werts *nach* dem Auffüllen.
4. **EC Logik & Düngeschema**
   * **Berechnung (Normalfall):** Anhand eines Düngeschemas (z.B. TriPart) und der nachgefüllten Wassermenge zeigt die App genaue Mengen an (z.B. "Füge 3ml Grow, 3ml Micro, 2ml Bloom hinzu").
   * **Logik bei zu hohem EC:** 
     * *Vor Kurzem gewechselt ->* Zeige Hinweis zum Teilwasserwechsel.
     * *Länger her ->* Strikter Hinweis zum Wasserwechsel.
5. **pH Messen**
   * Eingabe des aktuellen pH-Werts.
6. **pH Anpassen**
   * Wenn nicht optimal (5.5 - 6.5) -> Anleitung, Tropfen für Tropfen pH Up/Down hinzuzufügen.
7. **Lampen-Höhe & PPFD** 
8. **Abschluss** 

---

## Vorbereitung Düngeschema (Mock/Beispiel)
Wir bereiten die Datenstruktur für genaue Düngeschemen vor. Fürs Erste nutzen wir ein Beispiel-Schema:
*   Wachstumsphase: 1.5 ml/L Grow, 1.5 ml/L Micro, 1.0 ml/L Bloom.
*   Rechnung: Hat der User 2 Liter aufgefüllt, multipliziert die App diese Werte mit 2.

## Nächste Schritte (Implementation)
1.  **Datenmodell anpassen:** `LogEntry` um `waterAdded` (Double) erweitern. Neues Tracking für `lastWaterChange` (Datum).
2.  **Wasserwechsel Screens:** 
    *   `water_change_recommendation_screen.dart` (Abfragebogen am Start mit Auswahlboxen und "Weiter" Button).
    *   `water_change_screen.dart` (Die Anleitung mit den 2 Methoden).
3.  **UI Updates Check-in:** `checkin_screen.dart` mit der neuen Logik ausstatten.
4.  **Düngeschema-Service:** Basis-Service für die ml-Berechnung implementieren.
