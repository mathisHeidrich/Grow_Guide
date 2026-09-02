# Plan: Dynamische Tagesberechnung für Pflanzenphasen

## Das Problem
Aktuell speichert die App den Tag einer Phase fest als Zahl (`currentDayInPhase = 1`). Weil es keinen Hintergrund-Prozess gibt, der diese Zahl um Mitternacht um 1 erhöht, bleibt die Pflanze für immer an Tag 1 stehen.

## Die Lösung
Wir müssen uns merken, **wann** eine Phase gestartet wurde, anstatt nur die statische Zahl zu speichern.

### Änderungen am Datenbank-Modell (`Plant`)
- **[NEU]** Feld `DateTime? phaseStartDate`: Speichert den genauen Zeitpunkt, an dem die aktuelle Phase (z.B. Vegi oder Blüte) begonnen hat.
- **[ÄNDERUNG]** Das Feld `currentDayInPhase` ignorieren/löschen wir aus der DB und ersetzen es durch eine Methode, die den Tag live berechnet. Da Isar keine dynamischen Felder out-of-the-box in Abfragen mag (wenn man nicht danach filtert, ist es egal), ignorieren wir das Feld in Isar per `@ignore` oder entfernen es, und machen eine Funktion `int getDayInPhase(DateTime now)`.

```dart
int getDayInPhase(DateTime now) {
  if (phaseStartDate == null) return 1;
  
  // Kalendertage berechnen, nicht nur stricte 24h Stunden.
  // Damit der Tag um Mitternacht umspringt.
  final start = DateTime(phaseStartDate!.year, phaseStartDate!.month, phaseStartDate!.day);
  final current = DateTime(now.year, now.month, now.day);
  
  return current.difference(start).inDays + 1;
}
```

### Wo wird das Datum gesetzt?
1. **Beim Einpflanzen (Germination Wizard):** Wenn der Keimling in den Eimer kommt und auf `Vegi` wechselt, wird `phaseStartDate = now` gesetzt.
2. **Beim manuellen Hinzufügen (`AddPlantScreen`):** Wenn der Nutzer sagt "Meine Pflanze ist in Vegi Tag 14", rechnen wir zurück: `phaseStartDate = now minus 13 Tage`.
3. **Im Dashboard:** Das Dashboard berechnet live `plant.getDayInPhase(ref.watch(timeProvider))` und zeigt so immer den tagesaktuellen Wert an. Auch der Check-in Button nutzt diesen echten Wert.
4. **In Testszenarien:** `TestScenario` nutzt ebenfalls `phaseStartDate`.
