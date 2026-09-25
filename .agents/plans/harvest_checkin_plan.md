# Plan: Reihenfolge & Logik im Ernte-Check-in anpassen

## Problem 1: Falsche Reihenfolge & Widersprüche bei Pflanzengesundheit
Aktuell kommt der Ernte-Check (Trichome) ganz am Ende des Check-Ins. Vorher wird bereits der normale Pflanzengesundheits-Check abgefragt. Wenn die Pflanze im späten Blütestadium herbstelt (gelbe Blätter bekommt), ist der normale Gesundheits-Check widersprüchlich zum "Herbsteln"-Check, der später folgt.

## Problem 2: Spülungs-Erklärung (Flush) kommt immer wieder
Wenn man beim Trichom-Check auf "Noch nicht bereit" klickt, kommt eine Erklärung zur Spülung. Diese Info-Slide taucht aktuell bei jedem Check-In wieder auf, bis man endlich erntet.

## Proposed Changes

### 1. `lib/screens/checkin_screen.dart` [MODIFY]
- **Reihenfolge ändern:** Der `_showHarvestCheck` Block (Trichome, Spülung, Herbsteln) wird im `PageView` nach ganz oben geschoben (direkt nach den Phasen-Übergangs-Screens).
- **Logik Pflanzengesundheit:** Die normale Pflanzengesundheits-Abfrage (`checkinHealthTitle`) wird **übersprungen**, sobald der Ernte-Check aktiv ist (`_showHarvestCheck == true`). Dadurch greift ab Woche 6 der Blüte nur noch der speziell darauf angepasste "Herbsteln"-Check.
- **Einmalige Spülungs-Info:** Ich habe das Plugin `shared_preferences` zum Projekt hinzugefügt. Sobald die Spülungs-Erklärungs-Slide einmal gesehen und weggeklickt wurde, wird dies gespeichert (`flush_shown_id = true`). Bei zukünftigen Check-Ins erscheint dieser spezielle Info-Screen dann nicht mehr, sondern nur noch die Trichome-Prüfung und der Herbsteln-Check.

## User Review Required
> [!IMPORTANT]
> Bitte bestätige diesen Plan zur Umstrukturierung des Ernte-Check-ins!
