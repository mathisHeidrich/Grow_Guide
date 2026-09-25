// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Grow Guide';

  @override
  String get generalUnderstood => 'Verstanden';

  @override
  String get generalOk => 'OK';

  @override
  String get onboardingTitle1 => 'Growen ohne Erde. Ohne Raten.';

  @override
  String get onboardingText1 =>
      'Willkommen bei deinem DWC-Companion. Vergiss Erde, Schädlinge und Gießkannen. Wir züchten in sprudelndem Wasser. Das bedeutet für dich: sauberes Arbeiten, kontrollierbares Wachstum und maximale Erträge.';

  @override
  String get onboardingTitle2 => 'Fünf Minuten am Tag.';

  @override
  String get onboardingText2 =>
      'Du benötigst kein Vorwissen. Der tägliche Check-In nimmt dich jeden Tag an die Hand. Er zeigt dir exakt, was du prüfen musst, und bewahrt dich vor typischen Anfängerfehlern. Konstanz ist hier dein wichtigstes Werkzeug.';

  @override
  String get onboardingTitle3 => 'Schluss mit der Überdüngung.';

  @override
  String get onboardingText3 =>
      'Du misst lediglich deinen pH- und EC-Wert. Unser System berechnet im Hintergrund auf den Milliliter genau, was deine Pflanze heute benötigt. Kein Rätselraten bei den Düngeschemata mehr.';

  @override
  String get onboardingNextButton => 'Weiter';

  @override
  String get onboardingStartButton => 'Loslegen';

  @override
  String get onboardingFinalTitle => 'Bereit für den Start.';

  @override
  String get onboardingFinalText =>
      'Bevor wir deinen ersten Samen keimen lassen, müssen wir sicherstellen, dass deine Hardware bereit ist. Steht dein Zelt bereits komplett fertig, oder sollen wir den Aufbau gemeinsam Schritt für Schritt durchgehen?';

  @override
  String get onboardingTentSetupButton => 'Zelt gemeinsam aufbauen';

  @override
  String get onboardingDashboardButton => 'Zelt steht! Zum Dashboard';

  @override
  String get dashboardTitle => 'Meine DWC Pflanzen';

  @override
  String get dashboardEmptyTitle => 'Dein Zelt ist leer.';

  @override
  String get dashboardEmptyText => 'Drücke das + um eine Pflanze hinzuzufügen.';

  @override
  String dashboardArchiveButtonCenter(int count) {
    return 'Ernte-Archiv ansehen ($count erfolgreiche Grows)';
  }

  @override
  String dashboardArchiveButton(int count) {
    return 'Ernte-Archiv ($count Grows)';
  }

  @override
  String get plantStatusCheckOk => 'Check ok';

  @override
  String get plantStatusCheckUrgent => 'Check dringend nötig';

  @override
  String get plantStatusCheckRecommended => 'Check-in empfohlen';

  @override
  String get plantStatusFirstCheckNeeded => 'Erster Check nötig';

  @override
  String get dashboardStartGermination => 'Keimung starten';

  @override
  String get dashboardWaitGermination => 'Warten (12-24h)';

  @override
  String get dashboardCheckRoot => 'Wurzel prüfen';

  @override
  String get phaseOnboarding => 'Onboarding';

  @override
  String get phaseGermination => 'Keimung';

  @override
  String phaseVeg(int day) {
    return 'Wachstum (Tag $day)';
  }

  @override
  String phaseFlower(int day) {
    return 'Blüte (Tag $day)';
  }

  @override
  String get phaseDrying => 'Trocknung';

  @override
  String get phaseCuring => 'Curing';

  @override
  String get phaseArchived => 'Archiviert';

  @override
  String get lastCheckNever => 'Letzter Check: Nie';

  @override
  String get lastCheckToday => 'Letzter Check: heute';

  @override
  String get lastCheckYesterday => 'Letzter Check: gestern';

  @override
  String lastCheckDaysAgo(int days) {
    return 'Letzter Check: vor $days Tagen';
  }

  @override
  String plantBucketText(String name, int liters) {
    return '$name • $liters L Eimer';
  }

  @override
  String get addPlantTitle => 'Neue Pflanze anlegen';

  @override
  String get addPlantSection1 => '1. Pflanzenname / Eimerbezeichnung';

  @override
  String get addPlantNameLabel => 'Name deiner Pflanze oder des Eimers';

  @override
  String get addPlantRequired => 'Pflichtfeld';

  @override
  String get addPlantSection2 => '2. Reservoirvolumen (in Litern)';

  @override
  String get addPlantVolumeDesc =>
      'Wie viel Liter Wasser fasst dein Eimer im Betrieb?';

  @override
  String get addPlantCustomLiters => 'Individuell (z.B. 18.5 L)';

  @override
  String get addPlantSection3 => '3. Wahl der Düngermarke';

  @override
  String get addPlantBrandDesc =>
      'Welche Nährstofflinie nutzt du für diese Pflanze?';

  @override
  String get addPlantSection4 => '4. Pflanzen-Genetik';

  @override
  String get addPlantTypeDesc => 'Um welchen Pflanzentyp handelt es sich?';

  @override
  String get addPlantTypePhoto => 'Photo (Photoperiodisch)';

  @override
  String get addPlantTypeAuto => 'Auto (Autoflowering)';

  @override
  String get addPlantSection5 => '5. Beleuchtungs- & Lampen-Daten';

  @override
  String get addPlantLampDesc =>
      'Deine Beleuchtungs-Daten (für exakte Abstandsempfehlungen)';

  @override
  String get addPlantLampType => 'Lampentyp:';

  @override
  String get addPlantLampWattage => 'Wattzahl:';

  @override
  String get addPlantLampCustomWattage => 'Individuell (z.B. 240 W)';

  @override
  String get addPlantLampCount => 'Anzahl Pflanzen unter Lampe:';

  @override
  String get addPlantLampCustomCount => 'Individuell (z.B. 6)';

  @override
  String get addPlantSection6 => '6. Aktueller Start-Stand & Tag';

  @override
  String get addPlantPhaseDesc =>
      'In welcher Phase & an welchem Tag befindet sich die Pflanze heute?';

  @override
  String get addPlantPhaseGermination => 'Samen';

  @override
  String get addPlantPhaseVeg => 'Vegetation';

  @override
  String get addPlantPhaseFlower => 'Blüte';

  @override
  String get addPlantCurrentDay => 'Aktueller Tag in dieser Phase (z.B. 1)';

  @override
  String get addPlantSubmit => 'Pflanze im Dashboard anlegen';

  @override
  String get checkinHealthTitle => 'Gesundheits-Check';

  @override
  String get checkinHealthDesc =>
      '• Wirf einen genauen Blick auf die Blätter deiner Pflanze.\n• Achte auf schlaff hängende Blätter, braune Flecken oder stark nach oben eingerollte Ränder.\n\nTIPP: Wenn die Blätter minimal nach oben zeigen (\'Praying Leaves\'), ist die Pflanze extrem glücklich.';

  @override
  String get checkinHealthNext => 'Sieht gut aus';

  @override
  String get checkinRootsCheckTitle => 'Suchen nach Wurzeln';

  @override
  String get checkinRootsCheckDesc =>
      '• Hebe den Netztopf leicht an.\n• Hängen bereits weiße Wurzeln unten aus dem Netztopf heraus in Richtung Wasser?';

  @override
  String get checkinRootsCheckYes => 'Ja';

  @override
  String get checkinRootsCheckNo => 'Nein';

  @override
  String get checkinNext => 'Weiter';

  @override
  String get checkinWateringTitle => 'Von oben gießen';

  @override
  String get checkinWateringDesc =>
      '• Da die Wurzeln das Wasser noch nicht erreicht haben, helfe etwas nach.\n• Nimm einen kleinen Becher und gieße etwas Wasser *aus dem Eimer* vorsichtig um den Stamm über den Blähton.\n\nTIPP: Nutze ausschließlich das Wasser, das ohnehin schon im Eimer ist. Füge kein neues Wasser von außen hinzu.';

  @override
  String get checkinAdjustTitle => 'Werte anpassen';

  @override
  String get checkinAdjustDesc =>
      'Hier wird später erklärt, wie du den pH- und EC-Wert richtig anpasst. (Beispiel-Screen)';

  @override
  String get checkinFinishTitle => 'Alles erledigt.';

  @override
  String get checkinFinishDesc =>
      '• Du hast alle wichtigen Parameter geprüft.\n• Dein Zelt ist nun wieder sicher für die nächsten 24 Stunden.\n• Klicke auf Speichern, um deine Werte im Logbuch zu sichern.';

  @override
  String get checkinFinishNext => 'Check-In Speichern';

  @override
  String get checkinMeasureTitle => 'Messwerte eintragen';

  @override
  String get checkinPhLabel => 'pH-Wert (z.B. 5.8)';

  @override
  String get checkinEcLabel => 'EC-Wert (z.B. 1.2)';

  @override
  String get checkinBack => 'Zurück';

  @override
  String get checkinSaveValues => 'Werte speichern';

  @override
  String get checkinValuesRequired => 'Bitte Werte eintragen';

  @override
  String get checkinLampTitle => 'Lampenabstand prüfen';

  @override
  String get checkinLampMeasureInstruction =>
      '• Die Pflanze wächst jeden Tag näher an die Lampe heran.\n• Lege ein Stück Papier (80g) als Diffusor über die Frontkamera.\n• Halte das Handy genau auf Höhe der obersten Blätter und richte es zur Lampe.\n\nTIPP: Nutze immer Papier als Diffusor, sonst sind die Werte völlig unbrauchbar.';

  @override
  String get checkinLampTargetPpfdLabel => 'Zielbereich';

  @override
  String get checkinMeasurePpfd => 'PPFD Messen';

  @override
  String checkinMeasurePpfdAgain(String ppfd) {
    return 'Neu Messen (PPFD: $ppfd)';
  }

  @override
  String get checkinLampNext => 'Abstand passt';

  @override
  String get germinationTitle1 => 'Das Wasserglas';

  @override
  String get germinationDesc1 =>
      '• Fülle ein kleines Glas mit handwarmem Wasser.\n• Lass deinen Samen sanft hineinfallen. Er wird zunächst an der Oberfläche schwimmen.\n\nTIPP: Berühre den Samen so wenig wie möglich mit den Fingern. Nutze eine Pinzette.';

  @override
  String get germinationNext1 => 'Erledigt & Weiter';

  @override
  String get germinationTitle1b => 'Steinwolle & pH-Wert';

  @override
  String get germinationDesc1b =>
      '• Fülle eine Schüssel mit Wasser und miss den pH-Wert.\n• Senke den pH-Wert mit pH-Down tröpfchenweise auf etwa 5.5 ab.\n• Lege deinen Steinwollwürfel hinein und lass ihn mindestens 12 Stunden einweichen.\n\nTIPP: Drücke die Steinwolle niemals wie einen Schwamm aus. Das zerstört ihre innere Struktur.';

  @override
  String get germinationNext1b => 'Steinwolle weicht ein';

  @override
  String get germinationTitle2 => 'Die Dunkelheit';

  @override
  String get germinationDesc2 =>
      '• Stelle das Wasserglas an einen warmen (ca. 22-25°C), absolut dunklen Ort.\n• Ein Küchenschrank eignet sich hierfür hervorragend.\n\nTIPP: Markiere das Glas, damit niemand aus Versehen das Wasser wegschüttet.';

  @override
  String get germinationNext2 => 'Ab in den Schrank';

  @override
  String get germinationTitle3 => 'Warten und Prüfen';

  @override
  String get germinationDesc3 =>
      '• Lass den Samen nun für 12 bis 24 Stunden im Glas ruhen.\n• Hol das Glas aus dem Schrank und prüfe vorsichtig: Ist die Samenschale leicht aufgeplatzt und zeigt sich eine kleine, weiße Wurzelspitze?';

  @override
  String get germinationNext3 => 'Wurzel prüfen';

  @override
  String get germinationTitle4 => 'Noch geschlossen';

  @override
  String get germinationDesc4 =>
      '• Der Samen ist noch komplett geschlossen.\n• Gib ihm noch etwas Zeit im Dunkeln.\n\nTIPP: Manche Samen benötigen bis zu 48 oder 72 Stunden. Geduld ist jetzt wichtig.';

  @override
  String get germinationNext4 => 'Wurzel ist da!';

  @override
  String get germinationAlt4 => 'Noch geschlossen';

  @override
  String get germinationTitle5 => 'Geduld!';

  @override
  String get germinationDesc5 =>
      '• Der Samen ist noch komplett geschlossen.\n• Gib ihm noch etwas Zeit im Dunkeln.\n\nTIPP: Manche Samen benötigen bis zu 48 oder 72 Stunden. Geduld ist jetzt wichtig.';

  @override
  String get germinationNext5 => 'Wurzel prüfen';

  @override
  String get germinationTitle6 => 'Einzug in die Steinwolle';

  @override
  String get germinationDesc6 =>
      '• Nimm den eingeweichten Steinwollwürfel aus dem Wasser.\n• Setze den Samen etwa 1 bis 2 cm tief in das Loch des Würfels.\n• WICHTIG: Die weiße Wurzelspitze muss strikt nach unten zeigen.\n\nTIPP: Verschließe das Loch oben ganz leicht, indem du ein winziges Stückchen Steinwolle vom Rand darüber zupfst. So bleibt es innen dunkel.';

  @override
  String get germinationNext6 => 'Samen ist eingepflanzt';

  @override
  String get germinationTitle7 => 'Vorbereitung des Netztopfs';

  @override
  String get germinationDesc7 =>
      '• Spüle deinen Blähton extrem gründlich unter fließendem Wasser ab, bis das Wasser klar bleibt.\n• Setze den Steinwollwürfel mittig in deinen Netztopf.\n• Fülle den restlichen Platz vorsichtig mit dem gewaschenen Blähton auf.\n\nTIPP: Achte darauf, dass die oberste Schicht der Steinwolle leicht vom Blähton bedeckt ist, um Algenbildung zu verhindern.';

  @override
  String get germinationNext7 => 'Im Netztopf gesichert';

  @override
  String get germinationTitle8 => 'Der Eimer & Das Klima';

  @override
  String get germinationDesc8 =>
      '• Fülle deinen DWC-Eimer mit Wasser (pH 5.8). Gib noch keinen Dünger hinzu.\n• Der Wasserstand sollte etwa 1 bis 2 cm unter dem Boden des Netztopfs enden. Das Wasser darf die Steinwolle nicht berühren.\n• Hänge den Netztopf ein und schalte die Luftpumpe auf 100% ein.\n\nTIPP: Die platzenden Blubberblasen spritzen kleine Wassertropfen an den Netztopf. Das reicht völlig aus, um die Steinwolle feucht zu halten.';

  @override
  String get germinationNext8 => 'Eimer & Klima bereit';

  @override
  String get germinationTitle9 => 'Sanftes Licht';

  @override
  String get germinationDesc9 =>
      '• Sämlinge vertragen noch kein starkes Licht.\n• Hänge die Lampe hoch auf und dimme sie stark herunter.\n• Nutze den eingebauten PPFD-Messer (ca. 150-200 µmol/m²/s an der Spitze).\n\nTIPP: Wenn es in deinem Zelt zu kalt ist (<22°C), hänge die Lampe etwas höher und drehe sie stärker auf, um ihre Abwärme als Heizung zu nutzen.';

  @override
  String get germinationNext9 => 'Keimung abschließen';

  @override
  String get germinationToDashboard => 'Zum Dashboard';

  @override
  String get germinationSeedClosed => 'Geschlossen';

  @override
  String get germinationSeedOpened => 'Geöffnet';

  @override
  String get germinationNextButton => 'Weiter';

  @override
  String get tentIntroTitle => 'Wissen & Hardware gecheckt!';

  @override
  String get tentIntroDesc =>
      'Du weißt jetzt alles Wichtige über Hardware und Wasser.\n\nAls Nächstes bauen wir gemeinsam dein Zelt auf. Hast du es schon komplett aufgebaut und willst direkt ins Dashboard, oder sollen wir Schritt für Schritt durchgehen?';

  @override
  String get tentIntroNext => 'Zelt gemeinsam aufbauen';

  @override
  String get tentIntroSkip => 'Zelt steht! Zum Dashboard';

  @override
  String get tentTitle1 => 'Station 1: Der Standplatz';

  @override
  String get tentDesc1 =>
      '• Wähle einen Ort in der Nähe eines Fensters.\n• Baue das Metallgerüst auf und ziehe die Zelthülle darüber.\n• Lege die wasserdichte Einlegewanne auf den Zeltboden.\n\nTIPP: Der Zeltboden muss absolut wasserdicht sein. Bei Hydroponik kann immer mal ein Tropfen daneben gehen.';

  @override
  String get tentNext1 => 'Zelt steht & ist isoliert';

  @override
  String get tentTitle2 => 'Station 2: Die Lunge des Zeltes';

  @override
  String get tentDesc2 =>
      '• Hänge den Aktivkohlefilter (AKF) und den Rohrventilator ganz oben unter die Zeltdecke.\n• Verbinde beide luftdicht miteinander.\n\nTIPP: Nutze großzügig Panzertape oder starke Schlauchklemmen. Jeder Millimeter, der nicht dicht ist, lässt später ungefilterten Geruch entweichen.';

  @override
  String get tentNext2 => 'Abluft hängt sicher';

  @override
  String get tentTitle3 => 'Station 3: Abluftschlauch';

  @override
  String get tentDesc3 =>
      '• Führe den Abluftschlauch vom Ventilator durch eine der oberen Öffnungen nach draußen, idealerweise aus dem Fenster.';

  @override
  String get tentNext3 => 'Schlauch verlegt';

  @override
  String get tentTitle4 => 'Station 4: Die Sonne aufhängen';

  @override
  String get tentDesc4 =>
      '• Hänge deine LED-Lampe mittig im Zelt auf.\n• Verwende stufenlos verstellbare Seilzugratschen (Rope Ratchets), keine starren Ketten.\n\nTIPP: Wenn deine Lampe ein externes Netzteil (Driver) hat, montiere es außerhalb des Zeltes. Das erspart dir im Sommer Hitze.';

  @override
  String get tentNext4 => 'Lampe hängt';

  @override
  String get tentTitle5 => 'Station 5: Die frische Brise';

  @override
  String get tentDesc5 =>
      '• Befestige deine Umluft-Ventilatoren an den Eckstangen.\n• Richte sie so aus, dass sie später über und unter dem Blätterdach wehen.\n\nTIPP: Richte den Luftstrom niemals direkt auf eine junge Pflanze. Das führt zu massivem Windbrand.';

  @override
  String get tentNext5 => 'Ventilatoren montiert';

  @override
  String get tentTitle6 => 'Station 6: Eimer & Pumpe';

  @override
  String get tentDesc6 =>
      '• Stelle den leeren DWC-Eimer mittig unter die Lampe.\n• Setze den Netztopf ein.';

  @override
  String get tentNext6 => 'Eimer positioniert';

  @override
  String get tentTitle7 => 'Station 7: Die Lunge (Luftpumpe)';

  @override
  String get tentDesc7 =>
      '• Positioniere die Luftpumpe außerhalb des Zeltes.\n• Führe den Luftschlauch zum Ausströmerstein im Eimer.\n\nTIPP: WICHTIG: Die Luftpumpe MUSS immer außerhalb des Zeltes stehen und am besten höher als der Wasserspiegel! Fällt der Strom aus, kann das Wasser sonst durch den Schlauch in die Pumpe laufen.';

  @override
  String get tentNext7 => 'Pumpe platziert';

  @override
  String get tentTitle8 => 'Station 8: Verkabelung';

  @override
  String get tentDesc8 =>
      '• Führe alle Kabel sauber durch die vorgesehenen Öffnungen nach draußen.\n\nTIPP: Lege unter keinen Umständen Mehrfachsteckdosen auf den Zeltboden. Wasser und Strom sind lebensgefährlich.';

  @override
  String get tentNext8 => 'Kabel verlegt';

  @override
  String get tentTitle9 => 'Station 9: Zeitschaltuhr & Dauerstrom';

  @override
  String get tentDesc9 =>
      '• Schließe die Lampe an die Zeitschaltuhr an.\n• Abluft, Umluft und Luftpumpe laufen auf Dauerstrom (24/7).';

  @override
  String get tentNext9 => 'Alles verkabelt';

  @override
  String get tentTitle10 => 'Station 10: Der letzte Check';

  @override
  String get tentDesc10 =>
      '• Schalte alle Geräte ein und schließe das Zelt vollständig.\n• Zieht sich die Zelthülle leicht nach innen? (Unterdruck-Check).\n\nTIPP: Schalte das Licht im Raum aus. Dringt aus dem Zelt irgendwo Licht nach außen? Klebe Lecks von innen ab.';

  @override
  String get tentNext10 => 'Setup abgeschlossen!';

  @override
  String get ppfdTitle => 'PPFD Meter';

  @override
  String get ppfdCalibrationTitle => 'Kalibrierung';

  @override
  String get ppfdCalibrationDesc =>
      'Nutze einen echten PAR-Meter, um den Wert abzugleichen. Ändere den Multiplikator, bis die Werte übereinstimmen.';

  @override
  String ppfdCalibrationFactor(String factor) {
    return 'Faktor: ${factor}x';
  }

  @override
  String get ppfdCalibrationDone => 'Fertig';

  @override
  String get ppfdInstruction =>
      'Bitte lege ein Stück 80g Druckerpapier als Diffusor über die Frontkamera (oben am Bildschirmrand).';

  @override
  String get ppfdLightSourceLabel => 'Leuchtmittel';

  @override
  String get ppfdUnit => 'μmol/m²/s';

  @override
  String ppfdError(String err) {
    return 'Fehler: $err';
  }

  @override
  String get ppfdTakeValue => 'Messwert übernehmen';

  @override
  String get hardwareAdvisorTitle => 'Hardware-Ratgeber';

  @override
  String get hardwareAcquired => 'Hab ich besorgt!';

  @override
  String get hardwareHaveIt => 'Besitze ich';

  @override
  String get hardwareCatLight => 'Licht & Klima';

  @override
  String get hardwareCatDwc => 'Das Herzstück (DWC)';

  @override
  String get hardwareCatWater => 'Wasser & Messen';

  @override
  String get hardwareCatAccessories => 'Zubehör';

  @override
  String get hw_grow_tentTitle => 'Grow-Zelt';

  @override
  String get hw_grow_tentDesc =>
      'Ein lichtdichtes Zelt sorgt für das perfekte Klima und schützt vor Störlicht.';

  @override
  String get hw_ledTitle => 'LED-Pflanzenlampe';

  @override
  String get hw_ledDesc =>
      'Cannabis liebt Licht! Ohne starke Lampe gibt es keine fetten Buds.';

  @override
  String get hw_exhaustTitle => 'Abluft-Ventilator';

  @override
  String get hw_exhaustDesc =>
      'Erneuert die Luft im Zelt und transportiert Hitze sowie Feuchtigkeit nach draußen.';

  @override
  String get hw_carbon_filterTitle => 'Aktivkohlefilter (AKF)';

  @override
  String get hw_carbon_filterDesc =>
      'Cannabis stinkt gewaltig. Der Filter neutralisiert den Geruch zu 100%.';

  @override
  String get hw_circulation_fanTitle => 'Umluft-Ventilator';

  @override
  String get hw_circulation_fanDesc =>
      'Sorgt für dicke Stängel und verhindert Schimmel in den Blüten.';

  @override
  String get hw_thermo_hygroTitle => 'Thermo-/Hygrometer';

  @override
  String get hw_thermo_hygroDesc =>
      'Zur Überwachung von Temperatur und Luftfeuchtigkeit.';

  @override
  String get hw_humidifierTitle => 'Luftbefeuchter / Entfeuchter';

  @override
  String get hw_humidifierDesc =>
      'Zur exakten Kontrolle der Luftfeuchtigkeit (VPD).';

  @override
  String get hw_dwc_bucketTitle => 'DWC-Eimer / Wassertank';

  @override
  String get hw_dwc_bucketDesc => 'Das neue Zuhause deiner Wurzeln!';

  @override
  String get hw_net_potTitle => 'Netztopf';

  @override
  String get hw_net_potDesc => 'Hält den Blähton und gibt den Wurzeln Halt.';

  @override
  String get hw_air_pumpTitle => 'Luftpumpe & Ausströmerstein';

  @override
  String get hw_air_pumpDesc =>
      'Sauerstoff ist Leben! Ohne Blubberblasen ertrinken die Wurzeln.';

  @override
  String get hw_clay_pebblesTitle => 'Blähton';

  @override
  String get hw_clay_pebblesDesc => 'Steriles Medium statt Erde.';

  @override
  String get hw_starter_cubesTitle => 'Anzuchtwürfel';

  @override
  String get hw_starter_cubesDesc =>
      'Darin keimt dein Samen sicher und stabil.';

  @override
  String get hw_second_bucketTitle => 'Zweiter DWC-Eimer';

  @override
  String get hw_second_bucketDesc => 'Erleichtert den Wasserwechsel enorm.';

  @override
  String get hw_second_bucketProTip =>
      'Pro-Tipp: Für den schnellen 2-Eimer-Wechsel-Trick in der Vegi-Phase.';

  @override
  String get hw_chillerTitle => 'Durchlaufkühler (Water Chiller)';

  @override
  String get hw_chillerDesc => 'Kühlt das Wasser auf perfekte 18-20°C.';

  @override
  String get hw_hydro_nutesTitle => 'Hydrokultur-Dünger';

  @override
  String get hw_hydro_nutesDesc => 'Spezieller Dünger für DWC.';

  @override
  String get hw_ph_dropsTitle => 'pH-Messtropfen oder Gerät';

  @override
  String get hw_ph_dropsDesc =>
      'Der pH-Wert entscheidet, ob die Pflanze Nährstoffe aufnimmt.';

  @override
  String get hw_ph_dropsProTip =>
      'Pro-Tipp: Billige Stifte sind ungenau, Tropfen sind für Anfänger sicherer.';

  @override
  String get hw_ec_meterTitle => 'EC/TDS-Messgerät';

  @override
  String get hw_ec_meterDesc =>
      'Zeigt dir genau an, wie viel Dünger im Wasser ist.';

  @override
  String get hw_ph_downTitle => 'pH -';

  @override
  String get hw_ph_downDesc =>
      'Um den pH-Wert zu senken. Nutze als Stoff z.B. Phosphorsäure, keine organischen Säuren.';

  @override
  String get hw_ph_downProTip =>
      'Pro-Tipp: Phosphorsäure ist stabil und hält den pH-Wert zuverlässig unten.';

  @override
  String get hw_ph_upTitle => 'pH +';

  @override
  String get hw_ph_upDesc =>
      'Um den pH-Wert zu erhöhen. Nutze als Stoff z.B. Kaliumcarbonat oder Kaliumsilikat.';

  @override
  String get hw_calibration_fluidTitle => 'Kalibrierflüssigkeit';

  @override
  String get hw_calibration_fluidDesc => 'Um deine Messgeräte zu eichen.';

  @override
  String get hw_water_pumpTitle => 'Elektrische Mini-Tauchpumpe';

  @override
  String get hw_water_pumpDesc => 'Pumpt das Wasser aus dem Eimer.';

  @override
  String get hw_water_pumpProTip =>
      'Pro-Tipp: Erleichtert den Wasserwechsel enorm.';

  @override
  String get hw_ro_systemTitle => 'Umkehrosmose-Anlage';

  @override
  String get hw_ro_systemDesc => 'Filtert alle Salze aus dem Leitungswasser.';

  @override
  String get hw_ro_systemProTip =>
      'Pro-Tipp: Bei extrem hartem Leitungswasser.';

  @override
  String get hw_timerTitle => 'Zeitschaltuhr';

  @override
  String get hw_timerDesc =>
      'Steuert das Licht automatisch (z.B. 18h an, 6h aus).';

  @override
  String get hw_scissorsTitle => 'Ernteschere';

  @override
  String get hw_scissorsDesc => 'Für die Maniküre der Buds.';

  @override
  String get hw_loupeTitle => 'Taschenmikroskop / Lupe';

  @override
  String get hw_loupeDesc =>
      'Um den perfekten Erntezeitpunkt (Trichome) zu bestimmen.';

  @override
  String get waterGuideTitle => 'Wasser-Masterclass';

  @override
  String get waterGuideChap1Title => 'Die Regeln des Wasserwechsels';

  @override
  String get waterGuideChap1Desc =>
      'Pflanzen scheiden Toxine aus und Salze stauen sich an (EC-Creep). Ein wöchentlicher Wechsel stabilisiert den pH-Wert und die Nährstoffaufnahme.\n\nNutze den 2-Eimer-Wechsel-Trick in der Vegi oder eine kleine Tauchpumpe.';

  @override
  String get waterGuideChap2Title => 'Dein Leitungswasser (Der Start-EC)';

  @override
  String get waterGuideChap2Desc =>
      'Wie hart ist dein Leitungswasser? Suche online nach \'Wasserwerte [Dein Wohnort]\', um den Bericht deines Versorgers zu finden, und prüfe den Grund-EC-Wert (ohne Dünger).';

  @override
  String get waterGuideEc0_2 => 'EC 0.0 - 0.2 (Sehr weich)';

  @override
  String get waterGuideEc0_2Desc =>
      'Nahezu salzfrei. Du MUSST CalMag (Calcium/Magnesium) hinzufügen, bis der EC ca. 0.4 erreicht, bevor der Hauptdünger beigemischt wird.';

  @override
  String get waterGuideEc0_4 => 'EC 0.2 - 0.4 (Perfektes Wasser)';

  @override
  String get waterGuideEc0_4Desc =>
      'Jackpot! Das ideale Leitungswasser. Kein zusätzliches CalMag nötig.';

  @override
  String get waterGuideEc0_7 => 'EC 0.5 - 0.7 (Hartes Wasser)';

  @override
  String get waterGuideEc0_7Desc =>
      'Viel Calcium. Kein CalMag nutzen! Nutze speziellen Hard-Water-Dünger und wechsle den Tank strikt wöchentlich.\n\nPro-Tipp: Wenn nur Magnesium fehlt, füge reines Bittersalz (0,1-0,3 g/L) hinzu.';

  @override
  String get waterGuideEcHard => 'EC > 0.7 (Sehr hart / Salzig)';

  @override
  String get waterGuideEcHardDesc =>
      'Ungeeignet für DWC! Zwingend aufbereiten.\n\nAchte im Wasserbericht auch auf Natrium (< 50 mg/L) und Chlorid (< 70 mg/L).';

  @override
  String get waterGuideChap3Title => 'Wasser aufbereiten';

  @override
  String get waterGuideChap3Desc =>
      '• Der Cut-Trick: Mische hartes Wasser 50/50 mit destilliertem Wasser.\n• Tischfilter (Brita) bringen nichts für den EC-Wert.\n• Umkehrosmose: Die beste Langzeitlösung.\n• Chlor ausgasen: Leitungswasser 24-48h abstehen lassen, bevor man es benutzt!';

  @override
  String get waterGuideNext => 'Verstanden, weiter!';

  @override
  String get plantStatusAllOk => 'Alles im grünen Bereich';

  @override
  String get plantStatusOverdue => 'Check-in überfällig!';

  @override
  String ppfdTargetRange(int min, int max) {
    return 'Zielbereich: $min - $max µmol';
  }

  @override
  String get ppfdHoldValue => 'Wert festhalten';

  @override
  String get ppfdMeasureAgain => 'Neu messen';

  @override
  String get ppfdSaveValue => 'Wert speichern';

  @override
  String get ppfdDiffuserWarning =>
      'WICHTIG: Hast du einen Diffusor (z.B. Papier) über der Kamera?';

  @override
  String get ppfdNeedsMoreLight => 'Mehr Licht';

  @override
  String get ppfdNeedsLessLight => 'Weniger Licht';

  @override
  String get checkinWaterChangeRecTitle => 'Zeit für frisches Wasser?';

  @override
  String get checkinWaterChangeRecDesc =>
      'Dein letzter kompletter Wasserwechsel ist mindestens 7 Tage her. Um die Ansammlung unbrauchbarer Salze zu verhindern und den pH-Wert zu stabilisieren, empfehlen wir, das Wasser heute zu wechseln.';

  @override
  String get checkinWaterChangeRecNow => 'Ja, Wasserwechsel starten';

  @override
  String get checkinWaterChangeRecLater => 'Nein, nur Wasser nachfüllen';

  @override
  String get checkinContinue => 'Weiter';

  @override
  String get checkinWaterLevelTitle => 'Wasserstand prüfen';

  @override
  String get checkinWaterLevelDesc =>
      '• Prüfe den Wasserstand im Eimer.\n• Ist er gesunken, fülle ihn mit klarem Leitungswasser wieder auf, bis das Wasser 1-2 cm unter dem Netztopf steht.\n• Trage hier ein, wie viele Liter du genau nachgefüllt hast.\n\nTIPP: Mache eine Markierung für die optimale Füllhöhe an den Eimer.';

  @override
  String get checkinWaterLevelLabel => 'Nachgefüllte Liter';

  @override
  String get checkinWaterLevelSkip => 'Kein Wasser nachgefüllt';

  @override
  String get checkinEcMeasureTitle => 'Messwerte eintragen';

  @override
  String get checkinEcMeasureDesc =>
      '• Miss den EC-Wert und den pH-Wert direkt im Eimerwasser (nachdem du aufgefüllt hast).\n• Trage beide Werte hier exakt ein.\n\nTIPP: Rühre das Wasser vor der Messung kurz um.';

  @override
  String get checkinNutrientTitle => 'Dünger hinzufügen';

  @override
  String get checkinNutrientDesc =>
      '• Basierend auf deinem nachgefüllten Wasser und den aktuellen Werten benötigst du heute die folgenden Mengen.\n• Gib die Dünger nacheinander in den Eimer und rühre gut um.\n\nTIPP: Mische pure Dünger niemals unverdünnt direkt zusammen.';

  @override
  String checkinNutrientGrow(String amount) {
    return 'Grow: $amount ml';
  }

  @override
  String checkinNutrientMicro(String amount) {
    return 'Micro: $amount ml';
  }

  @override
  String checkinNutrientBloom(String amount) {
    return 'Bloom: $amount ml';
  }

  @override
  String get checkinEcTooHighPartial =>
      'Dein EC-Wert ist zu hoch! Pumpe ca. 30% des Wassers ab und ersetze es durch klares, ungedüngtes Wasser.';

  @override
  String get checkinEcTooHighFull =>
      'Dein EC-Wert ist zu hoch und das Wasser ist alt. Bitte wechsle das Wasser komplett.';

  @override
  String get checkinWaterChangeButton => 'Zum Wasserwechsel';

  @override
  String get checkinPhAdjustTitle => 'pH-Wert justieren';

  @override
  String get checkinPhAdjustDesc =>
      '• Dein Zielbereich liegt bei 5.5 bis 6.5.\n• Ist dein gemessener Wert zu hoch, gib tröpfchenweise pH-Down hinzu.\n• Rühre um, warte eine Minute und miss erneut.\n\nTIPP: pH-Down besteht meist aus konzentrierter Säure. Wenige Tropfen verändern den Wert massiv. Arbeite extrem vorsichtig.';

  @override
  String get waterChangeTitle => 'Wasserwechsel';

  @override
  String get waterChangeMethod1Title => 'Der wöchentliche Wechsel';

  @override
  String get waterChangeMethod1Desc =>
      '• Wir empfehlen, das Wasser im Tank alle 7 bis 10 Tage komplett auszutauschen.\n• Pumpe das alte Wasser vollständig ab (z.B. mit Tauchpumpe).\n• Fülle frisches, temperiertes und pH-reguliertes Wasser mit Dünger ein.\n\nTIPP: Bereite das Wasser immer in einem zweiten Eimer vor.';

  @override
  String get waterChangeMethod2Title => 'Methode 2: Zweiter Eimer';

  @override
  String get waterChangeMethod2Desc =>
      '• Bereite einen zweiten, sauberen Eimer vor.\n• Hebe den Deckel mitsamt Pflanze hoch und setze ihn auf den zweiten Eimer.\n• Leere und reinige den Haupttank und fülle ihn frisch auf.';

  @override
  String get waterChangeDone => 'Wasserwechsel erledigt';

  @override
  String get checkinPhStatusTitle => 'pH-Wert Status';

  @override
  String get checkinPhStatusOk =>
      'Dein pH-Wert ist im perfekten Bereich (5.5 - 6.5)!';

  @override
  String get checkinPhStatusAdjust =>
      'Dein pH-Wert ist nicht optimal. Bitte passe ihn mit pH Up / pH Down in kleinen Schritten an, bis er im Bereich 5.5 - 6.5 liegt.';

  @override
  String get checkinNutrientNone =>
      'Kein Wasser nachgefüllt oder EC optimal. Keine Dünger-Anpassung nötig.';

  @override
  String get checkinDeepDiveWaterChangeRecTitle =>
      'Warum ein kompletter Wechsel?';

  @override
  String get checkinDeepDiveWaterChangeRecText =>
      'Die Pflanze scheidet Stoffwechselprodukte in das Wasser aus und nimmt nie alle Nährstoffe gleichmäßig auf. Fügst du immer nur frisch hinzu, reichern sich unbrauchbare Salze an. Der EC-Wert mag stimmen, besteht aber nur noch aus Abfall. Ein Wechsel ist dein bester Schutz.';

  @override
  String get checkinDeepDiveWaterLevelTitle => 'Die richtige Füllhöhe';

  @override
  String get checkinDeepDiveWaterLevelText =>
      'Eine gesunde Pflanze trinkt extrem viel Wasser. Sinkt der Wasserstand, steigt automatisch die Konzentration der Nährstoffe im restlichen Wasser an, was zu Überdüngung führt. Gleichzeitig muss jedoch immer ein Luftspalt bleiben, damit die oberen \'Luftwurzeln\' Sauerstoff atmen können.';

  @override
  String get checkinDeepDiveEcMeasureTitle => 'Das Steuerinstrument';

  @override
  String get checkinDeepDiveEcMeasureText =>
      'Der EC-Wert sagt dir genau, wie hoch die Nährstoffkonzentration ist. Sinkt er über Nacht, hatte die Pflanze Hunger. Steigt er, war ihr das Wasser zu stark. Der pH-Wert entscheidet, ob die Pflanze diese Nährstoffe chemisch überhaupt aufnehmen kann.';

  @override
  String get checkinDeepDiveEcAdjustTitle => 'Exaktes Düngen';

  @override
  String get checkinDeepDiveEcAdjustText =>
      'Wir düngen niemals \'auf Verdacht\'. Wir ersetzen immer exakt nur die Nährstoffe für das Volumen an Wasser, das die Pflanze getrunken hat. Das verhindert, dass sich unverbrauchte Salze im Tank anstauen und den EC-Wert schleichend in toxische Höhen treiben.';

  @override
  String get checkinDeepDivePhMeasureTitle =>
      'Warum der pH-Wert alles entscheidet';

  @override
  String get checkinDeepDivePhMeasureText =>
      'Cannabis kann Nährstoffe nur in einem bestimmten pH-Bereich aufnehmen. In DWC liegt dieser Sweet Spot zwischen 5.5 und 6.5. Ist der Wert falsch, kannst du so viel düngen wie du willst – die Pflanze verhungert bei vollem Magen (Nutrient Lockout).';

  @override
  String get checkinDeepDivePhAdjustTitle => 'Vorsichtige Korrektur';

  @override
  String get checkinDeepDivePhAdjustText =>
      'Bei falschen pH-Werten kommt es zum \'Nutrient Lockout\'. Die Pflanze verhungert bei vollem Magen. Ein leichter Drift des pH-Wertes im Rahmen von 5.5 bis 6.5 ist normal und sogar gut, da verschiedene Nährstoffe bei minimal unterschiedlichen pH-Werten am besten absorbiert werden.';

  @override
  String get checkinDeepDiveRootsCheckTitle => 'Der Wendepunkt';

  @override
  String get checkinDeepDiveRootsCheckText =>
      'Dieser Moment markiert den Wendepunkt im DWC-Anbau. Sobald die Wurzeln das hochgradig mit Sauerstoff angereicherte Wasser direkt erreichen, schaltet die Pflanze den Turbo ein. Bis das passiert, versorgt sich die Pflanze primär aus der Feuchtigkeit der Steinwolle.';

  @override
  String get checkinDeepDiveTopWateringTitle => 'Vorsichtiges Angießen';

  @override
  String get checkinDeepDiveTopWateringText =>
      'Solange die Wurzeln in der Luft hängen, riskierst du, dass der Steinwollwürfel austrocknet. Durch dieses \'Top Feeding\' hältst du den Blähton und den Würfel feucht. Sobald die Wurzeln im Wasser angekommen sind, ist dieser Schritt strengstens verboten (Gefahr von Stammfäule).';

  @override
  String get checkinDeepDiveLampTitle => 'Das Licht als Motor';

  @override
  String get checkinDeepDiveLampText =>
      'Das Licht ist der Motor für das Wachstum. Die PPFD-Messung stellt sicher, dass wir diesen Motor nicht überdrehen. Wenn die Pflanze in die Höhe schießt, vervielfacht sich die Lichtintensität. Ein zu geringer Abstand führt unweigerlich zu Lichtstress (verbrannte Spitzen).';

  @override
  String get checkinDeepDiveHealthTitle => 'Die Blätter als Display';

  @override
  String get checkinDeepDiveHealthText =>
      'Die Blätter sind das Display deiner Pflanze. Hängen sie extrem schlaff herunter, deutet das bei DWC fast immer auf ein Problem im Wasser hin (Sauerstoffmangel/Wurzelfäule). Braune oder gelbe Flecken signalisieren falsche pH-Werte. Nach oben gerollte Ränder sind der Versuch, Hitzestress abzubauen.';

  @override
  String get checkinDeepDiveFinishTitle => 'Routine ist alles';

  @override
  String get checkinDeepDiveFinishText =>
      'Konstanz ist beim DWC-Anbau alles. Indem du jeden Tag diese kleinen Checks durchführst, verhinderst du, dass kleine Schwankungen zu massiven Problemen eskalieren. Ein abrutschender pH-Wert ist nach einem Tag kein Problem – nach drei Tagen zeigt die Pflanze schwere Schäden.';

  @override
  String get germinationDeepDive1Title => 'Warum das Wasserglas?';

  @override
  String get germinationDeepDive1Text =>
      'Die harte Schale des Samens benötigt Feuchtigkeit, um aufzuweichen. Das handwarme Wasser simuliert den ersten Frühlingsregen und signalisiert dem Keimling, dass es Zeit ist, aufzuwachen. Lass den Samen jedoch nie länger als 24 Stunden im Glas, da er sonst ertrinkt – er benötigt Sauerstoff.';

  @override
  String get germinationDeepDive1bTitle => 'Warum pH-angepasstes Wasser?';

  @override
  String get germinationDeepDive1bText =>
      'Steinwolle ist bei der Herstellung extrem basisch (hoher pH-Wert). Würdest du sie nicht in saurem Wasser einweichen, würde sie später den pH-Wert in deinem DWC-Eimer ständig nach oben ziehen. Der Keimling könnte dann keine Nährstoffe mehr aufnehmen.';

  @override
  String get germinationDeepDive2Title => 'Die Dunkelheit';

  @override
  String get germinationDeepDive2Text =>
      'Cannabissamen sind Dunkelkeimer. In der Natur liegen sie geschützt unter der Erde. Fällt Licht auf den Samen, während er Feuchtigkeit zieht, kann dies seinen Hormonhaushalt stören und den Keimvorgang abbrechen.';

  @override
  String get germinationDeepDive3Title => 'Die Wurzel wächst';

  @override
  String get germinationDeepDive3Text =>
      'Die kleine weiße Spitze, die du siehst, ist die sogenannte Pfahlwurzel (Taproot). Aus ihr bildet sich das gesamte spätere Fundament der Pflanze. Sie ist extrem fragil. Setze sie auf keinen Fall direktem, starkem Licht aus.';

  @override
  String get germinationDeepDive4Title => 'Die Pfahlwurzel (Taproot)';

  @override
  String get germinationDeepDive4Text =>
      'Das kleine weiße Ding, das du siehst, ist die Pfahlwurzel. Sie ist das zukünftige Fundament deiner Pflanze. Aus ihr werden alle weiteren Wurzeln entspringen. Sie ist extrem empfindlich gegenüber Licht, Austrocknung und physischer Beschädigung – fasse sie am besten gar nicht oder nur sehr vorsichtig mit einer Pinzette an.';

  @override
  String get germinationDeepDive5Title => 'Jeder Same ist anders';

  @override
  String get germinationDeepDive5Text =>
      'Geduld ist die wichtigste Tugend eines Growers. Ältere Samen oder Samen mit einer besonders dicken Schale brauchen manchmal bis zu 3 oder 4 Tage. Wenn der Samen jedoch nach 5-7 Tagen im Wasser nicht keimt, war er wahrscheinlich tot oder nicht lebensfähig.';

  @override
  String get germinationDeepDive6Title => 'Der perfekte Startplatz';

  @override
  String get germinationDeepDive6Text =>
      'Wurzeln wachsen immer der Schwerkraft folgend nach unten (Geotropismus), während der Stängel nach oben wächst. Wenn du den Samen falsch herum einsetzt, muss der Keimling im Inneren erst eine 180-Grad-Wende vollziehen. Das kostet ihn wertvolle Energie und verzögert das Wachstum.';

  @override
  String get germinationDeepDive7Title => 'Blähton Vorbereitung';

  @override
  String get germinationDeepDive7Text =>
      'Der Blähton hat keinerlei Nährstoffe. Seine einzige Aufgabe ist es, der Pflanze mechanischen Halt zu geben und das Licht vom Wasserreservoir fernzuhalten. Ungewaschener Blähton spült feinen, roten Staub in deinen Eimer. Dieser Staub blockiert die feinen Poren der Wurzeln und ruiniert deine Luftpumpe.';

  @override
  String get germinationDeepDive8Title => 'DWC Prinzip für Anfänger';

  @override
  String get germinationDeepDive8Text =>
      'Beim Deep Water Culture System ist der Sauerstoff im Wasser dein wichtigster Verbündeter. Stünde die Steinwolle direkt im Wasser, würde sie sich komplett vollsaugen und der Keimling würde unweigerlich ertrinken. Die hohe Luftfeuchtigkeit im Eimer und die feinen Spritzer ziehen die Wurzeln förmlich nach unten.';

  @override
  String get germinationDeepDive9Title => 'PPFD und junge Pflanzen';

  @override
  String get germinationDeepDive9Text =>
      'PPFD misst die Anzahl der Lichtteilchen, die tatsächlich auf der Pflanze ankommen. Ein Sämling hat noch keine echten Blätter für die Photosynthese. Zu viel Licht in diesem Stadium führt zu starkem Lichtstress: Der Sämling bleicht aus, stoppt das Wachstum oder stirbt ab.';

  @override
  String get diagnoseProblemButton => 'Problem Diagnostizieren';

  @override
  String get problemSymptoms => 'Symptome';

  @override
  String get problemTriggers => 'Auslöser';

  @override
  String get problemSolution => 'Lösung';

  @override
  String get problemPrevention => 'Vorbeugung';

  @override
  String get problemActionWaterChange => 'Wasserwechsel durchführen';

  @override
  String get problemActionPpfdMeasure => 'PPFD prüfen';

  @override
  String get problemActionEcAdjust => 'EC-Wert prüfen';

  @override
  String get problemActionPhAdjust => 'pH-Wert prüfen';

  @override
  String get problemSelectPlantPrompt =>
      'Bitte wähle eine Pflanze aus, um die Aktion zu starten:';

  @override
  String get problemNutrientBurnName => 'Nährstoffbrand (Überdüngung)';

  @override
  String get problemNutrientBurnSymptoms =>
      'Braune, verbrannte und knusprige Blattspitzen, die sich langsam nach innen ausbreiten.';

  @override
  String get problemNutrientBurnTriggers =>
      'Nährstoffbrand entsteht, wenn der EC-Wert so hoch ist, dass durch osmotischen Druck Salze in den Blattspitzen abgelagert werden. Eine Überdüngung wirft die Pflanze um Wochen zurück. Dünge bei Zweifeln weniger.';

  @override
  String get problemNutrientBurnSolution =>
      'Senke den EC-Wert im Wasser sofort. Pumpe ca. 30-50% des Wassers ab und fülle reines, pH-reguliertes (ungedüngtes) Wasser nach.';

  @override
  String get problemNutrientBurnPrevention =>
      'Achte auf \'Tip Burn\' – winzige gelbe Punkte ganz an der Spitze der Blätter. Dies ist das perfekte Zeichen, dass du das exakte Limit der Pflanze erreicht hast.';

  @override
  String get problemPhImbalanceName => 'pH-Wert Schwankung';

  @override
  String get problemPhImbalanceSymptoms =>
      'Gelbe, oft rostige Flecken auf den mittleren Blättern. Verdrehtes oder unförmiges Wachstum.';

  @override
  String get problemPhImbalanceTriggers =>
      'Anfänger verwechseln diese Flecken oft mit Kalziummangel und düngen mehr – ein fataler Fehler. Die Mineralien sind da, aber der falsche pH-Wert blockiert die Wurzeln chemisch (Lockout).';

  @override
  String get problemPhImbalanceSolution =>
      'Korrigiere den pH-Wert sofort in den Bereich 5.5 bis 6.5. Ist das Wasser älter als 7 Tage, wechsle es komplett aus.';

  @override
  String get problemPhImbalancePrevention =>
      'Nutze niemals Hausmittel wie Essig oder Zitronensaft, um den pH-Wert zu senken. Der pH-Wert schießt nach wenigen Stunden wieder unkontrolliert nach oben.';

  @override
  String get problemLightBurnName => 'Lichtbrand';

  @override
  String get problemLightBurnSymptoms =>
      'Die Blätter an den obersten Trieben werden gelb oder weiß gebleicht, während die Adern oft grün bleiben. Die Ränder rollen sich nach oben (Kanu-Form) um die Hitze abzuleiten.';

  @override
  String get problemLightBurnTriggers =>
      'Die Lampe hängt zu nah an der Pflanze oder ist zu stark eingestellt. Die Lichtintensität (PPFD) übersteigt das, was die Pflanze verarbeiten kann.';

  @override
  String get problemLightBurnSolution =>
      'Erhöhe den Abstand zur Lampe oder dimme sie herunter. Miss den PPFD-Wert an der Pflanzenspitze, um ihn anzupassen.';

  @override
  String get problemLightBurnPrevention =>
      'Passe den Lampenabstand an das Wachstum an. Nutze den PPFD-Meter bei jedem Check-In, um im optimalen Bereich zu bleiben.';

  @override
  String get problemCalciumDeficiencyName => 'Kalziummangel';

  @override
  String get problemCalciumDeficiencySymptoms =>
      'Kleine braune/rostige Flecken auf jüngeren und mittleren Blättern. Neue Blätter wachsen oft verkrüppelt oder haben gelbe Ränder.';

  @override
  String get problemCalciumDeficiencyTriggers =>
      'Meist weiches Leitungswasser (RO-Wasser oder EC < 0.2) ohne CalMag-Zusatz. Manchmal auch blockiert durch falschen pH-Wert oder zu viel Kalium.';

  @override
  String get problemCalciumDeficiencySolution =>
      'Korrigiere den EC-Wert, indem du CalMag hinzufügst (Grundwasser immer zuerst auf 0.4 EC mit CalMag anheben, bevor Dünger rein kommt).';

  @override
  String get problemCalciumDeficiencyPrevention =>
      'Bei sehr weichem Wasser oder Osmosewasser zwingend bei jedem Wasserwechsel CalMag als Basis hinzufügen.';

  @override
  String get checkinVentilatorTitle => 'Ventilator-Check';

  @override
  String get checkinVentilatorDesc =>
      'Laufen deine Umluft-Ventilatoren und sind sie richtig positioniert?\n\nTIPP: Richte den Luftstrom niemals direkt auf die Pflanzen. Ein starrer Luftstrom führt zu Windbrand und trocknet die Blätter aus.';

  @override
  String get checkinVentilatorNext => 'Sieht gut aus';

  @override
  String get checkinVentilatorDeepDiveTitle => 'Ventilator-Platzierung';

  @override
  String get checkinVentilatorDeepDiveText =>
      'Platziere einen Ventilator über dem Blätterdach und einen darunter. Sie sollten schwenken (oszillieren) und eine sanfte Brise erzeugen.\n\nTypische Fehler:\n- Richte Ventilatoren nie direkt auf kleine Pflanzen (Gefahr von Windbrand!).\n- Ein starrer Luftstrom trocknet die Blätter aus.\n- Stehende Luft ohne Umluft begünstigt Schimmel.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsAppearance => 'Erscheinungsbild';

  @override
  String get settingsTheme => 'Design';

  @override
  String get settingsThemeLight => 'Hell';

  @override
  String get settingsThemeDark => 'Dunkel';

  @override
  String get settingsThemeSystem => 'System-Standard';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsLanguageSystem => 'System-Standard';

  @override
  String get settingsLanguageDe => 'Deutsch';

  @override
  String get settingsLanguageEn => 'Englisch';

  @override
  String get settingsUnits => 'Einheiten';

  @override
  String get settingsVolumeUnit => 'Volumen';

  @override
  String get settingsVolumeLiters => 'Liter (L)';

  @override
  String get settingsVolumeGallons => 'Gallonen (Gal)';

  @override
  String get settingsTempUnit => 'Temperatur';

  @override
  String get settingsTempC => 'Celsius (°C)';

  @override
  String get settingsTempF => 'Fahrenheit (°F)';

  @override
  String get settingsCondUnit => 'Leitfähigkeit';

  @override
  String get settingsCondEc => 'EC (mS/cm)';

  @override
  String get settingsCondPpm500 => 'PPM (500)';

  @override
  String get settingsCondPpm700 => 'PPM (700)';

  @override
  String get settingsDangerZone => 'Gefahrenzone';

  @override
  String get settingsResetApp => 'App zurücksetzen';

  @override
  String get settingsResetWarning =>
      'Möchtest du wirklich alle Pflanzen, Logs und Einstellungen löschen? Dies kann nicht rückgängig gemacht werden.';

  @override
  String get settingsCancel => 'Abbrechen';

  @override
  String get settingsDelete => 'Löschen';

  @override
  String get settingsNotifications => 'Benachrichtigungen';

  @override
  String get settingsCheckinFreq => 'Check-in Erinnerungen';

  @override
  String get settingsFreqDaily => 'Täglich';

  @override
  String get settingsFreqEvery2Days => 'Alle 2 Tage';

  @override
  String get settingsFreqWeekly => 'Wöchentlich';

  @override
  String get settingsFreqOff => 'Aus';

  @override
  String get checkinTransitionAutoTitle => 'Beginnt die Blüte?';

  @override
  String get checkinTransitionAutoDesc =>
      'Es bilden sich erste kleine weiße Härchen (Vorblüte / Pistils) an den Blattachseln (Nodien). Zudem beginnt die Pflanze plötzlich stark in die Höhe zu wachsen.\n\nSiehst du diese weißen Härchen an deiner Pflanze?';

  @override
  String get checkinTransitionAutoNo => 'Nein, noch nicht';

  @override
  String get checkinTransitionAutoYes => 'Ja, Blüte hat begonnen';

  @override
  String get checkinTransitionPhotoTitle => 'Zeit für die Blüte?';

  @override
  String get checkinTransitionPhotoDesc =>
      'Cannabis wächst in den ersten 2-3 Wochen der Blüte (dem \'Stretch\') extrem in die Höhe – oft verdoppelt oder verdreifacht sie ihre Größe.\n\nHat die Pflanze ca. 1/3 bis 1/2 des maximal verfügbaren Platzes erreicht und ist gesund?\n\nMöchtest du sie heute in die Blüte schicken?';

  @override
  String get checkinTransitionPhotoNo => 'Nein, sie braucht noch Zeit';

  @override
  String get checkinTransitionPhotoYes => 'Ja, heute wird umgestellt';

  @override
  String get checkinTransitionLightPhotoTitle => 'Die Lichtumstellung (12/12)';

  @override
  String get checkinTransitionLightPhotoDesc =>
      'Um die Blüte auszulösen, musst du deine Zeitschaltuhr heute auf 12 Stunden an / 12 Stunden aus umstellen.\n\nWICHTIG: In den 12 Stunden Dunkelheit darf kein noch so kleines Licht ins Zelt fallen (Störlicht), sonst zwittert die Pflanze.';

  @override
  String get checkinTransitionLightAutoTitle => 'Licht bleibt auf 18/6';

  @override
  String get checkinTransitionLightAutoDesc =>
      'Da es sich um eine Autoflower handelt, musst du an der Zeitschaltuhr nichts ändern. Lass sie auf 18/6 (oder 20/4).\n\nAchte in den nächsten Tagen extrem auf den Lampenabstand, da sie stark in die Höhe wachsen wird.';

  @override
  String get checkinFlowerWaterChangeRecTitle => 'Neues Düngeschema';

  @override
  String get checkinFlowerWaterChangeRecDesc =>
      'Da deine Pflanze nun in die Blütephase übergegangen ist, benötigt sie einen anderen Mix an Nährstoffen (mehr Phosphor/Kalium). Deshalb muss das Wasser heute unbedingt komplett gewechselt werden, bevor der neue Dünger angemischt wird.';

  @override
  String get checkinHarvestTitle => 'Ernte-Check: Trichome & Stigmen';

  @override
  String checkinHarvestDesc(String tip) {
    return 'Prüfe die Blüten. Die feinen Härchen (Stigmen) sollten sich zu 70-90% braun verfärbt haben. Die kleinen Harzdrüsen (Trichome) sollten milchig-trüb bis leicht bernsteinfarben sein.\n\n$tip';
  }

  @override
  String get checkinHarvestTip =>
      'Tipp: Nutze eine Lupe oder ein Taschenmikroskop, um die Trichome zu prüfen.';

  @override
  String get checkinHarvestDeepDiveTitle => 'Warum die Trichome prüfen?';

  @override
  String get checkinHarvestDeepDiveDesc =>
      'Trichome produzieren die Wirkstoffe. Klare Trichome sind unreif. Milchige bedeuten maximalen THC-Gehalt. Bernsteinfarbene sorgen für eine beruhigendere, körperliche Wirkung.';

  @override
  String get checkinHarvestNotReady => 'Noch nicht bereit';

  @override
  String get checkinHarvestReady => 'Bereit für die Ernte';

  @override
  String get checkinFlushTitle => 'Beginn der Spülung (Flushing)';

  @override
  String checkinFlushDesc(String tip) {
    return 'Wir nähern uns der Ernte! Jetzt senken wir den EC-Wert schrittweise. Die Pflanze bekommt weniger Nährstoffe und nutzt ihre eigenen Reserven.\n\n$tip';
  }

  @override
  String get checkinFlushTip =>
      'Tipp: Passe beim nächsten Wasserwechsel deinen Nährstoffplan an und nutze nur noch sehr wenig oder gar keinen Dünger (reines pH-angepasstes Wasser).';

  @override
  String get checkinFlushDeepDiveTitle => 'Warum Spülen?';

  @override
  String get checkinFlushDeepDiveDesc =>
      'Durch das Spülen zwingen wir die Pflanze, im Gewebe gespeicherte Nährstoffe zu verbrauchen. Das verbessert später den Geschmack, Geruch und das Abbrennverhalten der Blüten deutlich. Kratziger Rauch wird vermieden.';

  @override
  String get checkinFlushNext => 'Verstanden';

  @override
  String get checkinAutumnTitle => 'Pflanzengesundheit (Herbsteln)';

  @override
  String checkinAutumnDesc(String tip) {
    return 'Wie sieht deine Pflanze insgesamt aus? Keine Sorge: Gelbe Blätter am Ende der Blüte sind jetzt völlig normal.\n\n$tip';
  }

  @override
  String get checkinAutumnTip =>
      'Tipp: Entferne alte, komplett vertrocknete Blätter, aber lass Blätter dran, die nur leicht gelb sind. Die Pflanze zieht gerade noch Energie aus ihnen.';

  @override
  String get checkinAutumnDeepDiveTitle => 'Der Herbst-Effekt';

  @override
  String get checkinAutumnDeepDiveDesc =>
      'Weil wir den EC-Wert senken und die Pflanze an ihr Lebensende kommt, baut sie Chlorophyll ab. Das führt zu wunderschönen Herbstfarben (Gelb-, Rot- und Lilatöne). Dies ist ein Zeichen, dass das Spülen funktioniert.';

  @override
  String get checkinAutumnLooksGood => 'Sieht gut aus';

  @override
  String get checkinAutumnProblems => 'Ich sehe echte Probleme';

  @override
  String get harvestWizardPrepTitle => 'Die Erntevorbereitung';

  @override
  String get harvestWizardPrepDesc =>
      'Es ist soweit! Bevor wir die Pflanze fällen, bereite deinen Arbeitsplatz vor. Du brauchst eine scharfe, saubere Ernteschere, Einweghandschuhe und Reinigungsalkohol.';

  @override
  String get harvestWizardPrepTip =>
      'Tipp: Das Harz der Blüten klebt extrem. Trage unbedingt Handschuhe und reinige die Schere zwischendurch mit Alkohol.';

  @override
  String get harvestWizardPrepDeepDiveTitle => 'Warum Sauberkeit?';

  @override
  String get harvestWizardPrepDeepDiveDesc =>
      'Eine unsaubere Schere kann Schmutz oder Pilzsporen in die frischen Schnittstellen tragen. Das Harz (Trichome) enthält die gesamten Wirkstoffe – Handschuhe verhindern klebrige Hände.';

  @override
  String get harvestWizardCutTitle => 'Die Pflanze fällen';

  @override
  String get harvestWizardCutDesc =>
      'Schneide die Pflanze am Hauptstamm knapp über dem Topf ab. Hänge sie danach als Ganzes kopfüber auf. Ist sie zu groß, hänge sie Ast für Ast auf.';

  @override
  String get harvestWizardCutTip =>
      'Tipp: Nutze Kleiderbügel, Gartendraht oder ein Trockennetz, um die Äste in deinem Zelt aufzuhängen.';

  @override
  String get harvestWizardCutDeepDiveTitle => 'Warum kopfüber ins Zelt?';

  @override
  String get harvestWizardCutDeepDiveDesc =>
      'Kopfüber trocknen die Pflanzen gleichmäßiger. Das Zelt ist der perfekte Ort dafür, da der Aktivkohlefilter den starken Geruch neutralisiert.';

  @override
  String get harvestWizardTrimTitle => 'Die Blätter entfernen (Trimmen)';

  @override
  String get harvestWizardTrimDesc =>
      'Entferne jetzt alle großen Sonnensegel. Die kleinen harzigen Blätter an den Blüten (Zuckerblätter) lässt du für den Trocknungsprozess am besten dran (Dry Trim).';

  @override
  String get harvestWizardTrimTip =>
      'Tipp: Hebe die harzigen Zuckerblätter später auf! Du kannst daraus nach der Trocknung Tee, Butter oder Extrakte herstellen.';

  @override
  String get harvestWizardTrimDeepDiveTitle => 'Warum Dry Trim?';

  @override
  String get harvestWizardTrimDeepDiveDesc =>
      'Die Blätter legen sich wie ein Schutzmantel um die Blüte. Das verlangsamt die Trocknung, was Geschmack (Terpene) schützt und ein kratziges Raucherlebnis verhindert.';

  @override
  String get harvestWizardDryingTitle => 'Die perfekte Trocknungsumgebung';

  @override
  String get harvestWizardDryingDesc =>
      'Deine Ernte hängt.\n\n• Temperatur: Optimal 18-20°C\n• Luftfeuchtigkeit: 55-60%\n• Licht: Absolute Dunkelheit\n• Umluft: Abluft an, kein direkter Wind';

  @override
  String get harvestWizardDryingTip =>
      'Tipp: Die Trocknung dauert meist 7-14 Tage. Sie sind trocken, wenn kleine Äste beim Biegen mit einem \"Knack\" brechen (Snap-Test).';

  @override
  String get harvestWizardDryingDeepDiveTitle => 'Warum so langsam?';

  @override
  String get harvestWizardDryingDeepDiveDesc =>
      'Zu schnelles Trocknen zerstört feine Aromen und schließt Chlorophyll ein – das schmeckt nach Heu. Geduld ist hier der Schlüssel zu Top-Qualität.';

  @override
  String get harvestWizardFinishBtn => 'Trocknung starten';

  @override
  String get dashboardDryingFinishedBtn =>
      'Trocknung abgeschlossen (Snap-Test)';

  @override
  String get finishWizardTrimTitle => 'Der finale Dry Trim';

  @override
  String get finishWizardTrimDesc =>
      'Die Äste knacken, die Blüten sind trocken! Schneide nun alle verbliebenen, kleinen Zuckerblätter nah an der Blüte ab.';

  @override
  String get finishWizardTrimTip =>
      'Tipp: Halte die Blüte am Stiel fest, um die Harzdrüsen nicht zu zerdrücken.';

  @override
  String get finishWizardTrimDeepDiveTitle => 'Warum jetzt trimmen?';

  @override
  String get finishWizardTrimDeepDiveDesc =>
      'Nach der langsamen Trocknung lassen sich die Zuckerblätter leicht abschneiden. Ohne Blätter schmeckt der Rauch weicher.';

  @override
  String get finishWizardWeighTitle => 'Wiegen & Abschluss';

  @override
  String get finishWizardWeighDesc =>
      'Deine Ernte ist fertig getrimmt! Wiege jetzt deine Ausbeute und trage sie hier ein, um diesen Grow erfolgreich abzuschließen.';

  @override
  String get finishWizardWeighInputLabel => 'Ertrag (in Gramm)';

  @override
  String get finishWizardWeighTip =>
      'Tipp: Das Gewicht der getrockneten Blüten ist etwa 75-80% geringer als direkt nach der Ernte.';

  @override
  String get finishWizardWeighDeepDiveTitle => 'Warum wiegen?';

  @override
  String get finishWizardWeighDeepDiveDesc =>
      'So kannst du bei jedem Grow deine Fortschritte tracken und sehen, ob Anpassungen an Licht oder Nährstoffen einen Unterschied gemacht haben.';

  @override
  String get finishWizardCuringTitle => 'Das Curing (Aushärten)';

  @override
  String get finishWizardCuringDesc =>
      'Pack die Blüten jetzt in luftdichte Gläser (am besten mit 58-62% Feuchtigkeitspack). Öffne die Gläser in den ersten 1-2 Wochen täglich für 15 Minuten.';

  @override
  String get finishWizardCuringTip =>
      'Tipp: Curing verwandelt gutes Gras in absolutes Spitzen-Gras. Es baut letztes Chlorophyll ab.';

  @override
  String get finishWizardCuringDeepDiveTitle => 'Was passiert beim Curing?';

  @override
  String get finishWizardCuringDeepDiveDesc =>
      'Die Restfeuchtigkeit verteilt sich gleichmäßig. Die Terpene (Aromastoffe) werden konserviert und der Abbau von Zuckerstoffen verhindert, dass der Rauch kratzig wird.';

  @override
  String get finishWizardFinishBtn => 'Pflanze archivieren';

  @override
  String get archiveTitle => 'Archiv';

  @override
  String get archiveYield => 'Ertrag';

  @override
  String get archiveDays => 'Tage';

  @override
  String get archiveNoPlants => 'Noch keine archivierten Pflanzen.';
}
