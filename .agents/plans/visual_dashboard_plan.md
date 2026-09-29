# Architektur- & UI-Plan: Visuelles Zelt-Dashboard

## Ziel
Der Dashboard-Screen soll interaktiver, visueller und übersichtlicher werden. Anstelle einer einfachen Liste wird das Dashboard zu einer horizontalen Wisch-Ansicht (PageView), bei der jede Seite ein physisches Zelt repräsentiert. Zelte sollen grafisch dargestellt werden (Lampe oben, Pflanzen unten).

## 1. Zelt erstellen (Dialog)
*   **Bisher:** Klick auf "Zelt hinzufügen" erstellt direkt ein "Neues Zelt" mit Default-Werten.
*   **Neu:** Klick auf den Button öffnet ein Modal/Dialog (`showDialog` oder `showModalBottomSheet`), in dem der Nutzer Folgendes eingeben kann:
    *   Zelt-Name (Textfeld)
    *   Lampen-Typ (Dropdown: LED, NDL, CMH)
    *   Wattzahl (Textfeld / Dropdown)
*   **Aktion:** Erst beim Speichern im Dialog wird das Zelt in der Datenbank angelegt. Ein ähnlicher Dialog wird implementiert, um bestehende Zelte zu bearbeiten (Klick auf das Edit-Icon des Zelts).

## 2. Visuelles Dashboard (PageView)
*   **Struktur:** Der `DashboardScreen` nutzt einen `PageView`, um zwischen den Zelten zu "swipen". Die Indikator-Punkte (Dots) unten zeigen an, wie viele Zelte man hat.
*   **Fall-Back:** Wenn es Pflanzen gibt, die keinem Zelt zugeordnet sind (`tentId == null`), wird am Ende eine extra Seite "Ohne Zelt" generiert.

## 3. Zelt-Darstellung (Das Diagramm)
Jede Zelt-Seite wird visuell wie ein echtes Zelt aufgebaut:
*   **Kopfzeile:** Zelt-Name und Edit-Button.
*   **Oben (Decke):** Eine visuelle Darstellung der Lampe.
    *   Icon einer Lampe (z.B. `Icons.light`)
    *   Text: "300W LED • 18/6"
*   **Mitte/Unten (Boden):** Die Pflanzen, grafisch als Icons arrangiert (z.B. nebeneinander in einer Row oder im Grid).
    *   Jede Pflanze ist eine anklickbare Box / ein Icon (Topf- oder Pflanzen-Symbol).
    *   Darunter steht der Name der Pflanze.
    *   **Benachrichtigungen (Badges):** Wenn eine Pflanze Aufmerksamkeit braucht (z.B. überfällig, Keimung starten), schwebt ein kleines Status-Badge (Rot/Gelb/Grün) über dem Pflanzen-Icon oder es leuchtet auf.
    *   **Klick-Aktion:** Klickt man auf die Pflanze, öffnet sich (wie bisher) der Check-in / die Aktion für diese Pflanze.

## Nächste Schritte nach Freigabe
1.  Entwickeln des "Zelt hinzufügen/bearbeiten" Dialogs.
2.  Umbau des `DashboardScreen` auf einen `PageView`.
3.  Design und Implementierung des `TentVisualizer` Widgets (Lampe oben, Pflanzen unten, Status-Badges).

---
Bitte bestätige diesen Plan (z.B. mit "Plan approved"), bevor ich mit der Programmierung beginne.
