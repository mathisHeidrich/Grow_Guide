# Grow Guide V2: Spezifikation für den Schalter "Problemdiagnose"
Version: 2.0.0-PRO
Erstellungsdatum: 05. August 2026

> [!WARNING]
> **Status:** Noch nicht implementiert im Code.

Ziel: Exakte Funktions-, Design- und Wortsinn-Spezifikation für die Fehlersuch- und Diagnostik-Zentrale der App.

---

## 1. DIE PHILOSOPHIE DER PROBLEM-DIAGNOSE

Die Problemdiagnose dient als schnelle, beruhigende Rettungsinsel am DWC-Zelt.
- **Sprachlicher Grundsatz (Die Einfachheits-Regel):** Keinerlei akademische Fremdwörter oder unverständlicher Labor-Jargon (kein "Ätiologie", "Chlorose" etc.), aber ebenso keinerlei Umgangssprache, Emojis oder Floskeln. Wir nutzen klares, leicht verständliches und direktes Praxis-Deutsch.
- **Direkte Erreichbarkeit:** Kann von nahezu jeder Station des Check-In Wizards über den linken Button (`Problemdiagnose`), aus der Abfangschleife des Nachmess-Loops oder vom Dashboard aus aufgerufen werden. Ein Klick auf den Zurück-Pfeil (oben links) führt nahtlos zur Ausgangsstation zurück.

---

## 2. KOPFZEILE & SUCH-NAVIGATION

### Kopfleiste
- **Titel:** `Problemdiagnose`
- **Navigation:** Zurück-Pfeil oben links, um den Diagnose-Modus jederzeit geräuschlos zu verlassen.

### Schnellsuch- & Filterblock (Direkt unter der Kopfleiste)
- **Suchleiste (Eingabefeld):** `Problem oder Symptom suchen (z. B. braune Wurzeln, pH)...`
- **Horizontale Kategorie-Filterchips:**  
  **`Alle`** | **`Wurzeln & Wasser`** | **`Nährstoffe & pH`** | **`Blätter & Klima`** | **`Kalibrierung`**  
  *(Beim Klick auf eine Kategorie filtert die Darstellungsliste in Echtzeit nur die betreffenden Befunde aus).*

---

## 3. AUFBAU EINER PROBLEM-KACHEL

Die Diagnoseübersicht ist ein scrollbares Akkordion aus untereinander angeordneten Bildkacheln.

### 3.1 Eingeklappter Zustand (Listenansicht)
- **Linke Seite:** Ein klares, hochauflösendes Referenzbild des Schadbildes, damit das Züchterauge das Problem im Zelt in Sekundenschnelle identifizieren kann.
- **Rechte Seite:**
  - **Befund-Titel:** z. B. `Wurzelfäule` oder `CalMag-Mangel (Kalzium & Magnesium)`
  - **Kurze Leitsymptom-Zeile:** z. B. `Braun verfärbte Wurzeln, muffiger Geruch im Eimer.`
- **Rechter Außenrand:** Ein Pfeil-Symbol (`▼`) signalisiert die Aufklappbarkeit.

### 3.2 Aufgeklappte Ansicht (Das Behandlungsrezept)
Wird eine Karte angeklickt, öffnet sich im Inneren eine leicht verständliche Dreiteilung in klarem Deutsch:

#### 1. Symptome
*Was du mit blozem Auge am Zelt oder im Eimer siehst.*
- *Beispiel:* *„Die Wurzeln verfärben sich braun und schleimig. Das Wasser im Reservoir riecht muffig.“*

#### 2. Ursache
*Warum passiert das in deiner Hydro-Anlage?*
- *Beispiel:* *„Die Wassertemperatur im Eimer liegt über 22°C oder die Luftpumpe sprudelt zu schwach. Dadurch fehlt den Wurzeln Sauerstoff und Fäulnis-Bakterien breiten sich aus.“*

#### 3. Lösung
*Schritt-für-Schritt Anleitung, wie du dein Pflanzgut jetzt rettest.*
- *Beispiel:*  
  1. *Wassertemperatur auf kühle 18–20°C senken (z. B. durch Eisflaschen oder stärkere Abluft).*  
  2. *Eimer komplett leeren, gründlich ausspülen und desinfizieren.*  
  3. *Frische Nährlösung einfüllen und prüfen, dass der Ausströmerstein kräftig sprudelt.*

---

## 4. DER SYSTEM-AKTIONSBUTTON IM FUß DER KARTE
Jede aufgeklappte Diagnosekarte besitzt ganz unten einen markanten, farbigen Absprung-Button. Dieser verknüpft das angelesene Wissen direkt mit den interaktiven Rechnerstationen der App:

- **Bei Wasser- & Nährstoffproblemen (Wurzelfäule, Algen, starker pH-Lockout, Überdüngung):**  
  👉 Button-Wortlaut: **`Direkt 100% Wassertausch einleiten`**  
  *(Schaltet den Züchter direkt auf Station 6 unseres Check-In Wizards)*.
- **Bei Elektroden-Abweichungen (Falsche Messdaten, sprunghafte Werte):**  
  👉 Button-Wortlaut: **`Messelektroden jetzt kalibrieren`**  
  *(Schaltet direkt auf Station 7 der Messelektroden-Eichung)*.
- **Bei rein manuellen Eingriffen im Zelt (Lichtabstand justieren, Ventilator drehen, Eisflasche einlegen):**  
  👉 Button-Wortlaut: **`Verstanden (Zurück zum Check-In)`**  
  *(Klappt die Kachel wieder zusammen und kehrt exakt davor zurück, wo sich der Nutzer beim Absprung befand)*.
