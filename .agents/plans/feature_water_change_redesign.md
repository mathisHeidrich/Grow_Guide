# Water Change Screen Redesign

Das Ziel dieses Plans ist es, den Wasserwechsel-Screen (`WaterChangeScreen`) gemäß dem Feedback zu überarbeiten, ihn verständlicher zu machen und Platz für Bilder zu schaffen, ohne dass der Screen scrollbar werden muss.

## Proposed Changes

### 1. Texte und Überschriften (app_de.arb)
Die Erklärungen für die Methoden werden überarbeitet, sodass klar wird, dass es zwei verschiedene Optionen sind. Der Hinweis auf "pH-reguliertes Wasser mit Dünger" wird entfernt, da das erst später im Prozess passiert.

#### [MODIFY] `lib/l10n/app_de.arb`
- **`waterChangeMethod1Title`**: "Option 1: Tauchpumpe"
- **`waterChangeMethod1Desc`**: "• Pumpe das alte Wasser vollständig ab.\n• Fülle danach frisches Leitungswasser ein.\n\nWICHTIG: Gib jetzt noch keinen Dünger hinzu und passe den pH-Wert noch nicht an. Das erledigen wir im nächsten Schritt."
- **`waterChangeMethod2Title`**: "Option 2: Zweiter Eimer"
- **`waterChangeMethod2Desc`**: "• Bereite einen zweiten, sauberen Eimer mit frischem Leitungswasser vor.\n• Hebe den Deckel mitsamt Pflanze hoch und setze ihn auf den zweiten Eimer.\n\nAuch hier gilt: Noch kein Dünger, keine pH-Anpassung."

### 2. UI-Redesign (water_change_screen.dart)
Das Layout wird angepasst, um die Lesbarkeit zu verbessern und den vertikalen Platz optimal zu nutzen, ohne dass eine Scrollbar nötig wird.

#### [MODIFY] `lib/screens/water_change_screen.dart`
- **Zurück-Knopf**: Ein expliziter `leading: BackButton(onPressed: () => context.pop())` wird in der `AppBar` hinzugefügt, damit Nutzer immer zurückkehren können.
- **Interaktive Auswahl (Akkordeon / Tabs)**: Die beiden Methoden werden initial kompakt als klickbare Elemente angezeigt. 
- **Zustandsverwaltung**: Es gibt einen State `int? selectedMethod` (oder standardmäßig auf 1 gesetzt). Klickt der Nutzer auf eine Methode, klappt diese auf und zeigt alle Informationen sowie den Bild-Platzhalter. Die jeweils andere Methode wird minimiert oder ausgeblendet.
- **Bild-Platzhalter**: Im aufgeklappten Zustand der ausgewählten Methode gibt es oben oder direkt neben dem Text einen großzügigen Platzhalter für ein Bild.
- **Erledigt-Button**: Bleibt unten fixiert. Da der Content dynamisch auf- und zuklappt, wird der Platz dazwischen optimal ausgenutzt, ohne dass der Button aus dem Bildschirm geschoben wird.

## Verification Plan
1. App im Simulator starten und den Wasserwechsel-Screen aufrufen.
2. Prüfen, ob der Zurück-Knopf vorhanden ist und funktioniert.
3. Interaktion testen: Durch Klicken der Methoden muss die Info aufklappen, der Platz muss für Bild und Text ausreichen, ohne zu überlappen.
4. Prüfen, ob die Texte korrekt aktualisiert wurden und der Hinweis auf "pH-reguliert" verschwunden ist.
