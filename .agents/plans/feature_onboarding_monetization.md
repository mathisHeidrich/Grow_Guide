# Plan: Onboarding Monetization (Hardware Advisor)

## Goal
Integriere Affiliate-Links in den Hardware-Advisor (Onboarding), ohne dass es als störende Werbung empfunden wird. Der Fokus liegt auf "Beratung & Service".

## Konzept & Ideen (UX)
- **Unaufdringliches Design:** Keine grellen orangenen "Kauf mich"-Buttons. Wir nutzen stattdessen das bestehende Dark-Theme der App mit dezenten Akzenten (z.B. Outlined Buttons oder Cards), die als "Experten-Empfehlung" wahrgenommen werden.
- **Transparenz & Trust:** Wir könnten einen sehr kleinen, dezenten Hinweis einbauen, dass Einkäufe über die Links helfen, die App weiterzuentwickeln. Das schafft Vertrauen und die Nutzer unterstützen das Projekt gerne.
- **Wording:** Statt "Kaufen" nutzen wir "Empfehlungen ansehen" oder "Zum Produkt".

## Änderungen im Detail

### 1. Erster Slide: Die Komplett-Sets (All-In-One)
- Der aktuelle erste Slide ("Das Starter-Set") wird überarbeitet. Statt nur eines Links bieten wir hier eine übersichtliche Auswahl an Setups an.
- **Aufbau:**
  - Titel: "Das Starter-Set"
  - Beschreibung: "Spar dir die Recherche und das Vergleichen. Wir haben komplette Setups zusammengestellt, die perfekt für DWC funktionieren."
  - **Optionen (als schicke, klickbare Cards untereinander):**
    - 🥉 **Low Budget** (Die günstigste Art zu starten - ca. 250€)
    - 🥈 **Preis-Leistung** (Der Sweet-Spot für Hobby-Grower - ca. 450€)
    - 🥇 **Premium** (Maximale Erträge & ultra leise - ca. 800€)
- Die Cards verlinken dann auf Amazon.

### 2. Einzelslides: Aufklappbare Kaufempfehlungen
- Für jede Einzel-Hardware (Zelt, Lampe, AKF, etc.) auf den folgenden Slides ersetzen wir den direkten "Auf Amazon ansehen"-Button.
- Stattdessen fügen wir eine `ExpansionTile` oder ein animiertes aufklappbares Widget (Custom Card) ein: **"💡 Worauf beim Kauf achten & Empfehlungen"**
- **Inhalt der Card (ausgeklappt):**
  - **Kurzer Ratgeber-Text:** Z.B. beim Zelt: *"Achte auf mindestens 600D Materialstärke und eine gute reflektierende Mylar-Innenbeschichtung, damit kein Licht entweicht."*
  - **Produkt-Optionen:** Darunter 1-2 dezente Buttons für konkrete Empfehlungen. Z.B.:
    - `Option 1: Zelsius 60x60 (Budget)`
    - `Option 2: Secret Jardin (Premium)`

### 3. Datenstruktur & Lokalisierung
- Anpassung von `_HardwareItemData` in `lib/screens/hardware_advisor_screen.dart`.
  - Entferne `affiliateLink`.
  - Füge hinzu: `buyingGuideText` (String), `List<ProductOption> options`.
- Ergänzung der `.arb` Dateien (`app_de.arb`) um die Ratgeber-Texte und Button-Labels (lokalisiert, keine Hardcoded-Strings).

## Umsetzungsschritte
1. **Neue UI-Komponenten erstellen:** `ExpandableBuyingGuide` (aufklappbar) und `CompleteSetOptionCard` (für den ersten Slide).
2. **Datenstruktur anpassen:** `hardware_advisor_screen.dart` refactoren.
3. **Texte anlegen:** Ratgeber-Texte und Platzhalter-Links für die Hardware-Teile (Zelt, Lampe, AKF, DWC-Eimer) exemplarisch in `.arb` anlegen. Ich kann die Texte mit echtem Grower-Wissen füllen!
4. **Styling & Testing:** Sicherstellen, dass die UI flüssig funktioniert und sich gut ins Design einfügt.

## Offene Fragen an dich
- Sollen wir für die Komplett-Sets (Slide 1) auf *Amazon Wunschzettel/Ideenlisten* verlinken, oder willst du da später eine eigene Landing-Page/Website von dir verlinken, wo die Listen drauf sind?
- Soll ich die Ratgeber-Texte (Worauf man achten muss) und 1-2 Platzhalter-Produkte für die wichtigsten Dinge schon mal ausfüllen (mit meinem KI-Grower-Wissen), oder hast du da schon genaue Texte/Produkte im Kopf?
