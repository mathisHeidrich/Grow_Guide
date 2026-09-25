# Plan: Einheitliche Tipp-Boxen in der gesamten App

## Problembeschreibung
Aktuell sind "TIPP:" oder "Pro-Tipp:" Texte oft direkt in den Beschreibungen (z.B. `tentDesc1`) integriert, aber auf einigen Seiten (wie dem Zelt-Aufbau) gibt es *zusätzlich* noch einen separaten `tentTip1` Parameter, der in einer Box dargestellt wird. Das führt zu doppelten Tipps und uneinheitlichem Design (manche Tipps sind einfache Texte, andere in Boxen).

## Ziel
Alle "Tipp:" und "Pro-Tipp:" Texte in der gesamten App sollen einheitlich in einer hervorgehobenen Box dargestellt werden (ähnlich der Box, die es bereits im Zelt-Aufbau gibt). Doppelte Texte sollen entfernt oder zusammengeführt werden.

## Proposed Changes

### 1. `lib/widgets/markdown_tip_text.dart` [NEW]
Erstellung eines neuen, universellen Widgets `TipFormattedText`.
- **Funktion:** Dieses Widget nimmt einen beliebigen String (z.B. eine Beschreibung aus den `.arb` Dateien) entgegen.
- **Logik:** Es sucht im Text nach Zeilenumbrüchen gefolgt von "TIPP:", "Tipp:" oder "Pro-Tipp:".
- **Darstellung:** Der normale Text wird als normaler `Text` dargestellt. Der gefundene Tipp wird abgetrennt und in einer schönen, einheitlichen Box (mit grünem Rand und evtl. Icon) darunter angezeigt.

### 2. `lib/screens/tent_setup_screen.dart` [MODIFY]
- Entfernung der `tipText` Parameter aus `_buildSlide`, da die Tipps nun automatisch aus dem `text` (z.B. `tentDesc1`) extrahiert und als Box gerendert werden.
- Verwendung des neuen `TipFormattedText` Widgets anstelle des Standard `Text` Widgets für die Beschreibungen.

### 3. `lib/l10n/app_de.arb` [MODIFY]
- **Bereinigung der Zelt-Tipps:** Da die Tipps in `tentDescX` (z.B. `tentDesc1`) und `tentTipX` oft doppelt sind, werden wir die Inhalte zusammenführen und als `\n\nTIPP: ...` am Ende von `tentDescX` belassen.
- **Entfernung:** Die separaten `tentTip1` bis `tentTip10` Keys werden komplett entfernt, da sie durch den intelligenten Text-Renderer überflüssig sind.

### 4. Weitere Screens (z.B. `germination_wizard_screen.dart`, `checkin_screen.dart`, `hardware_ratgeber_screen.dart`) [MODIFY]
- Austausch von `Text(l10n.germinationDesc...)` durch `TipFormattedText(l10n.germinationDesc...)`, damit auch dort die in den Texten verborgenen Tipps automatisch in die neuen Boxen umgewandelt werden.

## User Review Required
> [!IMPORTANT]
> Bitte prüfe, ob die Strategie für dich passt: Wir bündeln die Tipp-Texte in den `.arb` Dateien und rendern diese automatisch überall als schicke Box. Doppelte Tipps beim Zelt-Aufbau werden zusammengelegt.

## Verification Plan
1. App bauen und den "Zelt-Aufbau" Screen prüfen: Keine doppelten Tipps mehr, aber eine saubere Box bei jeder Station.
2. Keimungs-Assistent und andere Guides prüfen: Alle dort vorhandenen "Tipp:" Texte werden nun ebenfalls in Boxen dargestellt.
