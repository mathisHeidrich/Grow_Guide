# Plan: Mascot & Gamification (Buddy)

## 1. Goal
Die App soll durch spielerische Elemente ("Gamification") und ein eigenes Maskottchen namens "Buddy" aufgelockert werden, ohne unnötige Funktionen wie Level oder Streaks einzuführen. Der Fokus liegt auf befriedigendem Feedback nach abgeschlossenen Aufgaben.

## 2. Character Design ("Buddy")
*   **Grundform:** Ein Cannabis-Blatt.
*   **Kleidung:** Rote Sneaker und weiße Cartoon-Handschuhe (Mickey Mouse / Cuphead Style).
*   **Artstyle:** Modern Flat Vector. Keine dicken schwarzen Outlines. Die grüne Hauptfarbe des Maskottchens entspricht dem App-Theme (`#00E676`), um sich perfekt in den Dark Mode (`#121212`) einzufügen.
*   **Dynamik:**
    *   Der Joint ist *kein* permanentes Accessoire, sondern kommt nur bei extrem entspannten Momenten (Belohnungen) zum Einsatz.
    *   Buddy hat eine breite Palette an Gesichtsausdrücken (wach, erschrocken, entspannt, stolz) und ist nicht auf das "Stoner-Lächeln" limitiert.

## 3. Geplante Animationen & Screens

### A. Dashboard Empty State (`dashboard_screen.dart`)
*   **Auslöser:** Keine Pflanze vorhanden.
*   **Animation:** Buddy hält einen einzelnen, großen Hanfsamen in einer Hand und zeigt mit der anderen Hand erwartungsvoll darauf (kein Text, international verständlich).

### B. Ende vom Check-in (`checkin_screen.dart`)
*   **Auslöser:** Nutzer speichert den Check-in erfolgreich ab.
*   **Animation:** Buddy nimmt einen tiefen Zug von seinem Joint, schließt genießend die Augen und atmet eine große Rauchwolke aus. (Optional: Die Rauchwolke füllt den Screen für einen weichen Übergang).

### C. Nach dem Wasserwechsel (`water_change_screen.dart`)
*   **Auslöser:** Wasserwechsel erfolgreich protokolliert.
*   **Animation:** Buddy wischt sich kurz mit dem Handrücken über die Stirn (Arbeit erledigt!) und nimmt einen großen, erfrischenden Schluck aus einem Glas klarem Wasser.

### D. Große Meilensteine (Wizards)
1.  **Keimung (`germination_wizard_screen.dart`):** Buddy hält stolz einen winzigen Keimling hoch (König der Löwen Vibe).
2.  **Zelt-Setup (`tent_setup_screen.dart`):** Trägt einen Bauarbeiterhelm, klopft sich den Staub von den Händen und knipst lässig ein Grow-Licht an.
3.  **Ernte (`harvest_wizard_screen.dart`):** Steht triumphierend mit einer riesigen Cartoon-Schere bereit, mit leichten Freudentränen in den Augen.

## 4. Technische Umsetzung (Flutter)
1.  **Package:** Nutzung des `lottie` Packages. Lottie-Dateien (.json) sind extrem klein, vektor-basiert und laufen flüssig mit 60fps.
2.  **Assets:** Anlage eines Ordners `assets/animations/` für die JSON-Dateien.
3.  **Widget:** Erstellung eines wiederverwendbaren `BuddyAnimationWidget`, das den Dateinamen der Animation als Parameter annimmt und nach Ablauf (z.B. nach 3 Sekunden) einen Callback ausführt (um z.B. das Overlay zu schließen).
4.  **Integration:** Einbau des Widgets in die jeweiligen Screens (als Hero-Overlay, Dialog oder inline State-Widget).

## 5. Freigabe
Bitte prüfe diesen Plan und gib Bescheid, ob wir ihn so annehmen können.
