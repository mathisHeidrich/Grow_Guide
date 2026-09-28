# Konzept: Contextual Learning ("Drip-Feed" Wissen)

## Grundgedanke
Anstatt den Nutzer im Onboarding mit Theorie zu überladen, nutzen wir das "Learning by Doing"-Prinzip. Wir verteilen das Botanik- und Hydro-Wissen ("Deep Dives") tröpfchenweise über den gesamten Lebenszyklus der Pflanze. Das Wissen wird genau in dem Moment präsentiert, in dem der Nutzer die physische Aktion an der Pflanze ausführt.

Die Intensität und Art der Erklärungen richtet sich nach dem ausgewählten `experienceLevel`:
- **Anfänger:** Bekommen die Theorie als direkten Teil der UI ("Wusstest du schon?"-Karten).
- **Erde-Umsteiger:** Bekommen nur Hydro-spezifische Unterschiede direkt angezeigt, Basis-Botanik bleibt hinter dem Info-Icon.
- **Pro:** Sehen nur saubere UI für schnelle Eingaben, Deep Dives bleiben komplett versteckt oder nur per (i) Icon abrufbar.

---

## Phasen & Pacing-Plan (Wann erklären wir was?)

### 1. Keimung (Germination Wizard)
*Der erste Kontakt. Die Pflanze ist fragil.*
- **Schritt 1 (Wasserglas):** Warum brauchen Samen Dunkelheit und Feuchtigkeit? (Hormonhaushalt).
- **Schritt 2 (Samen öffnet sich):** Was ist die Pfahlwurzel (Taproot) und warum darf man sie nicht berühren?
- **Schritt 3 (Einpflanzen in DWC):** Warum steht der Blähton über dem Wasser? (Sauerstoff vs. Ertrinken).
- **Schritt 4 (Licht):** Warum brauchen Sämlinge nur ganz wenig Licht (PPFD)? (Sie haben noch keine echten Blätter für Photosynthese, zu viel Licht = Stress).

### 2. Vegetative Phase (Wachstum)
*Die ersten Tage im System. Hier finden die ersten Check-ins statt.*
- **Check-in Tag 1 (pH-Wert):** Erkläre das Konzept des pH-Werts. (Warum schwankt er? Warum können Nährstoffe nur bei pH 5.5 - 6.5 aufgenommen werden?).
- **Check-in Tag 3 (EC-Wert):** Erkläre den EC-Wert. (Was sind gelöste Salze? Wie zeigt die Pflanze, ob sie mehr trinkt oder mehr isst?).
- **Check-in Tag 7 (Wassertemperatur & Wurzeln):** Warum ist die Wassertemperatur (max 22°C) so wichtig? (Sauerstoffsättigung, Vorbeugung von Wurzelfäule).
- **Check-in Tag 14 (Klima & VPD):** Zusammenspiel von Temperatur und RLF im Zelt. Warum schwitzt die Pflanze?

### 3. Blütephase (Flower)
*Der Wechsel des Lichtzyklus und die Blütenbildung.*
- **Umstellung auf 12/12:** Warum blüht Cannabis erst, wenn die Nächte länger werden? (Photoperiodismus).
- **Blüte Woche 2 (Stretch):** Warum wächst die Pflanze plötzlich extrem in die Höhe?

- **Blüte Woche 7 (Herbst & Flush):** Warum werden die Blätter jetzt gelb? Warum geben wir am Ende nur noch Wasser? (Spülen für besseren Geschmack).

### 4. Ernte, Trocknung & Curing (Wizards)
- **Ernte-Wizard:** Was sagen uns die Trichome? (Klar = unreif, milchig = Peak THC, bernstein = beruhigend). Warum Dry-Trim (mit Blättern) kopfüber im Zelt trocknen?
- **Finish-Wizard:** Was passiert beim Curing im Glas? (Terpene schützen, Heugeschmack vermeiden).

---

## Technische Umsetzung (UI)
1. **Der "Wusstest du schon?"-Block (DidYouKnowCard):**
   - Wir bauen ein neues, wiederverwendbares Widget (`DidYouKnowCard`).
   - Wenn `userExperienceLevel == beginner`, wird diese Karte prominent in den jeweiligen Flow (z.B. zwischen die Eingabefelder im Check-in) eingebaut.
   - Sie ist NICHT einklappbar, sondern steht fest im UI, damit sie gelesen wird, wenn sie das erste Mal an diesem Tag / in dieser Phase gezeigt wird.
2. **Flagging im Backend:**
   - Wir können im `LogEntry` oder `Plant` Modell speichern, welche "Lektionen" der Nutzer schon gesehen hat (z.B. `hasSeenPhLesson = true`), damit wir ihn an Tag 10 nicht nochmal mit der pH-Erklärung nerven.
   - Alternativ verknüpfen wir die Lektionen strikt an die Tage im aktuellen Stadium (`if currentDayInPhase == 1 -> show PhLesson`).
