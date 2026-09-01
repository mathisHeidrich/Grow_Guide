# Grow Guide V2: Spezifikation für das Externe Labor-Cockpit (Test- & Simulationsmodul)
Version: 2.0.0-PRO
Erstellungsdatum: 05. August 2026

> [!WARNING]
> **Status:** Noch nicht implementiert im Code.

Ziel: Exakte Architektur-, Design- und Funktions-Spezifikation für das externe Test-Cockpit zur schnellen Simulation kompletter Grow-Durchläufe und Zeitpunkte von außen, ohne die originale Nutzer-App zu verändern.

---

## 1. DIE PHILOSOPHIE DES LABOR-COCKPITS (Das Zwei-Fenster-Prinzip)

Um die App wie in einem echten Pflanzenzyklus auf Herz und Nieren durchzuspielen (vom Sämling bis zur Ernte), kommt ein externes Steuer-Werkzeug zum Einsatz – unser sogenanntes **Labor-Cockpit**.
- **Grundsatz (Unberührte Original-App):** Die eigentliche Nutzer-App bleibt zu 100 % im Originalzustand. Es werden keinerlei Test-Schalttafeln, Debug-Knöpfe, störende Banners oder geheime Schieberegler in das User Interface des Züchters verbaut. Die App reagiert so, als ob sie von einem ganz regulären Züchter im Alltag bedient wird.
- **Steuerung von außen (Side-Car-Methode & Live-Watching):** Das Labor-Cockpit läuft als separates, kompaktes Kontrollfenster parallel zur Haupt-App auf dem Bildschirm. Da die App 100 % lokal und offline arbeitet, bedient sich das Cockpit derselben lokalen Offline-Datenbank im Hintergrund. Der **Side-Car File Watcher** im `LocalRepository` überwacht alle 500 ms nicht nur `plants_v1.json`, sondern auch `clock_v1.json` und `settings_v1.json`, sodass Zeitsprünge oder Pflanzenänderungen aus Fenster 2 ohne Neustart sofort in Fenster 1 (Haupt-App) wirksam werden.
- **Sicherheits-Schutz (Debug-Build Only):** Der Zugang zum Labor-Cockpit (das Kolben-Symbol 🧪 am Dashboard) ist zwingend an den `kDebugMode` geknüpft. Es ist also ausschließlich in Entwicklungs- und Test-Builds sichtbar und ereichbar; im öffentlichen Release-Build ist der Knopf unsichtbar und die Route abgelockt.
- **Verzicht auf überflüssige Automatisierungs-Helfer:**
  - **Keine externen Weichen für den Check-In:** Sämtliche Handläufe, Fragen, Ernteentscheidungen, Thermomix-Angaben und Korrektur-Loops im 10-Stationen Wizard testet und bedient der Züchter ganz natürlich von Hand, um das echte Tipp-gefühl und das Wording vor Augen zu haben.
  - **Keine simulierten Sensorausfälle:** Da Werte wie pH, EC und Wasser im Wizard durch den Nutzer von Hand eingetippt werden, werden Alarm- und Notrufloops direkt im natürlichen Check-In getestet.
  - **Kein Einheiten-Spieleräumen:** Der Wechsel zwischen Liter, Gallonen, Celsius und Fahrenheit wird rein in der regulären Einstellungs-Seite der App (siehe [V2_APP_SETTINGS_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_APP_SETTINGS_SPEC.md)) ausgereizt.
- **Einhaltung der unantastbaren UI-Gesetze im Cockpit:**
  - **Verbot von Schiebereglern (Slider-Free Guarantee):** Auch zum Vorspulen von Tagen oder Zeiten gibt es keine unpräzisen Schiebebahnen! Ausschließlich direkt greifbare Klick-Chips (Preset-Tasten) regeln die Zeitreise.
  - **Keine Emojis & keine Klammern in Button-Beschriftungen:** Sauberer, klar und glänzend lesbarer Text auf allen Bedienelementen des Cockpits (z. B. `1 Tag vor`, `30 Tage Idealverlauf laden`).
  - **Ergonomische Anordnung:** Standardmäßige Klick-Aktionen und Preset-Füller liegen GRIFFIG RECHTS. Rücksetz-Befehle oder Ausnahmetaste sitzen LINKS.

---

## 2. MODUL 1: DIE ZEIT-MASCHINE (Kalender-Mischer & Live-Synchronisation)

Um nicht tagelang am Zelt warten zu müssen, bis das Dashboard eine Messung als veraltet bewertet oder ein Wassertausch nötig wird, erlaubt dieses Modul das präzise Vorspulen der internen App-Uhr über den `VirtualClock`-Provider.
- **Punktgenaue Synchronisation:** Jeder Klick auf einen Zeit-Chip berechnet den Offset neu und schreibt ihn sofort in die Datei `clock_v1.json`. Der Side-Car Watcher meldet dies der Haupt-App, welche über `DateTime.now().add(currentOffset)` sämtliche Karten- und Log-Zustände in Echtzeit umschaltet.


### Ziel der Simulation
- Härtetest der dynamischen Aktions-Buttons auf der Dashboard-Kachel (siehe [V2_DASHBOARD_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_DASHBOARD_SPEC.md)):
  - Sattgrün bei unter 48 Stunden Alter.
  - Gelb-Amber als Empfehlung nach 2 bis 3 Tagen.
  - Alarmrot nach 4 oder mehr Tagen seit der letzten Nachforschung.
- Erreichen der 3-Wochen-Frist (21 Tage) für den empfohlenen 100% Wassertausch in Station 6 (siehe [V2_ALL_IN_ONE_CHECKIN_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_ALL_IN_ONE_CHECKIN_SPEC.md)).

### Verfügbare Klick-Chips (Zeitsprünge)
- `1 Tag vor` (Spult exakt 24 Stunden weiter; lässt eine grüne Dashboard-Karte sanft auf Gelb schwenken).
- `4 Tage vor` (Erzwingt sofort den roten Warnzustand, da der letzte Check veraltet ist).
- `21 Tage vor` (Spult um genau 3 Wochen vor und stellt sicher, dass der nächste Klick im Check-in direkt den großen 100% Wassertausch anmahnt).
- `Tag 1 Start` (Rückwurf oder Neustart an Tag 1 im Sämlingsstadium).
- `Tag 35 Mitte Blüte` (Schnelleinsteiger in die arbeitsintensive Blütephase).
- `Tag 65 Erntestadium` (Spult in das Zeitfenster für den Trichomen-Erntecheck und Spül-Screen mit reinem Wasser in Station 3).

---

## 3. MODUL 2: DER PFLANZEN-GENERATOR (Dünger- & Genetik-Schnelllade)

Anstatt für jeden Spezialtest manuell das Menü über das Symbol `+` im Dashboard (siehe [V2_ADD_PLANT_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_ADD_PLANT_SPEC.md)) auszufühlen, feuert dieses Modul komplett vorkonfigurierte Praxis-Pflanzen per Knopfdruck direkt ins lokale Reservoir der App.

### Ziel der Simulation
- Direkte Bereitstellung aller 4 offiziellen Düngermarken, um ihre Sonderregeln und Dosierungen (siehe [V2_OFFICIAL_NUTRIENT_SCHEDULES_REFERENCE.md](file:///Users/mathis/development/Grow_Guide/docs/V2_OFFICIAL_NUTRIENT_SCHEDULES_REFERENCE.md)) im Thermomix-Rechner abzusichern:
  - Pflichtanweisung: "FloraMicro zwingend ZUERST einrühren!" bei General Hydroponics.
  - Ausblenden von pH-Minus bei Advanced Nutrients (pH Perfect).
  - 1:1 Verhältnisse bei Plagron Hydro.
- Gegenüberstellung von Genetik und Lampenart für den smarten Stretch-Leitfaden und Abstandsguide.

### Verfügbare Klick-Chips (Preset-Pflanzen)
- `Canna Aqua Photo einsetzen`
  - *Profil:* 20 Liter Reservoir, Canna Aqua, Photoperiodisch, LED 300 Watt, Vegetationsphase.
- `Flora Trio Photo einsetzen`
  - *Profil:* 15 Liter Reservoir, General Hydroponics Flora Trio, Photoperiodisch, NDL 600 Watt.
- `pH Perfect Auto einsetzen`
  - *Profil:* 10 Liter Reservoir, Advanced Nutrients pH Perfect, Autoflower, LED 150 Watt, Blütephase (prüft sofort den Screen nach Blütefäden).
- `Plagron Hydro einsetzen`
  - *Profil:* 25 Liter Reservoir, Plagron 100% Hydro, LED 250 Watt.

---

## 4. MODUL 3: FIEBERKURVEN-GENERATOR (Langzeit-Historie auf Knopfdruck)

Niemand möchte bei einem Probelauf händisch 60 virtuelle Check-Ins durchtippen, um zu prüfen, ob die interaktive Fieberkurve (Station 10) am Ende eines Langzeit-Grows optisch beeindruckt und fehlerfrei zeichnet.

### Ziel der Simulation
- Sofortige Versorgung einer Pflanzenkarte mit einem monatelangen, realistischen Historien-Verlauf für pH- und EC-Werte.
- Prüfung der visuellen Sauberkeit, des Layouts und des Zoom-Verhaltens der Graphik am Ende des Wizards.

### Verfügbare Klick-Chips (Historien-Presets)
- `30 Tage Idealverlauf laden`
  - Füllt 30 Einträge mit einer musterhaften Kurve: Der pH-Wert schwankt realistisch und sanft im grünen DWC-Band zwischen 5.7 und 6.1, während der EC-Wert von 0.8 im Wachstum stetig bis 1.6 in der Hochblüte hinaufklettert.
- `60 Tage Achterbahn-Verlauf laden`
  - Füllt 60 Tage mit unruhigeren Verläufen (inklusive künstlicher Ausreißer bis pH 5.1 oder abrupten EC-Sprüngen), um die Standhaftigkeit und Darstellungskraft der Fieberkurve unter Maximallast zu verifizieren.

---

## 5. ERGONOMISCHE ANORDNUNG DER COCKPIT-TASTEN

Um sich auch im Labor-Cockpit blind und treffssicher zu bewegen, herrscht klare Ergonomie am Arbeitsplatz:
- **RECHTS (Primärer Fortschritt):** Sämtliche Klick-Chips, die einen Zustand aktivieren oder vorspulen (z. B. `1 Tag vor`, `Canna Aqua Photo einsetzen`, `30 Tage Idealverlauf laden`). Sie liegen dort, wo im Alltag am häufigsten geklickt wird.
- **LINKS (Notrettung & Säuberung):** Hier sitzt der entscheidende Schnitt für das Ende eines Testlaufs:
  - `Labor auf Anfang stellen` (Löscht sofort alle über das Cockpit generierten Testpflanzen, Zeitverschiebungen und Historien aus dem lokalen Speicher, damit der Züchter mit einem sauberen Tisch von vorne beginnen kann).
