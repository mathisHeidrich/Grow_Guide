# Grow Guide V2: Spezifikation für Wasser-Check (`WaterSetupScreen`)
Version: 2.2.0-PRO
Erstellungsdatum: 28. September 2026

> [!IMPORTANT]
> **Status:** Plan zur Überarbeitung nach Nutzerfeedback angepasst. Wartet auf finale Freigabe.

Ziel: Umwandlung der bisherigen, textlastigen "Wasser-Masterclass" in ein interaktives Setup (Wasser-Check) während des Onboardings, plus kontextbasierte Tipps für den späteren Verlauf.

---

## 1. DIE NEUE PHILOSOPHIE

- **Personalisierung statt Textwand:** Der Nutzer liest nur noch die Informationen, die für *sein persönliches* Leitungswasser relevant sind.
- **Just-in-Time Learning:** Allgemeine Regeln (wie der wöchentliche Wasserwechsel) werden aus dem Onboarding entfernt und erst dann als Tipp angezeigt, wenn diese Aufgabe in der App ansteht.
- **Flexibilität durch Wizard:** Die App speichert nur essenzielle Werte (den EC-Wert, da dieser für Düngemengen wichtig ist). Zieht der Nutzer um, kann er den gesamten "Wasser-Check"-Wizard in den Einstellungen einfach neu starten.

---

## 2. DAS UI KONZEPT: DER WASSER-CHECK (Wizard)

Der neue `WaterSetupScreen` im Onboarding (zwischen Hardware-Ratgeber und Zelt-Setup) ist interaktiv aufgebaut.

### Schritt 1: Der Start-EC (Grund-EC-Wert)
Frage: *"Wie hart ist dein Leitungswasser (Grund-EC)?"*

Der Nutzer wählt aus Optionen (z.B. Dropdown oder Cards):
1. **0.0 - 0.2 (Sehr weich)** ➔ Feedback: *"Nahezu salzfrei. Du MUSST CalMag (Calcium/Magnesium) hinzufügen, bis der EC ca. 0.4 erreicht, bevor der Dünger beigemischt wird."*
2. **0.2 - 0.4 (Perfektes Wasser)** ➔ Feedback: *"Jackpot! Das ideale Leitungswasser. Kein zusätzliches CalMag nötig."*
3. **0.5 - 0.7 (Hartes Wasser)** ➔ Feedback: *"Kein CalMag nutzen! Nutze 'Hard-Water'-Dünger. Wenn nur Magnesium fehlt, nutze reines Bittersalz (0,1-0,3 g/L)."*
4. **> 0.7 (Sehr hart / Salzig)** ➔ Feedback: *"Ungeeignet für DWC! Zwingend aufbereiten: Mische 50/50 mit destilliertem Wasser (Cut-Trick) oder nutze eine Umkehrosmose-Anlage."*
5. **Weiß ich (noch) nicht** ➔ Feedback: *"Kein Problem! Suche im Internet einfach nach 'Wasserwerte [Deine Stadt]', um den Trinkwasserbericht deines Versorgers zu finden. Dort steht der Grund-EC-Wert (oder die 'elektrische Leitfähigkeit'). Du kannst diesen Schritt später in den Einstellungen nachholen."*

### Schritt 2: Der Chlor-Check (Reine Info-Abfrage)
Frage: *"Ist Chlor in deinem Leitungswasser?"*
Optionen: [Ja] / [Nein] / [Weiß ich nicht]

➔ Wenn **Ja** oder **Weiß ich nicht**:
Feedback: *"Tipp: Wenn Chlor im Wasser ist, lass dein Leitungswasser immer 24 Stunden in einem Eimer abstehen, bevor du es benutzt. **Idealerweise legst du für diese Zeit schon einen Sprudelstein (Luftpumpe) in den Eimer**, das treibt das Chlor viel schneller und zuverlässiger aus dem Wasser. Chlor schädigt sonst die Wurzeln!"*
*(Hinweis: Diese Antwort wird von der App nicht dauerhaft gespeichert, da sie nur eine einmalige Verhaltensregel für den Nutzer ist).*

### Schritt 3: Speicher-Hinweis
Unter dem Button "Weiter" steht der Hinweis:
*"Tipp: Falls du umziehst oder deine Werte später eintragen willst, kannst du diesen Wasser-Check jederzeit in den Einstellungen neu starten."*

---

## 3. EINSTELLUNGEN (Settings)

*   Wir fügen im `SettingsScreen` **keine** komplexen Schieberegler für Wasserwerte hinzu.
*   Stattdessen gibt es dort einfach einen Button: **"Wasser-Check (Wizard) neu starten"**.
*   Dieser Button öffnet den Onboarding-Screen erneut, überschreibt am Ende die gespeicherten Werte und bringt den Nutzer zurück in die Einstellungen. Das ist UX-freundlich und simpel.

---

## 4. VERTEILUNG DES RESTLICHEN WISSENS (Kontext-Tipps)

Die alte "Kapitel 1" Textwand (Die Regeln des Wasserwechsels) verschwindet aus dem Onboarding. 
**Neue Platzierung:**
Wenn der Nutzer seinen **ersten Wasserwechsel** in der App als Task/Aufgabe startet (z.B. im `WaterChangeScreen`), zeigen wir eine Info-Box:
- *Warum wechseln? Pflanzen scheiden Toxine aus und Salze stauen sich an (EC-Creep).*
- *Der 2-Eimer-Wechsel-Trick für die Vegi.*

---

## 5. TECHNISCHER UNTERBAU

*   **Datenhaltung:** Nur der gewählte EC-Wert (`water_ec_level`) wird in einem Riverpod-State (z.B. `UserSettingsProvider`) / SharedPreferences gespeichert. Die Chlor-Abfrage ist "flüchtig".
*   **Routing:** 
    - Umbenennung der Route/Klasse von `WaterGuideScreen` zu `WaterSetupScreen`.
    - `HardwareAdvisorScreen` ➔ `WaterSetupScreen` ➔ `TentSetupScreen`.
*   **Lokalisierung:** Alle neuen Strings fließen in die `app_de.arb` ein. Die alten `waterGuideChap...` Strings können entfernt/ersetzt werden.
