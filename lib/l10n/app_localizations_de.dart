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
      'Willkommen bei deinem DWC-Companion. Vergiss Erde, Schädlinge und Gießkannen. Wir züchten in sprudelndem Wasser – schneller, sauberer und mit massiven Erträgen.';

  @override
  String get onboardingTitle2 => 'Deine tägliche 5-Minuten Routine';

  @override
  String get onboardingText2 =>
      'Kein Vorwissen nötig. Unser täglicher, bilderbasierter Check-In Wizard nimmt dich jeden Tag an die Hand. Er sagt dir genau, wo du hinsehen musst, und schützt dich vor Anfängerfehlern.';

  @override
  String get onboardingTitle3 => 'Nie wieder überdüngen';

  @override
  String get onboardingText3 =>
      'Du gibst nur deine Messwerte (pH/EC) ein – unsere smarte Rezept-Engine berechnet dir wie ein Thermomix exakt auf den Milliliter genau, was du ins Wasser mischen musst.';

  @override
  String get onboardingNextButton => 'Weiter';

  @override
  String get onboardingStartButton => 'Loslegen';

  @override
  String get onboardingFinalTitle => 'Lass uns starten!';

  @override
  String get onboardingFinalText =>
      'Hast du dein Zelt schon aufgebaut, oder brauchst du Hilfe beim Schrauben und Verkabeln?';

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
  String get checkinHealthTitle => 'Pflanzen-Gesundheit';

  @override
  String get checkinHealthDesc =>
      'Schau dir die Pflanze an. Hängen die Blätter extrem schlaff? Gibt es braune Flecken oder rollen sich die Blattspitzen stark ein?';

  @override
  String get checkinHealthNext => 'Sieht gut aus';

  @override
  String get checkinRootsCheckTitle => 'Wurzel-Check';

  @override
  String get checkinRootsCheckDesc => 'Sind die Wurzeln schon im Wasser?';

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
      'Gieße etwas Wasser aus dem Eimer über den Blähton, um die Pflanze zu bewässern. Füge kein zusätzliches Wasser hinzu! Da die Wurzeln noch nicht im Wasser sind, musst du pH und EC noch nicht kontrollieren.';

  @override
  String get checkinAdjustTitle => 'Werte anpassen';

  @override
  String get checkinAdjustDesc =>
      'Hier wird später erklärt, wie du den pH- und EC-Wert richtig anpasst. (Beispiel-Screen)';

  @override
  String get checkinFinishTitle => 'Check-In Abschließen';

  @override
  String get checkinFinishDesc =>
      'Du hast alle Stationen für heute erledigt. Deine Pflanze ist versorgt.';

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
      'Halte die Kamera deines Smartphones auf Höhe der obersten Blätter (Canopy) und richte sie mit einem Diffusor (z. B. 80g Papier) nach oben zur Lampe.';

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
      'Fülle ein kleines Glas mit handwarmem Wasser und lass deinen Samen sanft hineinfallen.';

  @override
  String get germinationNext1 => 'Erledigt & Weiter';

  @override
  String get germinationTitle1b => 'Die Steinwolle & pH-Wert';

  @override
  String get germinationDesc1b =>
      'Fülle ein Gefäß mit Wasser. Miss den pH-Wert mit deinem Gerät oder den Test-Tropfen (Farbskala beachten). Gib tropfenweise pH-Down hinzu, bis der Wert bei etwa 5.5 liegt.\n\nLege deinen Steinwollwürfel hinein. Er muss 24h einweichen!';

  @override
  String get germinationNext1b => 'Steinwolle weicht ein';

  @override
  String get germinationTitle2 => 'Die Dunkelheit';

  @override
  String get germinationDesc2 =>
      'Cannabis-Samen sind Dunkelkeimer. Stelle das Glas an einen warmen, absolut dunklen Ort.';

  @override
  String get germinationNext2 => 'Ab in den Schrank';

  @override
  String get germinationTitle3 => 'Der Warteraum';

  @override
  String get germinationDesc3 =>
      'Lass den Samen nun für 12 bis 24 Stunden im Wasser ruhen. Wir warten darauf, dass sich die Schale öffnet.';

  @override
  String get germinationNext3 => 'Wurzel prüfen';

  @override
  String get germinationTitle4 => 'Der Wurzel-Check';

  @override
  String get germinationDesc4 =>
      'Hol das Glas aus dem Schrank. Ist die Samenschale aufgeplatzt und zeigt sich eine kleine, weiße Wurzelspitze?';

  @override
  String get germinationNext4 => 'Wurzel ist da!';

  @override
  String get germinationAlt4 => 'Noch geschlossen';

  @override
  String get germinationTitle5 => 'Geduld!';

  @override
  String get germinationDesc5 =>
      'Manche Samen brauchen bis zu 48 Stunden. Stelle das Glas wieder in den Schrank und schau morgen noch mal rein.';

  @override
  String get germinationNext5 => 'Wurzel prüfen';

  @override
  String get germinationTitle6 => 'Einzug in die Steinwolle';

  @override
  String get germinationDesc6 =>
      'Setze den Samen etwa 1-2 cm tief in das Pflanzloch deines eingeweichten Steinwollwürfels.\n\nWichtig: Wurzelspitze nach unten!';

  @override
  String get germinationNext6 => 'Samen ist eingepflanzt';

  @override
  String get germinationTitle7 => 'Netztopf & Blähton';

  @override
  String get germinationDesc7 =>
      'Spüle deinen Blähton gut ab. Setze den Steinwollwürfel in den Netztopf und fülle ihn mit Blähton auf.';

  @override
  String get germinationNext7 => 'Im Netztopf gesichert';

  @override
  String get germinationTitle8 => 'Der DWC-Eimer & Klima';

  @override
  String get germinationDesc8 =>
      'Hänge den Netztopf in deinen DWC-Eimer. Fülle den Eimer so weit, dass das Wasser ca. 1-2 cm unter dem Netztopf steht. Die platzenden Blubberblasen befeuchten die Wurzeln.\n\n1. Keine Nährstoffe, nur Wasser (pH 5.8).\n2. Luftpumpe auf 100%.\n3. Abluft und Umluft (leichte Brise) einschalten.';

  @override
  String get germinationNext8 => 'Eimer & Klima bereit';

  @override
  String get germinationTitle9 => 'Das Licht (PPFD)';

  @override
  String get germinationDesc9 =>
      'Sämlinge vertragen nicht viel Licht! Zu viel Licht hemmt das Wachstum extrem.\n\nNutze den eingebauten PPFD-Messer (ca. 150-200 µmol/m²/s). \n\nKlima-Tipp: Ist es im Zelt zu kalt (unter 24°C), hänge die Lampe etwas höher und dreh sie stärker auf, damit sie mehr heizt. Ansonsten dimm sie tief runter und hänge sie nah ran, um Strom zu sparen.';

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
  String get tentTitle1 => 'Station 1: Das Zelt aufstellen';

  @override
  String get tentDesc1 =>
      'Such dir einen ruhigen Ort mit Fenster (für die Abluft). Bau das Metallgerüst auf und zieh die Zelthülle darüber.';

  @override
  String get tentTip1 =>
      'Leg unbedingt die wasserdichte Einlegewanne auf den Zeltboden – bei DWC kann immer mal etwas Wasser tropfen!';

  @override
  String get tentNext1 => 'Zelt steht & ist isoliert';

  @override
  String get tentTitle2 => 'Station 2: AKF & Ventilator';

  @override
  String get tentDesc2 =>
      'Der Aktivkohlefilter (AKF) und der Rohrventilator kommen ganz nach oben ins Zelt. Häng sie mit den mitgelieferten Gurten stabil unter die Decke.';

  @override
  String get tentTip2 =>
      'Achte darauf, dass die Verbindung zwischen AKF und Ventilator absolut luftdicht ist (Panzertape hilft!).';

  @override
  String get tentNext2 => 'Abluft hängt sicher';

  @override
  String get tentTitle3 => 'Station 3: Abluftschlauch';

  @override
  String get tentDesc3 =>
      'Führe den Abluftschlauch vom Ventilator durch eine der oberen Öffnungen nach draußen.';

  @override
  String get tentTip3 =>
      'Die Abluft sollte idealerweise aus dem Raum (z.B. aus dem Fenster) geleitet werden, um die Luftfeuchtigkeit im Zimmer nicht zu stark zu erhöhen.';

  @override
  String get tentNext3 => 'Schlauch verlegt';

  @override
  String get tentTitle4 => 'Station 4: Die LED-Sonne';

  @override
  String get tentDesc4 =>
      'Häng deine LED-Lampe mittig auf. Nutze dafür stufenlos verstellbare Seilzugratschen (Rope Ratchets), damit du die Höhe später einfach anpassen kannst.';

  @override
  String get tentTip4 =>
      'Wenn möglich, montiere das Netzteil (Driver) der Lampe außerhalb des Zeltes, um Hitze im Zelt zu vermeiden.';

  @override
  String get tentNext4 => 'Lampe hängt';

  @override
  String get tentTitle5 => 'Station 5: Frische Brise';

  @override
  String get tentDesc5 =>
      'Befestige deine Umluft-Ventilatoren an den Zeltstangen. Sie sorgen für dicke Stängel und beugen Schimmel vor.';

  @override
  String get tentTip5 =>
      'Richte die Ventilatoren nie direkt auf die kleinen Pflanzen (Windbrand-Gefahr!), sondern lass sie leicht darüber oder gegen die Zeltwand pusten.';

  @override
  String get tentNext5 => 'Ventilatoren montiert';

  @override
  String get tentTitle6 => 'Station 6: DWC-Eimer & Blähton';

  @override
  String get tentDesc6 =>
      'Stell deinen DWC-Eimer mittig unter die Lampe. Setz den Netztopf ein.';

  @override
  String get tentTip6 =>
      'Wasche deinen Blähton VOR der Benutzung extrem gründlich aus, sonst hast du später roten Schlamm im Eimer, der den pH-Wert ruiniert!';

  @override
  String get tentNext6 => 'Eimer positioniert';

  @override
  String get tentTitle7 => 'Station 7: Die Lunge (Luftpumpe)';

  @override
  String get tentDesc7 =>
      'Führe den Luftschlauch von unten ins Zelt zum Ausströmerstein im Eimer.';

  @override
  String get tentTip7 =>
      'WICHTIG: Die Luftpumpe MUSS immer außerhalb des Zeltes stehen und am besten höher als der Wasserspiegel! Fällt der Strom aus, kann das Wasser sonst durch den Schlauch in die Pumpe laufen.';

  @override
  String get tentNext7 => 'Pumpe platziert';

  @override
  String get tentTitle8 => 'Station 8: Strom & Kabel';

  @override
  String get tentDesc8 => 'Verlege alle Kabel sauber nach draußen.';

  @override
  String get tentTip8 =>
      'Wasser und Strom sind Feinde! Leg NIEMALS Mehrfachsteckdosen auf den Zeltboden. Befestige sie sicher außerhalb oder häng sie weit oben auf.';

  @override
  String get tentNext8 => 'Kabel verlegt';

  @override
  String get tentTitle9 => 'Station 9: Zeitschaltuhr & Dauerstrom';

  @override
  String get tentDesc9 =>
      'Die Lampe kommt an die Zeitschaltuhr (noch nicht einstellen).';

  @override
  String get tentTip9 =>
      'Abluft, Umluft und vor allem die Luftpumpe für die Wurzeln laufen IMMER (24/7)! Die Luftpumpe darf niemals ausgeschaltet werden.';

  @override
  String get tentNext9 => 'Alles verkabelt';

  @override
  String get tentTitle10 => 'Station 10: Der finale Test';

  @override
  String get tentDesc10 => 'Mach das Zelt zu und schalte alles an.';

  @override
  String get tentTip10 =>
      'Unterdruck-Check: Ziehen sich die Wände leicht nach innen? Gut! Licht-Check: Mach das Licht im Zimmer aus – dringt irgendwo Licht aus dem Zelt? Klebe es ab!';

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
      'Warum brauche ich das? Ein lichtdichtes Zelt sorgt für das perfekte Klima und schützt vor Störlicht.';

  @override
  String get hw_ledTitle => 'LED-Pflanzenlampe';

  @override
  String get hw_ledDesc =>
      'Warum brauche ich das? Cannabis liebt Licht! Ohne starke Lampe gibt es keine fetten Buds.';

  @override
  String get hw_exhaustTitle => 'Abluft-Ventilator';

  @override
  String get hw_exhaustDesc =>
      'Warum brauche ich das? Erneuert die Luft im Zelt und transportiert Hitze sowie Feuchtigkeit nach draußen.';

  @override
  String get hw_carbon_filterTitle => 'Aktivkohlefilter (AKF)';

  @override
  String get hw_carbon_filterDesc =>
      'Warum brauche ich das? Cannabis stinkt gewaltig. Der Filter neutralisiert den Geruch zu 100%.';

  @override
  String get hw_circulation_fanTitle => 'Umluft-Ventilator';

  @override
  String get hw_circulation_fanDesc =>
      'Warum brauche ich das? Sorgt für dicke Stängel und verhindert Schimmel in den Blüten.';

  @override
  String get hw_thermo_hygroTitle => 'Thermo-/Hygrometer';

  @override
  String get hw_thermo_hygroDesc =>
      'Warum brauche ich das? Zur Überwachung von Temperatur und Luftfeuchtigkeit.';

  @override
  String get hw_humidifierTitle => 'Luftbefeuchter / Entfeuchter';

  @override
  String get hw_humidifierDesc =>
      'Warum brauche ich das? Zur exakten Kontrolle der Luftfeuchtigkeit (VPD).';

  @override
  String get hw_dwc_bucketTitle => 'DWC-Eimer / Wassertank';

  @override
  String get hw_dwc_bucketDesc =>
      'Warum brauche ich das? Das neue Zuhause deiner Wurzeln!';

  @override
  String get hw_net_potTitle => 'Netztopf';

  @override
  String get hw_net_potDesc =>
      'Warum brauche ich das? Hält den Blähton und gibt den Wurzeln Halt.';

  @override
  String get hw_air_pumpTitle => 'Luftpumpe & Ausströmerstein';

  @override
  String get hw_air_pumpDesc =>
      'Warum brauche ich das? Sauerstoff ist Leben! Ohne Blubberblasen ertrinken die Wurzeln.';

  @override
  String get hw_clay_pebblesTitle => 'Blähton';

  @override
  String get hw_clay_pebblesDesc =>
      'Warum brauche ich das? Steriles Medium statt Erde.';

  @override
  String get hw_starter_cubesTitle => 'Anzuchtwürfel';

  @override
  String get hw_starter_cubesDesc =>
      'Warum brauche ich das? Darin keimt dein Samen sicher und stabil.';

  @override
  String get hw_second_bucketTitle => 'Zweiter DWC-Eimer';

  @override
  String get hw_second_bucketDesc =>
      'Warum brauche ich das? Erleichtert den Wasserwechsel enorm.';

  @override
  String get hw_second_bucketProTip =>
      'Pro-Tipp: Für den schnellen 2-Eimer-Wechsel-Trick in der Vegi-Phase.';

  @override
  String get hw_chillerTitle => 'Durchlaufkühler (Water Chiller)';

  @override
  String get hw_chillerDesc =>
      'Warum brauche ich das? Kühlt das Wasser auf perfekte 18-20°C.';

  @override
  String get hw_hydro_nutesTitle => 'Hydrokultur-Dünger';

  @override
  String get hw_hydro_nutesDesc =>
      'Warum brauche ich das? Spezieller Dünger für DWC.';

  @override
  String get hw_ph_dropsTitle => 'pH-Messtropfen oder Gerät';

  @override
  String get hw_ph_dropsDesc =>
      'Warum brauche ich das? Der pH-Wert entscheidet, ob die Pflanze Nährstoffe aufnimmt.';

  @override
  String get hw_ph_dropsProTip =>
      'Pro-Tipp: Billige Stifte sind ungenau, Tropfen sind für Anfänger sicherer.';

  @override
  String get hw_ec_meterTitle => 'EC/TDS-Messgerät';

  @override
  String get hw_ec_meterDesc =>
      'Warum brauche ich das? Zeigt dir genau an, wie viel Dünger im Wasser ist.';

  @override
  String get hw_ph_downTitle => 'pH -';

  @override
  String get hw_ph_downDesc =>
      'Warum brauche ich das? Um den pH-Wert zu senken. Nutze als Stoff z.B. Phosphorsäure, keine organischen Säuren.';

  @override
  String get hw_ph_downProTip =>
      'Pro-Tipp: Phosphorsäure ist stabil und hält den pH-Wert zuverlässig unten.';

  @override
  String get hw_ph_upTitle => 'pH +';

  @override
  String get hw_ph_upDesc =>
      'Warum brauche ich das? Um den pH-Wert zu erhöhen. Nutze als Stoff z.B. Kaliumcarbonat oder Kaliumsilikat.';

  @override
  String get hw_calibration_fluidTitle => 'Kalibrierflüssigkeit';

  @override
  String get hw_calibration_fluidDesc =>
      'Warum brauche ich das? Um deine Messgeräte zu eichen.';

  @override
  String get hw_water_pumpTitle => 'Elektrische Mini-Tauchpumpe';

  @override
  String get hw_water_pumpDesc =>
      'Warum brauche ich das? Pumpt das Wasser aus dem Eimer.';

  @override
  String get hw_water_pumpProTip =>
      'Pro-Tipp: Erleichtert den Wasserwechsel enorm.';

  @override
  String get hw_ro_systemTitle => 'Umkehrosmose-Anlage';

  @override
  String get hw_ro_systemDesc =>
      'Warum brauche ich das? Filtert alle Salze aus dem Leitungswasser.';

  @override
  String get hw_ro_systemProTip =>
      'Pro-Tipp: Bei extrem hartem Leitungswasser.';

  @override
  String get hw_timerTitle => 'Zeitschaltuhr';

  @override
  String get hw_timerDesc =>
      'Warum brauche ich das? Steuert das Licht automatisch (z.B. 18h an, 6h aus).';

  @override
  String get hw_scissorsTitle => 'Ernteschere';

  @override
  String get hw_scissorsDesc =>
      'Warum brauche ich das? Für die Maniküre der Buds.';

  @override
  String get hw_loupeTitle => 'Taschenmikroskop / Lupe';

  @override
  String get hw_loupeDesc =>
      'Warum brauche ich das? Um den perfekten Erntezeitpunkt (Trichome) zu bestimmen.';

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
  String get checkinWaterLevelTitle => 'Wasserstand';

  @override
  String get checkinWaterLevelDesc =>
      'Wie viel Liter Wasser hast du nachgefüllt, um die optimale Füllhöhe wieder zu erreichen?';

  @override
  String get checkinWaterLevelLabel => 'Nachgefüllte Liter';

  @override
  String get checkinWaterLevelSkip => 'Kein Wasser nachgefüllt';

  @override
  String get checkinEcMeasureTitle => 'EC-Wert messen';

  @override
  String get checkinEcMeasureDesc =>
      'Miss den EC-Wert nach dem Auffüllen (bzw. nach dem Wasserwechsel).';

  @override
  String get checkinNutrientTitle => 'Dünger hinzufügen';

  @override
  String get checkinNutrientDesc =>
      'Basierend auf der Wachstumsphase und dem nachgefüllten Wasser solltest du folgende Mengen hinzufügen:';

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
  String get checkinPhAdjustTitle => 'pH-Wert messen & anpassen';

  @override
  String get checkinPhAdjustDesc =>
      'Miss den pH-Wert. Ist er außerhalb von 5.5 - 6.5, korrigiere ihn tröpfchenweise.';

  @override
  String get waterChangeTitle => 'Wasserwechsel';

  @override
  String get waterChangeMethod1Title => 'Methode 1: Tauchpumpe (Empfohlen)';

  @override
  String get waterChangeMethod1Desc =>
      '1. Pumpe das Wasser mit der Minipumpe in einen leeren Eimer ab.\n2. Reinige den Tank kurz, falls nötig.\n3. Fülle mit frischem, temperiertem Leitungswasser auf.';

  @override
  String get waterChangeMethod2Title => 'Methode 2: Zweiter Eimer';

  @override
  String get waterChangeMethod2Desc =>
      '1. Bereite einen zweiten, sauberen Eimer vor.\n2. Hebe den Deckel mitsamt Pflanze hoch und setze ihn auf den zweiten Eimer.\n3. Leere und reinige den Haupttank und fülle ihn frisch auf.\n4. Setze die Pflanze zurück.';

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
      'Warum regelmäßiger Wasserwechsel?';

  @override
  String get checkinDeepDiveWaterChangeRecText =>
      'Pflanzen scheiden Abfallstoffe aus und nicht alle Nährstoffe werden gleichmäßig verbraucht. Dies führt auf Dauer zu einer Ansammlung von unbrauchbaren Salzen, die den pH-Wert destabilisieren und die Nährstoffaufnahme blockieren (Nährstoff-Lockout). Ein wöchentlicher Wasserwechsel ist der beste Schutz gegen fast alle Mangelerscheinungen.';

  @override
  String get checkinDeepDiveWaterLevelTitle => 'Die richtige Füllhöhe';

  @override
  String get checkinDeepDiveWaterLevelText =>
      'In der DWC-Methode ist es extrem wichtig, dass immer ein Luftspalt zwischen dem Wasser und dem Netztopf bleibt, sobald die Wurzeln im Wasser hängen. Die platzenden Blasen der Luftpumpe befeuchten die oberen Wurzeln (die sogenannten Luftwurzeln), welche Sauerstoff aufnehmen. Steht das Wasser zu hoch, ertrinkt die Pflanze.';

  @override
  String get checkinDeepDiveEcMeasureTitle => 'EC-Wert verstehen';

  @override
  String get checkinDeepDiveEcMeasureText =>
      'EC (Electrical Conductivity) misst die elektrische Leitfähigkeit deines Wassers, die durch gelöste Salze (also deinen Dünger) entsteht. Er sagt dir, wie stark konzentriert deine Nährlösung ist. Ohne Messung weißt du nie, ob deine Pflanze hungert oder kurz vor der Überdüngung steht.';

  @override
  String get checkinDeepDiveEcAdjustTitle => 'Dünger richtig anpassen';

  @override
  String get checkinDeepDiveEcAdjustText =>
      'Wenn der EC-Wert sinkt, hat die Pflanze mehr Dünger als Wasser verbraucht (sie hat Hunger). Wenn er steigt, trinkt sie mehr Wasser als Dünger (Überdüngungsgefahr!). Wir fügen nur Dünger für das frisch hinzugefügte Wasser hinzu, um die Balance im Tank zu halten.';

  @override
  String get checkinDeepDivePhMeasureTitle =>
      'Warum der pH-Wert alles entscheidet';

  @override
  String get checkinDeepDivePhMeasureText =>
      'Cannabis kann Nährstoffe nur in einem bestimmten pH-Bereich aufnehmen. In DWC/Hydroponik liegt dieser Sweet Spot zwischen 5.5 und 6.5. Ist der Wert falsch, kannst du so viel düngen wie du willst – die Pflanze verhungert bei vollem Magen (Nutrient Lockout).';

  @override
  String get checkinDeepDivePhAdjustTitle => 'pH-Wert langsam anpassen';

  @override
  String get checkinDeepDivePhAdjustText =>
      'Gute pH-Regulatoren (pH Down) bestehen meist aus starken Säuren wie Phosphorsäure. Gib immer nur winzige Mengen (Tropfen) ins Wasser, rühre gut um und warte kurz, bevor du erneut misst. Zu starke Schwankungen schocken die Wurzeln.';

  @override
  String get checkinDeepDiveRootsCheckTitle => 'Das Warten auf die Wurzeln';

  @override
  String get checkinDeepDiveRootsCheckText =>
      'In den ersten Tagen reicht die Feuchtigkeit der Steinwolle. Die Wurzeln wachsen auf der Suche nach Wasser nach unten. Sobald die erste Wurzel durch den Netztopf ins Wasser hängt, explodiert das Wachstum und die Pflanze versorgt sich fast von selbst.';

  @override
  String get checkinDeepDiveTopWateringTitle => 'Vorsichtiges Angießen';

  @override
  String get checkinDeepDiveTopWateringText =>
      'Solange die Wurzeln das Wasserreservoir noch nicht erreicht haben, kann die Pflanze von unten vertrocknen. Durch leichtes Gießen von oben (Top Feeding) hilfst du ihr, bis sie das Wasser selbst erreicht. Verwende dabei nur das Wasser aus dem Eimer.';

  @override
  String get checkinDeepDiveLampTitle => 'Das Licht als Motor';

  @override
  String get checkinDeepDiveLampText =>
      'Licht ist für die Photosynthese der Motor, der das Wasser und die Nährstoffe verarbeitet. Hängt die Lampe zu nah, verbrennen die Blätter (Lichtstress). Hängt sie zu weit weg, spargelt die Pflanze (wird lang und dünn). Nutze die PPFD-Messung für den perfekten Abstand.';

  @override
  String get checkinDeepDiveHealthTitle => 'Tägliche Sichtkontrolle';

  @override
  String get checkinDeepDiveHealthText =>
      'Der Blick auf die Blätter verrät alles. Hängen sie schlaff? Meistens Sauerstoffmangel im Wasser (Pumpe prüfen!). Werden sie gelb oder haben Flecken? Fast immer ein falscher pH-Wert oder ein Nährstoffproblem. Rollen sich die Ränder nach oben? Hitzestress!';

  @override
  String get checkinDeepDiveFinishTitle => 'Routine ist alles';

  @override
  String get checkinDeepDiveFinishText =>
      'Das wichtigste bei DWC ist Beständigkeit. Durch den täglichen, schnellen Check-In fängst du kleine Probleme (wie einen driftenden pH-Wert) ab, bevor sie zu großen Problemen für deine Pflanze werden.';

  @override
  String get germinationDeepDive1Title => 'Warum das Wasserglas?';

  @override
  String get germinationDeepDive1Text =>
      'Das Einweichen in handwarmem Wasser simuliert den ersten Frühlingsregen. Die harte Schale des Samens saugt sich voll Wasser, weicht auf und signalisiert dem Keimling im Inneren, dass es Zeit ist, aufzuwachen. Lass den Samen nicht länger als 24 Stunden im Wasser, sonst ertrinkt er, da er Sauerstoff braucht.';

  @override
  String get germinationDeepDive1bTitle => 'Steinwolle und pH-Wert';

  @override
  String get germinationDeepDive1bText =>
      'Steinwolle ist von Natur aus basisch (hoher pH-Wert). Wenn du sie nicht in pH-reguliertem Wasser (ca. 5.5) einweichst, kann sie später den pH-Wert deines gesamten Eimers nach oben ziehen und die Wurzelentwicklung deines Sämlings stören. Lass sie gut vollsaugen!';

  @override
  String get germinationDeepDive2Title => 'Die Dunkelheit';

  @override
  String get germinationDeepDive2Text =>
      'Cannabiswurzeln und -samen hassen Licht. In der Natur keimen sie unter der Erde im absoluten Dunkeln. Licht kann in diesem frühen Stadium den Hormonhaushalt des Samens stören und die Keimung komplett stoppen.';

  @override
  String get germinationDeepDive3Title => 'Wunder der Natur';

  @override
  String get germinationDeepDive3Text =>
      'Im Inneren des Samens passiert gerade Folgendes: Das Wasser aktiviert Enzyme, die die gespeicherte Stärke in Zucker umwandeln. Dieser Zucker liefert die Energie für das erste Zellwachstum. Die Wurzelspitze (Pfahlwurzel) drückt von innen gegen die Schale.';

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
      'Steinwolle bietet das perfekte Verhältnis von Wasserhaltung und Sauerstoff für kleine Sämlinge. Wenn du den Samen einsetzt, muss die Wurzel nach unten zeigen, da sie der Schwerkraft folgt (Geotropismus). Der Keimling wächst dann der Schwerkraft entgegen nach oben.';

  @override
  String get germinationDeepDive7Title => 'Blähton Vorbereitung';

  @override
  String get germinationDeepDive7Text =>
      'Der Blähton dient nur zur Stabilisierung des Steinwollwürfels und blockiert Licht, damit keine Algen im Wasser wachsen. Er ist an sich komplett nährstofffrei. Es ist extrem wichtig, ihn vorher abzuwaschen, da der rote Staub sonst in deinen Eimer gespült wird und deine Pumpen verstopfen kann.';

  @override
  String get germinationDeepDive8Title => 'DWC Prinzip für Anfänger';

  @override
  String get germinationDeepDive8Text =>
      'Beim Deep Water Culture (DWC) hängen die Wurzeln in einer hochgradig mit Sauerstoff angereicherten Nährlösung. Dadurch verbrennt die Pflanze weniger Energie bei der Wurzelbildung und steckt diese stattdessen ins Wachstum der Blätter und Blüten. Deshalb wachsen DWC-Pflanzen oft viel schneller als auf Erde.';

  @override
  String get germinationDeepDive9Title => 'PPFD und junge Pflanzen';

  @override
  String get germinationDeepDive9Text =>
      'PPFD (Photosynthetic Photon Flux Density) misst, wie viele Lichtteilchen tatsächlich auf den Blättern ankommen. Ein Sämling hat noch kaum Blätter und kann mit extrem viel Licht (hoher PPFD) nichts anfangen. Zu viel Licht führt zu Lichtstress, was den Sämling bleicht, das Wachstum stoppt oder ihn sogar abtötet.';

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
      'Verbrannte, braune und knusprige Blattspitzen. Die Verfärbung breitet sich von den Rändern nach innen aus.';

  @override
  String get problemNutrientBurnTriggers =>
      'Der EC-Wert im Wasser ist zu hoch. Die Pflanze verdunstet mehr Wasser als sie Salze aufnimmt, wodurch sich Dünger in den Blattspitzen ansammelt.';

  @override
  String get problemNutrientBurnSolution =>
      'Wechsle das Wasser komplett aus oder pumpe die Hälfte ab und fülle ungedüngtes, ph-reguliertes Wasser nach, um den EC-Wert zu senken.';

  @override
  String get problemNutrientBurnPrevention =>
      'Mische den Dünger exakt nach Schema. Wenn die Spitzen anfangen leicht hell zu werden (Nutrient Tip Burn), senke den Ziel-EC beim nächsten Tankwechsel leicht ab.';

  @override
  String get problemPhImbalanceName => 'pH-Wert Schwankung';

  @override
  String get problemPhImbalanceSymptoms =>
      'Verdrehte oder wellige Blätter, gelbe und braune Flecken, die oft aussehen wie ein Kalzium-Mangel. Das Wachstum stagniert.';

  @override
  String get problemPhImbalanceTriggers =>
      'Der pH-Wert liegt dauerhaft außerhalb des optimalen Bereichs (5.5 - 6.5). Dadurch können bestimmte Nährstoffe nicht mehr aufgenommen werden (Nährstoffsperre).';

  @override
  String get problemPhImbalanceSolution =>
      'Kontrolliere und korrigiere den pH-Wert sofort. Ist der Tank alt, wechsle das Wasser komplett, da alte Nährstoffe den pH-Wert unstabil machen.';

  @override
  String get problemPhImbalancePrevention =>
      'Prüfe den pH-Wert täglich beim Check-In. Wechsle das Wasser strikt jede Woche, da alte Nährstofflösungen ihren Puffer verlieren.';

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
      'Laufen deine Umluft-Ventilatoren und sind sie richtig positioniert?';

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
}
