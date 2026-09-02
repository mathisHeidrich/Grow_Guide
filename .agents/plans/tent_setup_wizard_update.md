# Tent Setup Wizard Update

## Goal Description
Der Zelt-Aufbau Wizard soll überarbeitet werden. Die beiden Knöpfe ("Zelt gemeinsam aufbauen" und "Zelt steht! Zum Dashboard") sollen auf dem Start-Screen getauscht werden, sodass der Aufbau-Button der primäre (grüne) und der Dashboard-Button der sekundäre (dunkle) ist.

Zusätzlich sollen die Aufbau-Schritte basierend auf eigenem Research und der vorhandenen Hardware (aus dem Hardware-Ratgeber) komplett neu gegliedert und formuliert werden. Es soll darauf geachtet werden, dass nicht zu viel Text pro Screen vorhanden ist und nützliche Tipps (vor allem speziell für DWC-Setups) integriert werden.

## User Review Required
Bitte lies dir die neuen Aufbau-Schritte und deren Aufteilung durch und gib mir Feedback, ob dir die neuen Schritte, Tipps und die Reihenfolge so gefallen.

## Proposed Changes

### lib/screens/tent_setup_screen.dart
- **[MODIFY]** Tauschen der Buttons `Zelt gemeinsam aufbauen` und `Zelt steht! Zum Dashboard` im Intro-Slide, inklusive der primären/sekundären Farben.
- **[MODIFY]** Anpassung der `_buildSlide` Aufrufe an die neuen, kleinschrittigeren Stationen. Es werden voraussichtlich mehr Screens sein, um den Text pro Screen kurz zu halten.

### lib/l10n/app_de.arb
- **[MODIFY]** Ersetzen der bisherigen `tentTitleX` und `tentDescX` Texte durch die neu recherchierten Schritte.

**Die neuen Schritte (Entwurf für app_de.arb):**

1. **Das Zelt-Gerüst**
   - *Titel:* Station 1: Das Zelt aufstellen
   - *Text:* Such dir einen ruhigen Ort mit Fenster (für die Abluft). Bau das Metallgerüst auf und zieh die Zelthülle darüber. 
   - *Tipp:* Leg unbedingt die wasserdichte Einlegewanne auf den Zeltboden – bei DWC kann immer mal etwas Wasser tropfen!

2. **Die Abluft (Teil 1)**
   - *Titel:* Station 2: AKF & Ventilator
   - *Text:* Der Aktivkohlefilter (AKF) und der Rohrventilator kommen ganz nach oben ins Zelt. Häng sie mit den mitgelieferten Gurten stabil unter die Decke.
   - *Tipp:* Achte darauf, dass die Verbindung zwischen AKF und Ventilator absolut luftdicht ist (Panzertape hilft!).

3. **Die Abluft (Teil 2)**
   - *Titel:* Station 3: Abluftschlauch
   - *Text:* Führe den Abluftschlauch vom Ventilator durch eine der oberen Öffnungen nach draußen.
   - *Tipp:* Die Abluft sollte idealerweise aus dem Raum (z.B. aus dem Fenster) geleitet werden, um die Luftfeuchtigkeit im Zimmer nicht zu stark zu erhöhen.

4. **Die Beleuchtung**
   - *Titel:* Station 4: Die LED-Sonne
   - *Text:* Häng deine LED-Lampe mittig auf. Nutze dafür stufenlos verstellbare Seilzugratschen (Rope Ratchets), damit du die Höhe später einfach anpassen kannst.
   - *Tipp:* Wenn möglich, montiere das Netzteil (Driver) der Lampe außerhalb des Zeltes, um Hitze im Zelt zu vermeiden.

5. **Umluft**
   - *Titel:* Station 5: Frische Brise
   - *Text:* Befestige deine Umluft-Ventilatoren an den Zeltstangen. Sie sorgen für dicke Stängel und beugen Schimmel vor.
   - *Tipp:* Richte die Ventilatoren nie direkt auf die kleinen Pflanzen (Windbrand-Gefahr!), sondern lass sie leicht darüber oder gegen die Zeltwand pusten.

6. **Herzstück: DWC Eimer**
   - *Titel:* Station 6: DWC-Eimer & Blähton
   - *Text:* Stell deinen DWC-Eimer mittig unter die Lampe. Setz den Netztopf ein.
   - *Tipp:* Wasche deinen Blähton VOR der Benutzung extrem gründlich aus, sonst hast du später roten Schlamm im Eimer, der den pH-Wert ruiniert!

7. **Luftpumpe (WICHTIG)**
   - *Titel:* Station 7: Die Lunge (Luftpumpe)
   - *Text:* Führe den Luftschlauch von unten ins Zelt zum Ausströmerstein im Eimer.
   - *Tipp / Warnung:* Die Luftpumpe MUSS immer außerhalb des Zeltes stehen und am besten höher als der Wasserspiegel! Fällt der Strom aus, kann das Wasser sonst durch den Schlauch in die Pumpe laufen.

8. **Sicherheit & Strom**
   - *Titel:* Station 8: Strom & Kabel
   - *Text:* Verlege alle Kabel sauber nach draußen.
   - *Tipp / Warnung:* Wasser und Strom sind Feinde! Leg NIEMALS Mehrfachsteckdosen auf den Zeltboden. Befestige sie sicher außerhalb oder häng sie weit oben auf.

9. **Steuerung**
   - *Titel:* Station 9: Zeitschaltuhr & Dauerstrom
   - *Text:* Die Lampe kommt an die Zeitschaltuhr. 
   - *Tipp:* Abluft, Umluft und vor allem die Luftpumpe für die Wurzeln laufen IMMER (24/7)! Die Luftpumpe darf niemals ausgeschaltet werden.

10. **System-Check**
    - *Titel:* Station 10: Der finale Test
    - *Text:* Mach das Zelt zu und schalte alles an.
    - *Tipp:* Unterdruck-Check: Ziehen sich die Wände leicht nach innen? Gut! Licht-Check: Mach das Licht im Zimmer aus – dringt irgendwo Licht aus dem Zelt? Klebe es ab!

## Verification Plan
- App lokal starten und in den Zelt-Aufbau-Wizard navigieren.
- Prüfen, ob die Buttons auf dem ersten Screen korrekt getauscht sind (Farben & Aktionen).
- Den kompletten Wizard durchklicken und prüfen, ob die neuen Texte (mit nützlichen Tipps) lesbar und gut aufgeteilt sind.
