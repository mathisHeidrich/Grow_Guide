# Grow Guide V2: Spezifikation für die Pflanzenverwaltung (Bearbeiten & Löschen)
Version: 2.0.0-PRO
Erstellungsdatum: 05. August 2026

> [!WARNING]
> **Status:** Noch nicht implementiert im Code.

Ziel: Exakte Definition des Bearbeitungs-Screens, der Zugangswege am Dashboard sowie des gesicherten Löschvorgangs von Hydroponik-Pflanzen nach unseren unantastbaren UI- & Design-Gesetzen.

---

## 1. DIE ZUGANGS-PFORTE: DAS DREI-PUNKTE-MENÜ AM DASHBOARD

Um die Dashboard-Karten im Alltag frei von überladener Unruhe oder gefährlichen Klick-Fallen zu halten (siehe [V2_DASHBOARD_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_DASHBOARD_SPEC.md)), erfolgt der Zugriff auf Verwaltungsfunktionen über ein kompaktes Drei-Punkte-Symbol (**`⋮`**), das elegant in der oberen rechten Ecke einer jeden Pflanzenkarte sitzt.

Tippt der Züchter auf dieses Symbol, klappt ein schlankes Menü mit exakt zwei durchdachten Optionen auf:
1. ✏️ **`Pflanze bearbeiten`** $\rightarrow$ Schaltet nahtlos in den Bearbeitungs-Screen.
2. 📈 **`Fieberkurve ansehen`** $\rightarrow$ Springt direkt zur interaktiven Graphen-Ansicht der pH- und EC-Verläufe (identisch zu Station 10 im Wizard, siehe [V2_ALL_IN_ONE_CHECKIN_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_ALL_IN_ONE_CHECKIN_SPEC.md)), damit der Züchter die Entwicklung auch zwischen den Pflegeintervallen in Ruhe studieren kann, **ohne** dafür einen fiktiven Check-In starten zu müssen.

---

## 2. DIE PHILOSOPHIE DES BEARBEITUNGS-SCREENS

Der Bearbeitungs-Screen fungiert als visueller Zwillingsbruder unseres Einrichtungs-Web-Forms aus der Neuanlage (siehe [V2_ADD_PLANT_SPEC.md](file:///Users/mathis/development/Grow_Guide/docs/V2_ADD_PLANT_SPEC.md)).
- **Vorausgefühlter Komfort:** Beim Öffnen sind sämtliche Daten der Pflanze (Name, Literzahl des Reservoirs, gewählte Düngermarke, Genetik, Beleuchtungsart, aktuelle Wachstumsphase und exakter Tag) präzise an ihrer aktuellen Stelle vorab eingetragen.
- **Präzise numerische Ziffernfelder:** Für eine punktgenaue Justierung im Zelt stehen exakte Eingabefelder für die **Wattzahl**, die **Anzahl der Pflanzen unter der Lampe** sowie den **aktuellen Tag im Stadium** bereit (z. B. Korrektur von Tag 10 auf Tag 14 oder Anpassung auf exakt 240 Watt).
- **Schnelle Praxis-Anpassungen:** Wechselt die Pflanze vom 15 L Aufzucht-Eimer in ein 25 L System oder wird eine neue Hochleistungs-LED im Zelt installiert, reicht ein direkter Klick oder die Zifferneingabe, um die Formeln für den Abstandsrechner und den Thermomix-Rechner ab sofort neu zu justieren.
- **Verbot von Schiebereglern (Slider-Free Guarantee):** Es kommen ausnahmslos direkt wählbare Preset-Chips und klare numerische Tippfelder zum Einsatz. Keinerlei Schieberegler, Emojis oder Klammer-Angebote in den Tasten.


---

## 3. ERGONOMISCHE ABSCHLUSS- & AKTIONSTASTEN IM FUßBEREICH

Am unteren Ende des Bearbeitungs-Forms sitzt eine ergonomisch strikt getrennte Leiste aus zwei Aktions-Knöpfen.
- **RECHTS (Primärer Standard-Klick im Alltag):** **`Änderungen speichern`**
  - *Das Verhalten:* Übernimmt alle veränderten Reservoir-, Beleuchtungs- oder Pflanzendaten sofort für künftige Berechnungen und leitet den Nutzer glänzend lesbar zurück aufs Dashboard.
- **LINKS (Die Ausnahmen- & Notfalltaste):** **`Pflanze löschen`** (Farblich abgehoben im deutlichen Alarmrot / `AppColors.errorRed`).
  - *Das Verhalten:* Zwingend von der rechten Daumenzone weggerückt, um Fehleingaben am Bildschirm konsequent auszuschließen. Ein Klick löscht die Pflanze NIE sofort, sondern schaltet vorerst einen Sicherheits-Dialog vor.

---

## 4. DER SICHERHEITS-DIALOG VOR DEM LÖSCHEN (Safety First)

Da unsere App zu 100 % lokal und offline auf dem Gerät des Nutzers operiert (ohne zwingendes Cloud-Backup oder Konto), ist die Löschung einer aktiven Pflanze unumkehrbar. Ein Abrutsch im Zelt oder mit feuchten Fingern auf dem Touchscreen darf niemals zu Datenverlust führen.

Wird auf den Knopf `Pflanze löschen` (Links im Bearbeitungs-Screen) getippt, öffnet sich ein unmissverständlicher Bestätigungs-Dialog am Bildschirm:

### Wortlaut der Abfrage (Bodenständiges Praxis-Deutsch)
> *„Möchtest du [Pflanzenname] wirklich aus dem Zelt entfernen? Alle aufgezeichneten Messwert-Verläufe, Rezepturen und Tagebuchdaten dieser Pflanze werden unwiderruflich von deinem Gerät gelöscht.“*

### Ergonomische Anordnung im Sicherheits-Dialog
Um dem hektischen Dauertest mit einem schnellen Daumendruck das volle Sicherheitspolster zu bieten, ist die Standard-Abbruchtaste auf der rechten Komfort-Seite gesichert:
- **RECHTS (Standard-Klick zur Rettung):** **`Abbrechen`** $\rightarrow$ Schließt den Dialog sofort; die Pflanze bleibt geschützt erhalten.
- **LINKS (Die finale Ausnahmeentscheidung):** **`Ja, unwiderruflich löschen`** $\rightarrow$ Löscht den Eimer endgültig aus dem Speicher und leitet zurück zur aufgeräumten Pflanzenliste auf dem Dashboard.
