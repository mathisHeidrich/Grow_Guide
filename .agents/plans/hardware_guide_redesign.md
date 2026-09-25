# Plan: Hardware-Ratgeber Redesign (Amazon Affiliate Links)

## Ziel
Der aktuelle Hardware-Ratgeber soll so umgebaut werden, dass er über Amazon Affiliate Links monetarisiert werden kann. User sollen einzelne Produkte direkt nachkaufen können oder ein komplettes Setup-Set auf Amazon erwerben können. Zudem soll der Ratgeber auch nach dem Onboarding in der App leicht erreichbar sein.

## 1. Platzierung in der App
- **Aktueller Stand:** Der `HardwareAdvisorScreen` ist bereits Teil des Onboarding-Prozesses (direkt vor der Wasser-Masterclass und dem Zeltaufbau).
- **Neue Platzierung:** Um den Ratgeber jederzeit aufrufen zu können, fügen wir im `DashboardScreen` in der oberen Leiste (AppBar) einen neuen Button hinzu (z.B. ein Warenkorb-Icon `Icons.shopping_cart` oder ein Hardware-Icon `Icons.hardware`).

## 2. Redesign des Hardware-Ratgeber Screens (`hardware_advisor_screen.dart`)
- **Einzelprodukte kaufen:** Auf jeder Seite (im bestehenden `PageView`) des jeweiligen Hardware-Teils wird ein markanter **"Auf Amazon ansehen"**-Button (mit Affiliate Link) hinzugefügt, direkt unter der Beschreibung.
- **Komplettes Set / Einkaufsliste (UPDATE):** Das Komplett-Set wird **direkt als erste Seite** im Ratgeber präsentiert ("Willst du direkt loslegen? Hier ist das komplette Starter-Set..."). Zusätzlich fügen wir einen **dauerhaft sichtbaren Button in die obere AppBar** des Screens ein, über den man jederzeit das Komplett-Set kaufen kann, egal auf welcher Einzelseite man sich gerade befindet. 
- **Optik:** Der Amazon-Button kann z.B. in Amazon-typischem Orange oder Gelb hervorgehoben werden (oder als Outline-Button passend zum Dark Mode), inkl. einem kleinen `Icons.shopping_cart` Icon, um die Kaufintention zu verdeutlichen.

## 3. Neue Felder im Datenmodell
- Das interne Modell `_HardwareItemData` in `hardware_advisor_screen.dart` wird um ein optionales Feld `String? affiliateLink` erweitert.
- Bei allen Items werden die entsprechenden Amazon-Links (mit Affiliate-Tag) eingetragen (zunächst als Platzhalter).

## 4. Lokalisierung (`app_de.arb`)
- Neue Texte für die Buttons hinzufügen, z.B.:
  - `hw_buy_on_amazon`: "Auf Amazon ansehen"
  - `hw_buy_complete_set`: "Komplettes Set kaufen"
  - `hw_complete_set_title`: "Das Starter-Set"
  - `hw_complete_set_desc`: "Spar dir die Mühe und kaufe alle benötigten Teile für deinen DWC-Grow auf einen Schlag."

## Umsetzungsschritte
Nach Freigabe werde ich:
1. Platzhalter-Links einbauen.
2. Den Dashboard-Button ergänzen.
3. Den `HardwareAdvisorScreen` umbauen (Erste Seite für Komplettset + AppBar Icon + Amazon Buttons auf Einzelseiten).
