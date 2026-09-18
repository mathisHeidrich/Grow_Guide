# Plan für die Einstellungsseite (Settings Page)

Dieser Plan beschreibt die Implementierung einer neuen Einstellungsseite für die Grow Guide App. Da bereits eine `AppSettingsTable` in der lokalen Drift-Datenbank (`lib/database/tables.dart`) existiert, werden wir diese nutzen, um die neuen Einstellungen abzuspeichern.

## 1. Vorgeschlagene Einstellungen

Welche Einstellungen brauchen wir für unsere DWC-Cannabis-App? Hier ist mein Vorschlag:

### A. Erscheinungsbild (Theme)
- **Modus:** Hell, Dunkel, oder System-Standard. (Die App ist standardmäßig dunkel, aber manche Nutzer bevorzugen eventuell einen hellen Modus oder System-Anpassung).

### B. Sprache (Language)
- **App-Sprache:** Deutsch, Englisch (bzw. System-Standard). Die App ist bereits auf i18n vorbereitet, das Dropdown ermöglicht den manuellen Wechsel.

### C. Einheiten (Units) - *Sehr wichtig für Hydro/DWC*
- **Volumen:** Liter (L) oder Gallonen (Gal) - wichtig für die Nährstoffberechnung.
- **Temperatur:** Celsius (°C) oder Fahrenheit (°F).
- **Leitfähigkeit:** EC (mS/cm) oder PPM (Parts per Million).

### D. Benachrichtigungen (Optional / Zukünftig)
- **Check-in Erinnerung:** Ein/Aus sowie die bevorzugte Uhrzeit für den täglichen DWC-Check-In.

### E. Datenverwaltung (Danger Zone)
- **App zurücksetzen:** Option, um alle Pflanzen und Logs zu löschen und von vorne zu beginnen.

---

## 2. Technische Umsetzung

### Datenbank (Drift)
Erweiterung der bestehenden `AppSettingsTable` in `lib/database/tables.dart`:
```dart
@DataClassName('AppSettings')
class AppSettingsTable extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  BoolColumn get hasCompletedOnboarding => boolean().withDefault(const Constant(false))();
  BoolColumn get hasCompletedTentSetup => boolean().withDefault(const Constant(false))();
  
  // Neue Felder
  TextColumn get theme => text().withDefault(const Constant('system'))(); // 'light', 'dark', 'system'
  TextColumn get language => text().nullable()(); // 'de', 'en', null (für system)
  TextColumn get volumeUnit => text().withDefault(const Constant('l'))(); // 'l', 'gal'
  TextColumn get temperatureUnit => text().withDefault(const Constant('c'))(); // 'c', 'f'
  TextColumn get conductivityUnit => text().withDefault(const Constant('ec'))(); // 'ec', 'ppm'
  
  @override
  Set<Column> get primaryKey => {id};
}
```
*Nach der Änderung führen wir `dart run build_runner build` aus.*

### State Management (Riverpod)
- Erstellung eines `SettingsNotifier` (z.B. in `lib/providers/settings_provider.dart`), der die Einstellungen aus der Datenbank lädt und bei Änderungen aktualisiert.
- Anpassung von `lib/main.dart` / `Theme`, um auf das ausgewählte Theme zu reagieren.
- Anpassung von `lib/main.dart`, um die Locale an den `MaterialApp.router` zu übergeben.

### UI (Screens & Navigation)
- Neuer Screen: `lib/screens/settings_screen.dart`.
- Registrierung in `lib/router.dart` (z.B. Route `/settings`).
- Einbau eines Zugangs (z.B. Zahnrad-Icon in der AppBar auf dem Dashboard).
- Nutzung von `.arb` Dateien, um alle Texte zu lokalisieren.
