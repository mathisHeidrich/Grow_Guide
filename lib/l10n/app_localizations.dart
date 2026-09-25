import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('de')];

  /// No description provided for @appTitle.
  ///
  /// In de, this message translates to:
  /// **'Grow Guide'**
  String get appTitle;

  /// No description provided for @generalUnderstood.
  ///
  /// In de, this message translates to:
  /// **'Verstanden'**
  String get generalUnderstood;

  /// No description provided for @generalOk.
  ///
  /// In de, this message translates to:
  /// **'OK'**
  String get generalOk;

  /// No description provided for @onboardingTitle1.
  ///
  /// In de, this message translates to:
  /// **'Growen ohne Erde. Ohne Raten.'**
  String get onboardingTitle1;

  /// No description provided for @onboardingText1.
  ///
  /// In de, this message translates to:
  /// **'Willkommen bei deinem DWC-Companion. Vergiss Erde, Schädlinge und Gießkannen. Wir züchten in sprudelndem Wasser. Das bedeutet für dich: sauberes Arbeiten, kontrollierbares Wachstum und maximale Erträge.'**
  String get onboardingText1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In de, this message translates to:
  /// **'Fünf Minuten am Tag.'**
  String get onboardingTitle2;

  /// No description provided for @onboardingText2.
  ///
  /// In de, this message translates to:
  /// **'Du benötigst kein Vorwissen. Der tägliche Check-In nimmt dich jeden Tag an die Hand. Er zeigt dir exakt, was du prüfen musst, und bewahrt dich vor typischen Anfängerfehlern. Konstanz ist hier dein wichtigstes Werkzeug.'**
  String get onboardingText2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In de, this message translates to:
  /// **'Schluss mit der Überdüngung.'**
  String get onboardingTitle3;

  /// No description provided for @onboardingText3.
  ///
  /// In de, this message translates to:
  /// **'Du misst lediglich deinen pH- und EC-Wert. Unser System berechnet im Hintergrund auf den Milliliter genau, was deine Pflanze heute benötigt. Kein Rätselraten bei den Düngeschemata mehr.'**
  String get onboardingText3;

  /// No description provided for @onboardingNextButton.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get onboardingNextButton;

  /// No description provided for @onboardingStartButton.
  ///
  /// In de, this message translates to:
  /// **'Loslegen'**
  String get onboardingStartButton;

  /// No description provided for @onboardingFinalTitle.
  ///
  /// In de, this message translates to:
  /// **'Bereit für den Start.'**
  String get onboardingFinalTitle;

  /// No description provided for @onboardingFinalText.
  ///
  /// In de, this message translates to:
  /// **'Bevor wir deinen ersten Samen keimen lassen, müssen wir sicherstellen, dass deine Hardware bereit ist. Steht dein Zelt bereits komplett fertig, oder sollen wir den Aufbau gemeinsam Schritt für Schritt durchgehen?'**
  String get onboardingFinalText;

  /// No description provided for @onboardingTentSetupButton.
  ///
  /// In de, this message translates to:
  /// **'Zelt gemeinsam aufbauen'**
  String get onboardingTentSetupButton;

  /// No description provided for @onboardingDashboardButton.
  ///
  /// In de, this message translates to:
  /// **'Zelt steht! Zum Dashboard'**
  String get onboardingDashboardButton;

  /// No description provided for @dashboardTitle.
  ///
  /// In de, this message translates to:
  /// **'Meine DWC Pflanzen'**
  String get dashboardTitle;

  /// No description provided for @dashboardEmptyTitle.
  ///
  /// In de, this message translates to:
  /// **'Dein Zelt ist leer.'**
  String get dashboardEmptyTitle;

  /// No description provided for @dashboardEmptyText.
  ///
  /// In de, this message translates to:
  /// **'Drücke das + um eine Pflanze hinzuzufügen.'**
  String get dashboardEmptyText;

  /// No description provided for @dashboardArchiveButtonCenter.
  ///
  /// In de, this message translates to:
  /// **'Ernte-Archiv ansehen ({count} erfolgreiche Grows)'**
  String dashboardArchiveButtonCenter(int count);

  /// No description provided for @dashboardArchiveButton.
  ///
  /// In de, this message translates to:
  /// **'Ernte-Archiv ({count} Grows)'**
  String dashboardArchiveButton(int count);

  /// No description provided for @plantStatusCheckOk.
  ///
  /// In de, this message translates to:
  /// **'Check ok'**
  String get plantStatusCheckOk;

  /// No description provided for @plantStatusCheckUrgent.
  ///
  /// In de, this message translates to:
  /// **'Check dringend nötig'**
  String get plantStatusCheckUrgent;

  /// No description provided for @plantStatusCheckRecommended.
  ///
  /// In de, this message translates to:
  /// **'Check-in empfohlen'**
  String get plantStatusCheckRecommended;

  /// No description provided for @plantStatusFirstCheckNeeded.
  ///
  /// In de, this message translates to:
  /// **'Erster Check nötig'**
  String get plantStatusFirstCheckNeeded;

  /// No description provided for @dashboardStartGermination.
  ///
  /// In de, this message translates to:
  /// **'Keimung starten'**
  String get dashboardStartGermination;

  /// No description provided for @dashboardWaitGermination.
  ///
  /// In de, this message translates to:
  /// **'Warten (12-24h)'**
  String get dashboardWaitGermination;

  /// No description provided for @dashboardCheckRoot.
  ///
  /// In de, this message translates to:
  /// **'Wurzel prüfen'**
  String get dashboardCheckRoot;

  /// No description provided for @phaseOnboarding.
  ///
  /// In de, this message translates to:
  /// **'Onboarding'**
  String get phaseOnboarding;

  /// No description provided for @phaseGermination.
  ///
  /// In de, this message translates to:
  /// **'Keimung'**
  String get phaseGermination;

  /// No description provided for @phaseVeg.
  ///
  /// In de, this message translates to:
  /// **'Wachstum (Tag {day})'**
  String phaseVeg(int day);

  /// No description provided for @phaseFlower.
  ///
  /// In de, this message translates to:
  /// **'Blüte (Tag {day})'**
  String phaseFlower(int day);

  /// No description provided for @phaseDrying.
  ///
  /// In de, this message translates to:
  /// **'Trocknung'**
  String get phaseDrying;

  /// No description provided for @phaseCuring.
  ///
  /// In de, this message translates to:
  /// **'Curing'**
  String get phaseCuring;

  /// No description provided for @phaseArchived.
  ///
  /// In de, this message translates to:
  /// **'Archiviert'**
  String get phaseArchived;

  /// No description provided for @lastCheckNever.
  ///
  /// In de, this message translates to:
  /// **'Letzter Check: Nie'**
  String get lastCheckNever;

  /// No description provided for @lastCheckToday.
  ///
  /// In de, this message translates to:
  /// **'Letzter Check: heute'**
  String get lastCheckToday;

  /// No description provided for @lastCheckYesterday.
  ///
  /// In de, this message translates to:
  /// **'Letzter Check: gestern'**
  String get lastCheckYesterday;

  /// No description provided for @lastCheckDaysAgo.
  ///
  /// In de, this message translates to:
  /// **'Letzter Check: vor {days} Tagen'**
  String lastCheckDaysAgo(int days);

  /// No description provided for @plantBucketText.
  ///
  /// In de, this message translates to:
  /// **'{name} • {liters} L Eimer'**
  String plantBucketText(String name, int liters);

  /// No description provided for @addPlantTitle.
  ///
  /// In de, this message translates to:
  /// **'Neue Pflanze anlegen'**
  String get addPlantTitle;

  /// No description provided for @addPlantSection1.
  ///
  /// In de, this message translates to:
  /// **'1. Pflanzenname / Eimerbezeichnung'**
  String get addPlantSection1;

  /// No description provided for @addPlantNameLabel.
  ///
  /// In de, this message translates to:
  /// **'Name deiner Pflanze oder des Eimers'**
  String get addPlantNameLabel;

  /// No description provided for @addPlantRequired.
  ///
  /// In de, this message translates to:
  /// **'Pflichtfeld'**
  String get addPlantRequired;

  /// No description provided for @addPlantSection2.
  ///
  /// In de, this message translates to:
  /// **'2. Reservoirvolumen (in Litern)'**
  String get addPlantSection2;

  /// No description provided for @addPlantVolumeDesc.
  ///
  /// In de, this message translates to:
  /// **'Wie viel Liter Wasser fasst dein Eimer im Betrieb?'**
  String get addPlantVolumeDesc;

  /// No description provided for @addPlantCustomLiters.
  ///
  /// In de, this message translates to:
  /// **'Individuell (z.B. 18.5 L)'**
  String get addPlantCustomLiters;

  /// No description provided for @addPlantSection3.
  ///
  /// In de, this message translates to:
  /// **'3. Wahl der Düngermarke'**
  String get addPlantSection3;

  /// No description provided for @addPlantBrandDesc.
  ///
  /// In de, this message translates to:
  /// **'Welche Nährstofflinie nutzt du für diese Pflanze?'**
  String get addPlantBrandDesc;

  /// No description provided for @addPlantSection4.
  ///
  /// In de, this message translates to:
  /// **'4. Pflanzen-Genetik'**
  String get addPlantSection4;

  /// No description provided for @addPlantTypeDesc.
  ///
  /// In de, this message translates to:
  /// **'Um welchen Pflanzentyp handelt es sich?'**
  String get addPlantTypeDesc;

  /// No description provided for @addPlantTypePhoto.
  ///
  /// In de, this message translates to:
  /// **'Photo (Photoperiodisch)'**
  String get addPlantTypePhoto;

  /// No description provided for @addPlantTypeAuto.
  ///
  /// In de, this message translates to:
  /// **'Auto (Autoflowering)'**
  String get addPlantTypeAuto;

  /// No description provided for @addPlantSection5.
  ///
  /// In de, this message translates to:
  /// **'5. Beleuchtungs- & Lampen-Daten'**
  String get addPlantSection5;

  /// No description provided for @addPlantLampDesc.
  ///
  /// In de, this message translates to:
  /// **'Deine Beleuchtungs-Daten (für exakte Abstandsempfehlungen)'**
  String get addPlantLampDesc;

  /// No description provided for @addPlantLampType.
  ///
  /// In de, this message translates to:
  /// **'Lampentyp:'**
  String get addPlantLampType;

  /// No description provided for @addPlantLampWattage.
  ///
  /// In de, this message translates to:
  /// **'Wattzahl:'**
  String get addPlantLampWattage;

  /// No description provided for @addPlantLampCustomWattage.
  ///
  /// In de, this message translates to:
  /// **'Individuell (z.B. 240 W)'**
  String get addPlantLampCustomWattage;

  /// No description provided for @addPlantLampCount.
  ///
  /// In de, this message translates to:
  /// **'Anzahl Pflanzen unter Lampe:'**
  String get addPlantLampCount;

  /// No description provided for @addPlantLampCustomCount.
  ///
  /// In de, this message translates to:
  /// **'Individuell (z.B. 6)'**
  String get addPlantLampCustomCount;

  /// No description provided for @addPlantSection6.
  ///
  /// In de, this message translates to:
  /// **'6. Aktueller Start-Stand & Tag'**
  String get addPlantSection6;

  /// No description provided for @addPlantPhaseDesc.
  ///
  /// In de, this message translates to:
  /// **'In welcher Phase & an welchem Tag befindet sich die Pflanze heute?'**
  String get addPlantPhaseDesc;

  /// No description provided for @addPlantPhaseGermination.
  ///
  /// In de, this message translates to:
  /// **'Samen'**
  String get addPlantPhaseGermination;

  /// No description provided for @addPlantPhaseVeg.
  ///
  /// In de, this message translates to:
  /// **'Vegetation'**
  String get addPlantPhaseVeg;

  /// No description provided for @addPlantPhaseFlower.
  ///
  /// In de, this message translates to:
  /// **'Blüte'**
  String get addPlantPhaseFlower;

  /// No description provided for @addPlantCurrentDay.
  ///
  /// In de, this message translates to:
  /// **'Aktueller Tag in dieser Phase (z.B. 1)'**
  String get addPlantCurrentDay;

  /// No description provided for @addPlantSubmit.
  ///
  /// In de, this message translates to:
  /// **'Pflanze im Dashboard anlegen'**
  String get addPlantSubmit;

  /// No description provided for @checkinHealthTitle.
  ///
  /// In de, this message translates to:
  /// **'Gesundheits-Check'**
  String get checkinHealthTitle;

  /// No description provided for @checkinHealthDesc.
  ///
  /// In de, this message translates to:
  /// **'• Wirf einen genauen Blick auf die Blätter deiner Pflanze.\n• Achte auf schlaff hängende Blätter, braune Flecken oder stark nach oben eingerollte Ränder.\n\nTIPP: Wenn die Blätter minimal nach oben zeigen (\'Praying Leaves\'), ist die Pflanze extrem glücklich.'**
  String get checkinHealthDesc;

  /// No description provided for @checkinHealthNext.
  ///
  /// In de, this message translates to:
  /// **'Sieht gut aus'**
  String get checkinHealthNext;

  /// No description provided for @checkinRootsCheckTitle.
  ///
  /// In de, this message translates to:
  /// **'Suchen nach Wurzeln'**
  String get checkinRootsCheckTitle;

  /// No description provided for @checkinRootsCheckDesc.
  ///
  /// In de, this message translates to:
  /// **'• Hebe den Netztopf leicht an.\n• Hängen bereits weiße Wurzeln unten aus dem Netztopf heraus in Richtung Wasser?'**
  String get checkinRootsCheckDesc;

  /// No description provided for @checkinRootsCheckYes.
  ///
  /// In de, this message translates to:
  /// **'Ja'**
  String get checkinRootsCheckYes;

  /// No description provided for @checkinRootsCheckNo.
  ///
  /// In de, this message translates to:
  /// **'Nein'**
  String get checkinRootsCheckNo;

  /// No description provided for @checkinNext.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get checkinNext;

  /// No description provided for @checkinWateringTitle.
  ///
  /// In de, this message translates to:
  /// **'Von oben gießen'**
  String get checkinWateringTitle;

  /// No description provided for @checkinWateringDesc.
  ///
  /// In de, this message translates to:
  /// **'• Da die Wurzeln das Wasser noch nicht erreicht haben, helfe etwas nach.\n• Nimm einen kleinen Becher und gieße etwas Wasser *aus dem Eimer* vorsichtig um den Stamm über den Blähton.\n\nTIPP: Nutze ausschließlich das Wasser, das ohnehin schon im Eimer ist. Füge kein neues Wasser von außen hinzu.'**
  String get checkinWateringDesc;

  /// No description provided for @checkinAdjustTitle.
  ///
  /// In de, this message translates to:
  /// **'Werte anpassen'**
  String get checkinAdjustTitle;

  /// No description provided for @checkinAdjustDesc.
  ///
  /// In de, this message translates to:
  /// **'Hier wird später erklärt, wie du den pH- und EC-Wert richtig anpasst. (Beispiel-Screen)'**
  String get checkinAdjustDesc;

  /// No description provided for @checkinFinishTitle.
  ///
  /// In de, this message translates to:
  /// **'Alles erledigt.'**
  String get checkinFinishTitle;

  /// No description provided for @checkinFinishDesc.
  ///
  /// In de, this message translates to:
  /// **'• Du hast alle wichtigen Parameter geprüft.\n• Dein Zelt ist nun wieder sicher für die nächsten 24 Stunden.\n• Klicke auf Speichern, um deine Werte im Logbuch zu sichern.'**
  String get checkinFinishDesc;

  /// No description provided for @checkinFinishNext.
  ///
  /// In de, this message translates to:
  /// **'Check-In Speichern'**
  String get checkinFinishNext;

  /// No description provided for @checkinMeasureTitle.
  ///
  /// In de, this message translates to:
  /// **'Messwerte eintragen'**
  String get checkinMeasureTitle;

  /// No description provided for @checkinPhLabel.
  ///
  /// In de, this message translates to:
  /// **'pH-Wert (z.B. 5.8)'**
  String get checkinPhLabel;

  /// No description provided for @checkinEcLabel.
  ///
  /// In de, this message translates to:
  /// **'EC-Wert (z.B. 1.2)'**
  String get checkinEcLabel;

  /// No description provided for @checkinBack.
  ///
  /// In de, this message translates to:
  /// **'Zurück'**
  String get checkinBack;

  /// No description provided for @checkinSaveValues.
  ///
  /// In de, this message translates to:
  /// **'Werte speichern'**
  String get checkinSaveValues;

  /// No description provided for @checkinValuesRequired.
  ///
  /// In de, this message translates to:
  /// **'Bitte Werte eintragen'**
  String get checkinValuesRequired;

  /// No description provided for @checkinLampTitle.
  ///
  /// In de, this message translates to:
  /// **'Lampenabstand prüfen'**
  String get checkinLampTitle;

  /// No description provided for @checkinLampMeasureInstruction.
  ///
  /// In de, this message translates to:
  /// **'• Die Pflanze wächst jeden Tag näher an die Lampe heran.\n• Lege ein Stück Papier (80g) als Diffusor über die Frontkamera.\n• Halte das Handy genau auf Höhe der obersten Blätter und richte es zur Lampe.\n\nTIPP: Nutze immer Papier als Diffusor, sonst sind die Werte völlig unbrauchbar.'**
  String get checkinLampMeasureInstruction;

  /// No description provided for @checkinLampTargetPpfdLabel.
  ///
  /// In de, this message translates to:
  /// **'Zielbereich'**
  String get checkinLampTargetPpfdLabel;

  /// No description provided for @checkinMeasurePpfd.
  ///
  /// In de, this message translates to:
  /// **'PPFD Messen'**
  String get checkinMeasurePpfd;

  /// No description provided for @checkinMeasurePpfdAgain.
  ///
  /// In de, this message translates to:
  /// **'Neu Messen (PPFD: {ppfd})'**
  String checkinMeasurePpfdAgain(String ppfd);

  /// No description provided for @checkinLampNext.
  ///
  /// In de, this message translates to:
  /// **'Abstand passt'**
  String get checkinLampNext;

  /// No description provided for @germinationTitle1.
  ///
  /// In de, this message translates to:
  /// **'Das Wasserglas'**
  String get germinationTitle1;

  /// No description provided for @germinationDesc1.
  ///
  /// In de, this message translates to:
  /// **'• Fülle ein kleines Glas mit handwarmem Wasser.\n• Lass deinen Samen sanft hineinfallen. Er wird zunächst an der Oberfläche schwimmen.\n\nTIPP: Berühre den Samen so wenig wie möglich mit den Fingern. Nutze eine Pinzette.'**
  String get germinationDesc1;

  /// No description provided for @germinationNext1.
  ///
  /// In de, this message translates to:
  /// **'Erledigt & Weiter'**
  String get germinationNext1;

  /// No description provided for @germinationTitle1b.
  ///
  /// In de, this message translates to:
  /// **'Steinwolle & pH-Wert'**
  String get germinationTitle1b;

  /// No description provided for @germinationDesc1b.
  ///
  /// In de, this message translates to:
  /// **'• Fülle eine Schüssel mit Wasser und miss den pH-Wert.\n• Senke den pH-Wert mit pH-Down tröpfchenweise auf etwa 5.5 ab.\n• Lege deinen Steinwollwürfel hinein und lass ihn mindestens 12 Stunden einweichen.\n\nTIPP: Drücke die Steinwolle niemals wie einen Schwamm aus. Das zerstört ihre innere Struktur.'**
  String get germinationDesc1b;

  /// No description provided for @germinationNext1b.
  ///
  /// In de, this message translates to:
  /// **'Steinwolle weicht ein'**
  String get germinationNext1b;

  /// No description provided for @germinationTitle2.
  ///
  /// In de, this message translates to:
  /// **'Die Dunkelheit'**
  String get germinationTitle2;

  /// No description provided for @germinationDesc2.
  ///
  /// In de, this message translates to:
  /// **'• Stelle das Wasserglas an einen warmen (ca. 22-25°C), absolut dunklen Ort.\n• Ein Küchenschrank eignet sich hierfür hervorragend.\n\nTIPP: Markiere das Glas, damit niemand aus Versehen das Wasser wegschüttet.'**
  String get germinationDesc2;

  /// No description provided for @germinationNext2.
  ///
  /// In de, this message translates to:
  /// **'Ab in den Schrank'**
  String get germinationNext2;

  /// No description provided for @germinationTitle3.
  ///
  /// In de, this message translates to:
  /// **'Warten und Prüfen'**
  String get germinationTitle3;

  /// No description provided for @germinationDesc3.
  ///
  /// In de, this message translates to:
  /// **'• Lass den Samen nun für 12 bis 24 Stunden im Glas ruhen.\n• Hol das Glas aus dem Schrank und prüfe vorsichtig: Ist die Samenschale leicht aufgeplatzt und zeigt sich eine kleine, weiße Wurzelspitze?'**
  String get germinationDesc3;

  /// No description provided for @germinationNext3.
  ///
  /// In de, this message translates to:
  /// **'Wurzel prüfen'**
  String get germinationNext3;

  /// No description provided for @germinationTitle4.
  ///
  /// In de, this message translates to:
  /// **'Noch geschlossen'**
  String get germinationTitle4;

  /// No description provided for @germinationDesc4.
  ///
  /// In de, this message translates to:
  /// **'• Der Samen ist noch komplett geschlossen.\n• Gib ihm noch etwas Zeit im Dunkeln.\n\nTIPP: Manche Samen benötigen bis zu 48 oder 72 Stunden. Geduld ist jetzt wichtig.'**
  String get germinationDesc4;

  /// No description provided for @germinationNext4.
  ///
  /// In de, this message translates to:
  /// **'Wurzel ist da!'**
  String get germinationNext4;

  /// No description provided for @germinationAlt4.
  ///
  /// In de, this message translates to:
  /// **'Noch geschlossen'**
  String get germinationAlt4;

  /// No description provided for @germinationTitle5.
  ///
  /// In de, this message translates to:
  /// **'Geduld!'**
  String get germinationTitle5;

  /// No description provided for @germinationDesc5.
  ///
  /// In de, this message translates to:
  /// **'• Der Samen ist noch komplett geschlossen.\n• Gib ihm noch etwas Zeit im Dunkeln.\n\nTIPP: Manche Samen benötigen bis zu 48 oder 72 Stunden. Geduld ist jetzt wichtig.'**
  String get germinationDesc5;

  /// No description provided for @germinationNext5.
  ///
  /// In de, this message translates to:
  /// **'Wurzel prüfen'**
  String get germinationNext5;

  /// No description provided for @germinationTitle6.
  ///
  /// In de, this message translates to:
  /// **'Einzug in die Steinwolle'**
  String get germinationTitle6;

  /// No description provided for @germinationDesc6.
  ///
  /// In de, this message translates to:
  /// **'• Nimm den eingeweichten Steinwollwürfel aus dem Wasser.\n• Setze den Samen etwa 1 bis 2 cm tief in das Loch des Würfels.\n• WICHTIG: Die weiße Wurzelspitze muss strikt nach unten zeigen.\n\nTIPP: Verschließe das Loch oben ganz leicht, indem du ein winziges Stückchen Steinwolle vom Rand darüber zupfst. So bleibt es innen dunkel.'**
  String get germinationDesc6;

  /// No description provided for @germinationNext6.
  ///
  /// In de, this message translates to:
  /// **'Samen ist eingepflanzt'**
  String get germinationNext6;

  /// No description provided for @germinationTitle7.
  ///
  /// In de, this message translates to:
  /// **'Vorbereitung des Netztopfs'**
  String get germinationTitle7;

  /// No description provided for @germinationDesc7.
  ///
  /// In de, this message translates to:
  /// **'• Spüle deinen Blähton extrem gründlich unter fließendem Wasser ab, bis das Wasser klar bleibt.\n• Setze den Steinwollwürfel mittig in deinen Netztopf.\n• Fülle den restlichen Platz vorsichtig mit dem gewaschenen Blähton auf.\n\nTIPP: Achte darauf, dass die oberste Schicht der Steinwolle leicht vom Blähton bedeckt ist, um Algenbildung zu verhindern.'**
  String get germinationDesc7;

  /// No description provided for @germinationNext7.
  ///
  /// In de, this message translates to:
  /// **'Im Netztopf gesichert'**
  String get germinationNext7;

  /// No description provided for @germinationTitle8.
  ///
  /// In de, this message translates to:
  /// **'Der Eimer & Das Klima'**
  String get germinationTitle8;

  /// No description provided for @germinationDesc8.
  ///
  /// In de, this message translates to:
  /// **'• Fülle deinen DWC-Eimer mit Wasser (pH 5.8). Gib noch keinen Dünger hinzu.\n• Der Wasserstand sollte etwa 1 bis 2 cm unter dem Boden des Netztopfs enden. Das Wasser darf die Steinwolle nicht berühren.\n• Hänge den Netztopf ein und schalte die Luftpumpe auf 100% ein.\n\nTIPP: Die platzenden Blubberblasen spritzen kleine Wassertropfen an den Netztopf. Das reicht völlig aus, um die Steinwolle feucht zu halten.'**
  String get germinationDesc8;

  /// No description provided for @germinationNext8.
  ///
  /// In de, this message translates to:
  /// **'Eimer & Klima bereit'**
  String get germinationNext8;

  /// No description provided for @germinationTitle9.
  ///
  /// In de, this message translates to:
  /// **'Sanftes Licht'**
  String get germinationTitle9;

  /// No description provided for @germinationDesc9.
  ///
  /// In de, this message translates to:
  /// **'• Sämlinge vertragen noch kein starkes Licht.\n• Hänge die Lampe hoch auf und dimme sie stark herunter.\n• Nutze den eingebauten PPFD-Messer (ca. 150-200 µmol/m²/s an der Spitze).\n\nTIPP: Wenn es in deinem Zelt zu kalt ist (<22°C), hänge die Lampe etwas höher und drehe sie stärker auf, um ihre Abwärme als Heizung zu nutzen.'**
  String get germinationDesc9;

  /// No description provided for @germinationNext9.
  ///
  /// In de, this message translates to:
  /// **'Keimung abschließen'**
  String get germinationNext9;

  /// No description provided for @germinationToDashboard.
  ///
  /// In de, this message translates to:
  /// **'Zum Dashboard'**
  String get germinationToDashboard;

  /// No description provided for @germinationSeedClosed.
  ///
  /// In de, this message translates to:
  /// **'Geschlossen'**
  String get germinationSeedClosed;

  /// No description provided for @germinationSeedOpened.
  ///
  /// In de, this message translates to:
  /// **'Geöffnet'**
  String get germinationSeedOpened;

  /// No description provided for @germinationNextButton.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get germinationNextButton;

  /// No description provided for @tentIntroTitle.
  ///
  /// In de, this message translates to:
  /// **'Wissen & Hardware gecheckt!'**
  String get tentIntroTitle;

  /// No description provided for @tentIntroDesc.
  ///
  /// In de, this message translates to:
  /// **'Du weißt jetzt alles Wichtige über Hardware und Wasser.\n\nAls Nächstes bauen wir gemeinsam dein Zelt auf. Hast du es schon komplett aufgebaut und willst direkt ins Dashboard, oder sollen wir Schritt für Schritt durchgehen?'**
  String get tentIntroDesc;

  /// No description provided for @tentIntroNext.
  ///
  /// In de, this message translates to:
  /// **'Zelt gemeinsam aufbauen'**
  String get tentIntroNext;

  /// No description provided for @tentIntroSkip.
  ///
  /// In de, this message translates to:
  /// **'Zelt steht! Zum Dashboard'**
  String get tentIntroSkip;

  /// No description provided for @tentTitle1.
  ///
  /// In de, this message translates to:
  /// **'Station 1: Der Standplatz'**
  String get tentTitle1;

  /// No description provided for @tentDesc1.
  ///
  /// In de, this message translates to:
  /// **'• Wähle einen Ort in der Nähe eines Fensters.\n• Baue das Metallgerüst auf und ziehe die Zelthülle darüber.\n• Lege die wasserdichte Einlegewanne auf den Zeltboden.\n\nTIPP: Der Zeltboden muss absolut wasserdicht sein. Bei Hydroponik kann immer mal ein Tropfen daneben gehen.'**
  String get tentDesc1;

  /// No description provided for @tentTip1.
  ///
  /// In de, this message translates to:
  /// **'Leg unbedingt die wasserdichte Einlegewanne auf den Zeltboden – bei DWC kann immer mal etwas Wasser tropfen!'**
  String get tentTip1;

  /// No description provided for @tentNext1.
  ///
  /// In de, this message translates to:
  /// **'Zelt steht & ist isoliert'**
  String get tentNext1;

  /// No description provided for @tentTitle2.
  ///
  /// In de, this message translates to:
  /// **'Station 2: Die Lunge des Zeltes'**
  String get tentTitle2;

  /// No description provided for @tentDesc2.
  ///
  /// In de, this message translates to:
  /// **'• Hänge den Aktivkohlefilter (AKF) und den Rohrventilator ganz oben unter die Zeltdecke.\n• Verbinde beide luftdicht miteinander.\n\nTIPP: Nutze großzügig Panzertape oder starke Schlauchklemmen. Jeder Millimeter, der nicht dicht ist, lässt später ungefilterten Geruch entweichen.'**
  String get tentDesc2;

  /// No description provided for @tentTip2.
  ///
  /// In de, this message translates to:
  /// **'Achte darauf, dass die Verbindung zwischen AKF und Ventilator absolut luftdicht ist (Panzertape hilft!).'**
  String get tentTip2;

  /// No description provided for @tentNext2.
  ///
  /// In de, this message translates to:
  /// **'Abluft hängt sicher'**
  String get tentNext2;

  /// No description provided for @tentTitle3.
  ///
  /// In de, this message translates to:
  /// **'Station 3: Abluftschlauch'**
  String get tentTitle3;

  /// No description provided for @tentDesc3.
  ///
  /// In de, this message translates to:
  /// **'• Führe den Abluftschlauch vom Ventilator durch eine der oberen Öffnungen nach draußen, idealerweise aus dem Fenster.'**
  String get tentDesc3;

  /// No description provided for @tentTip3.
  ///
  /// In de, this message translates to:
  /// **'Die Abluft sollte idealerweise aus dem Raum (z.B. aus dem Fenster) geleitet werden, um die Luftfeuchtigkeit im Zimmer nicht zu stark zu erhöhen.'**
  String get tentTip3;

  /// No description provided for @tentNext3.
  ///
  /// In de, this message translates to:
  /// **'Schlauch verlegt'**
  String get tentNext3;

  /// No description provided for @tentTitle4.
  ///
  /// In de, this message translates to:
  /// **'Station 4: Die Sonne aufhängen'**
  String get tentTitle4;

  /// No description provided for @tentDesc4.
  ///
  /// In de, this message translates to:
  /// **'• Hänge deine LED-Lampe mittig im Zelt auf.\n• Verwende stufenlos verstellbare Seilzugratschen (Rope Ratchets), keine starren Ketten.\n\nTIPP: Wenn deine Lampe ein externes Netzteil (Driver) hat, montiere es außerhalb des Zeltes. Das erspart dir im Sommer Hitze.'**
  String get tentDesc4;

  /// No description provided for @tentTip4.
  ///
  /// In de, this message translates to:
  /// **'Wenn möglich, montiere das Netzteil (Driver) der Lampe außerhalb des Zeltes, um Hitze im Zelt zu vermeiden.'**
  String get tentTip4;

  /// No description provided for @tentNext4.
  ///
  /// In de, this message translates to:
  /// **'Lampe hängt'**
  String get tentNext4;

  /// No description provided for @tentTitle5.
  ///
  /// In de, this message translates to:
  /// **'Station 5: Die frische Brise'**
  String get tentTitle5;

  /// No description provided for @tentDesc5.
  ///
  /// In de, this message translates to:
  /// **'• Befestige deine Umluft-Ventilatoren an den Eckstangen.\n• Richte sie so aus, dass sie später über und unter dem Blätterdach wehen.\n\nTIPP: Richte den Luftstrom niemals direkt auf eine junge Pflanze. Das führt zu massivem Windbrand.'**
  String get tentDesc5;

  /// No description provided for @tentTip5.
  ///
  /// In de, this message translates to:
  /// **'Richte die Ventilatoren nie direkt auf die kleinen Pflanzen (Windbrand-Gefahr!), sondern lass sie leicht darüber oder gegen die Zeltwand pusten.'**
  String get tentTip5;

  /// No description provided for @tentNext5.
  ///
  /// In de, this message translates to:
  /// **'Ventilatoren montiert'**
  String get tentNext5;

  /// No description provided for @tentTitle6.
  ///
  /// In de, this message translates to:
  /// **'Station 6: Eimer & Pumpe'**
  String get tentTitle6;

  /// No description provided for @tentDesc6.
  ///
  /// In de, this message translates to:
  /// **'• Stelle den leeren DWC-Eimer mittig unter die Lampe.\n• Setze den Netztopf ein.'**
  String get tentDesc6;

  /// No description provided for @tentTip6.
  ///
  /// In de, this message translates to:
  /// **'Wasche deinen Blähton VOR der Benutzung extrem gründlich aus, sonst hast du später roten Schlamm im Eimer, der den pH-Wert ruiniert!'**
  String get tentTip6;

  /// No description provided for @tentNext6.
  ///
  /// In de, this message translates to:
  /// **'Eimer positioniert'**
  String get tentNext6;

  /// No description provided for @tentTitle7.
  ///
  /// In de, this message translates to:
  /// **'Station 7: Die Lunge (Luftpumpe)'**
  String get tentTitle7;

  /// No description provided for @tentDesc7.
  ///
  /// In de, this message translates to:
  /// **'• Positioniere die Luftpumpe außerhalb des Zeltes.\n• Führe den Luftschlauch zum Ausströmerstein im Eimer.\n\nTIPP: Stelle die Luftpumpe immer auf eine kleine Erhöhung oberhalb des maximalen Wasserspiegels (Siphon-Effekt verhindern).'**
  String get tentDesc7;

  /// No description provided for @tentTip7.
  ///
  /// In de, this message translates to:
  /// **'WICHTIG: Die Luftpumpe MUSS immer außerhalb des Zeltes stehen und am besten höher als der Wasserspiegel! Fällt der Strom aus, kann das Wasser sonst durch den Schlauch in die Pumpe laufen.'**
  String get tentTip7;

  /// No description provided for @tentNext7.
  ///
  /// In de, this message translates to:
  /// **'Pumpe platziert'**
  String get tentNext7;

  /// No description provided for @tentTitle8.
  ///
  /// In de, this message translates to:
  /// **'Station 8: Verkabelung'**
  String get tentTitle8;

  /// No description provided for @tentDesc8.
  ///
  /// In de, this message translates to:
  /// **'• Führe alle Kabel sauber durch die vorgesehenen Öffnungen nach draußen.\n\nTIPP: Lege unter keinen Umständen Mehrfachsteckdosen auf den Zeltboden. Wasser und Strom sind lebensgefährlich.'**
  String get tentDesc8;

  /// No description provided for @tentTip8.
  ///
  /// In de, this message translates to:
  /// **'Wasser und Strom sind Feinde! Leg NIEMALS Mehrfachsteckdosen auf den Zeltboden. Befestige sie sicher außerhalb oder häng sie weit oben auf.'**
  String get tentTip8;

  /// No description provided for @tentNext8.
  ///
  /// In de, this message translates to:
  /// **'Kabel verlegt'**
  String get tentNext8;

  /// No description provided for @tentTitle9.
  ///
  /// In de, this message translates to:
  /// **'Station 9: Zeitschaltuhr & Dauerstrom'**
  String get tentTitle9;

  /// No description provided for @tentDesc9.
  ///
  /// In de, this message translates to:
  /// **'• Schließe die Lampe an die Zeitschaltuhr an.\n• Abluft, Umluft und Luftpumpe laufen auf Dauerstrom (24/7).'**
  String get tentDesc9;

  /// No description provided for @tentTip9.
  ///
  /// In de, this message translates to:
  /// **'Abluft, Umluft und vor allem die Luftpumpe für die Wurzeln laufen IMMER (24/7)! Die Luftpumpe darf niemals ausgeschaltet werden.'**
  String get tentTip9;

  /// No description provided for @tentNext9.
  ///
  /// In de, this message translates to:
  /// **'Alles verkabelt'**
  String get tentNext9;

  /// No description provided for @tentTitle10.
  ///
  /// In de, this message translates to:
  /// **'Station 10: Der letzte Check'**
  String get tentTitle10;

  /// No description provided for @tentDesc10.
  ///
  /// In de, this message translates to:
  /// **'• Schalte alle Geräte ein und schließe das Zelt vollständig.\n• Zieht sich die Zelthülle leicht nach innen? (Unterdruck-Check).\n\nTIPP: Schalte das Licht im Raum aus. Dringt aus dem Zelt irgendwo Licht nach außen? Klebe Lecks von innen ab.'**
  String get tentDesc10;

  /// No description provided for @tentTip10.
  ///
  /// In de, this message translates to:
  /// **'Unterdruck-Check: Ziehen sich die Wände leicht nach innen? Gut! Licht-Check: Mach das Licht im Zimmer aus – dringt irgendwo Licht aus dem Zelt? Klebe es ab!'**
  String get tentTip10;

  /// No description provided for @tentNext10.
  ///
  /// In de, this message translates to:
  /// **'Setup abgeschlossen!'**
  String get tentNext10;

  /// No description provided for @ppfdTitle.
  ///
  /// In de, this message translates to:
  /// **'PPFD Meter'**
  String get ppfdTitle;

  /// No description provided for @ppfdCalibrationTitle.
  ///
  /// In de, this message translates to:
  /// **'Kalibrierung'**
  String get ppfdCalibrationTitle;

  /// No description provided for @ppfdCalibrationDesc.
  ///
  /// In de, this message translates to:
  /// **'Nutze einen echten PAR-Meter, um den Wert abzugleichen. Ändere den Multiplikator, bis die Werte übereinstimmen.'**
  String get ppfdCalibrationDesc;

  /// No description provided for @ppfdCalibrationFactor.
  ///
  /// In de, this message translates to:
  /// **'Faktor: {factor}x'**
  String ppfdCalibrationFactor(String factor);

  /// No description provided for @ppfdCalibrationDone.
  ///
  /// In de, this message translates to:
  /// **'Fertig'**
  String get ppfdCalibrationDone;

  /// No description provided for @ppfdInstruction.
  ///
  /// In de, this message translates to:
  /// **'Bitte lege ein Stück 80g Druckerpapier als Diffusor über die Frontkamera (oben am Bildschirmrand).'**
  String get ppfdInstruction;

  /// No description provided for @ppfdLightSourceLabel.
  ///
  /// In de, this message translates to:
  /// **'Leuchtmittel'**
  String get ppfdLightSourceLabel;

  /// No description provided for @ppfdUnit.
  ///
  /// In de, this message translates to:
  /// **'μmol/m²/s'**
  String get ppfdUnit;

  /// No description provided for @ppfdError.
  ///
  /// In de, this message translates to:
  /// **'Fehler: {err}'**
  String ppfdError(String err);

  /// No description provided for @ppfdTakeValue.
  ///
  /// In de, this message translates to:
  /// **'Messwert übernehmen'**
  String get ppfdTakeValue;

  /// No description provided for @hardwareAdvisorTitle.
  ///
  /// In de, this message translates to:
  /// **'Hardware-Ratgeber'**
  String get hardwareAdvisorTitle;

  /// No description provided for @hardwareAcquired.
  ///
  /// In de, this message translates to:
  /// **'Hab ich besorgt!'**
  String get hardwareAcquired;

  /// No description provided for @hardwareHaveIt.
  ///
  /// In de, this message translates to:
  /// **'Besitze ich'**
  String get hardwareHaveIt;

  /// No description provided for @hardwareCatLight.
  ///
  /// In de, this message translates to:
  /// **'Licht & Klima'**
  String get hardwareCatLight;

  /// No description provided for @hardwareCatDwc.
  ///
  /// In de, this message translates to:
  /// **'Das Herzstück (DWC)'**
  String get hardwareCatDwc;

  /// No description provided for @hardwareCatWater.
  ///
  /// In de, this message translates to:
  /// **'Wasser & Messen'**
  String get hardwareCatWater;

  /// No description provided for @hardwareCatAccessories.
  ///
  /// In de, this message translates to:
  /// **'Zubehör'**
  String get hardwareCatAccessories;

  /// No description provided for @hw_grow_tentTitle.
  ///
  /// In de, this message translates to:
  /// **'Grow-Zelt'**
  String get hw_grow_tentTitle;

  /// No description provided for @hw_grow_tentDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Ein lichtdichtes Zelt sorgt für das perfekte Klima und schützt vor Störlicht.'**
  String get hw_grow_tentDesc;

  /// No description provided for @hw_ledTitle.
  ///
  /// In de, this message translates to:
  /// **'LED-Pflanzenlampe'**
  String get hw_ledTitle;

  /// No description provided for @hw_ledDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Cannabis liebt Licht! Ohne starke Lampe gibt es keine fetten Buds.'**
  String get hw_ledDesc;

  /// No description provided for @hw_exhaustTitle.
  ///
  /// In de, this message translates to:
  /// **'Abluft-Ventilator'**
  String get hw_exhaustTitle;

  /// No description provided for @hw_exhaustDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Erneuert die Luft im Zelt und transportiert Hitze sowie Feuchtigkeit nach draußen.'**
  String get hw_exhaustDesc;

  /// No description provided for @hw_carbon_filterTitle.
  ///
  /// In de, this message translates to:
  /// **'Aktivkohlefilter (AKF)'**
  String get hw_carbon_filterTitle;

  /// No description provided for @hw_carbon_filterDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Cannabis stinkt gewaltig. Der Filter neutralisiert den Geruch zu 100%.'**
  String get hw_carbon_filterDesc;

  /// No description provided for @hw_circulation_fanTitle.
  ///
  /// In de, this message translates to:
  /// **'Umluft-Ventilator'**
  String get hw_circulation_fanTitle;

  /// No description provided for @hw_circulation_fanDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Sorgt für dicke Stängel und verhindert Schimmel in den Blüten.'**
  String get hw_circulation_fanDesc;

  /// No description provided for @hw_thermo_hygroTitle.
  ///
  /// In de, this message translates to:
  /// **'Thermo-/Hygrometer'**
  String get hw_thermo_hygroTitle;

  /// No description provided for @hw_thermo_hygroDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Zur Überwachung von Temperatur und Luftfeuchtigkeit.'**
  String get hw_thermo_hygroDesc;

  /// No description provided for @hw_humidifierTitle.
  ///
  /// In de, this message translates to:
  /// **'Luftbefeuchter / Entfeuchter'**
  String get hw_humidifierTitle;

  /// No description provided for @hw_humidifierDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Zur exakten Kontrolle der Luftfeuchtigkeit (VPD).'**
  String get hw_humidifierDesc;

  /// No description provided for @hw_dwc_bucketTitle.
  ///
  /// In de, this message translates to:
  /// **'DWC-Eimer / Wassertank'**
  String get hw_dwc_bucketTitle;

  /// No description provided for @hw_dwc_bucketDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Das neue Zuhause deiner Wurzeln!'**
  String get hw_dwc_bucketDesc;

  /// No description provided for @hw_net_potTitle.
  ///
  /// In de, this message translates to:
  /// **'Netztopf'**
  String get hw_net_potTitle;

  /// No description provided for @hw_net_potDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Hält den Blähton und gibt den Wurzeln Halt.'**
  String get hw_net_potDesc;

  /// No description provided for @hw_air_pumpTitle.
  ///
  /// In de, this message translates to:
  /// **'Luftpumpe & Ausströmerstein'**
  String get hw_air_pumpTitle;

  /// No description provided for @hw_air_pumpDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Sauerstoff ist Leben! Ohne Blubberblasen ertrinken die Wurzeln.'**
  String get hw_air_pumpDesc;

  /// No description provided for @hw_clay_pebblesTitle.
  ///
  /// In de, this message translates to:
  /// **'Blähton'**
  String get hw_clay_pebblesTitle;

  /// No description provided for @hw_clay_pebblesDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Steriles Medium statt Erde.'**
  String get hw_clay_pebblesDesc;

  /// No description provided for @hw_starter_cubesTitle.
  ///
  /// In de, this message translates to:
  /// **'Anzuchtwürfel'**
  String get hw_starter_cubesTitle;

  /// No description provided for @hw_starter_cubesDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Darin keimt dein Samen sicher und stabil.'**
  String get hw_starter_cubesDesc;

  /// No description provided for @hw_second_bucketTitle.
  ///
  /// In de, this message translates to:
  /// **'Zweiter DWC-Eimer'**
  String get hw_second_bucketTitle;

  /// No description provided for @hw_second_bucketDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Erleichtert den Wasserwechsel enorm.'**
  String get hw_second_bucketDesc;

  /// No description provided for @hw_second_bucketProTip.
  ///
  /// In de, this message translates to:
  /// **'Pro-Tipp: Für den schnellen 2-Eimer-Wechsel-Trick in der Vegi-Phase.'**
  String get hw_second_bucketProTip;

  /// No description provided for @hw_chillerTitle.
  ///
  /// In de, this message translates to:
  /// **'Durchlaufkühler (Water Chiller)'**
  String get hw_chillerTitle;

  /// No description provided for @hw_chillerDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Kühlt das Wasser auf perfekte 18-20°C.'**
  String get hw_chillerDesc;

  /// No description provided for @hw_hydro_nutesTitle.
  ///
  /// In de, this message translates to:
  /// **'Hydrokultur-Dünger'**
  String get hw_hydro_nutesTitle;

  /// No description provided for @hw_hydro_nutesDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Spezieller Dünger für DWC.'**
  String get hw_hydro_nutesDesc;

  /// No description provided for @hw_ph_dropsTitle.
  ///
  /// In de, this message translates to:
  /// **'pH-Messtropfen oder Gerät'**
  String get hw_ph_dropsTitle;

  /// No description provided for @hw_ph_dropsDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Der pH-Wert entscheidet, ob die Pflanze Nährstoffe aufnimmt.'**
  String get hw_ph_dropsDesc;

  /// No description provided for @hw_ph_dropsProTip.
  ///
  /// In de, this message translates to:
  /// **'Pro-Tipp: Billige Stifte sind ungenau, Tropfen sind für Anfänger sicherer.'**
  String get hw_ph_dropsProTip;

  /// No description provided for @hw_ec_meterTitle.
  ///
  /// In de, this message translates to:
  /// **'EC/TDS-Messgerät'**
  String get hw_ec_meterTitle;

  /// No description provided for @hw_ec_meterDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Zeigt dir genau an, wie viel Dünger im Wasser ist.'**
  String get hw_ec_meterDesc;

  /// No description provided for @hw_ph_downTitle.
  ///
  /// In de, this message translates to:
  /// **'pH -'**
  String get hw_ph_downTitle;

  /// No description provided for @hw_ph_downDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Um den pH-Wert zu senken. Nutze als Stoff z.B. Phosphorsäure, keine organischen Säuren.'**
  String get hw_ph_downDesc;

  /// No description provided for @hw_ph_downProTip.
  ///
  /// In de, this message translates to:
  /// **'Pro-Tipp: Phosphorsäure ist stabil und hält den pH-Wert zuverlässig unten.'**
  String get hw_ph_downProTip;

  /// No description provided for @hw_ph_upTitle.
  ///
  /// In de, this message translates to:
  /// **'pH +'**
  String get hw_ph_upTitle;

  /// No description provided for @hw_ph_upDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Um den pH-Wert zu erhöhen. Nutze als Stoff z.B. Kaliumcarbonat oder Kaliumsilikat.'**
  String get hw_ph_upDesc;

  /// No description provided for @hw_calibration_fluidTitle.
  ///
  /// In de, this message translates to:
  /// **'Kalibrierflüssigkeit'**
  String get hw_calibration_fluidTitle;

  /// No description provided for @hw_calibration_fluidDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Um deine Messgeräte zu eichen.'**
  String get hw_calibration_fluidDesc;

  /// No description provided for @hw_water_pumpTitle.
  ///
  /// In de, this message translates to:
  /// **'Elektrische Mini-Tauchpumpe'**
  String get hw_water_pumpTitle;

  /// No description provided for @hw_water_pumpDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Pumpt das Wasser aus dem Eimer.'**
  String get hw_water_pumpDesc;

  /// No description provided for @hw_water_pumpProTip.
  ///
  /// In de, this message translates to:
  /// **'Pro-Tipp: Erleichtert den Wasserwechsel enorm.'**
  String get hw_water_pumpProTip;

  /// No description provided for @hw_ro_systemTitle.
  ///
  /// In de, this message translates to:
  /// **'Umkehrosmose-Anlage'**
  String get hw_ro_systemTitle;

  /// No description provided for @hw_ro_systemDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Filtert alle Salze aus dem Leitungswasser.'**
  String get hw_ro_systemDesc;

  /// No description provided for @hw_ro_systemProTip.
  ///
  /// In de, this message translates to:
  /// **'Pro-Tipp: Bei extrem hartem Leitungswasser.'**
  String get hw_ro_systemProTip;

  /// No description provided for @hw_timerTitle.
  ///
  /// In de, this message translates to:
  /// **'Zeitschaltuhr'**
  String get hw_timerTitle;

  /// No description provided for @hw_timerDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Steuert das Licht automatisch (z.B. 18h an, 6h aus).'**
  String get hw_timerDesc;

  /// No description provided for @hw_scissorsTitle.
  ///
  /// In de, this message translates to:
  /// **'Ernteschere'**
  String get hw_scissorsTitle;

  /// No description provided for @hw_scissorsDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Für die Maniküre der Buds.'**
  String get hw_scissorsDesc;

  /// No description provided for @hw_loupeTitle.
  ///
  /// In de, this message translates to:
  /// **'Taschenmikroskop / Lupe'**
  String get hw_loupeTitle;

  /// No description provided for @hw_loupeDesc.
  ///
  /// In de, this message translates to:
  /// **'Warum brauche ich das? Um den perfekten Erntezeitpunkt (Trichome) zu bestimmen.'**
  String get hw_loupeDesc;

  /// No description provided for @waterGuideTitle.
  ///
  /// In de, this message translates to:
  /// **'Wasser-Masterclass'**
  String get waterGuideTitle;

  /// No description provided for @waterGuideChap1Title.
  ///
  /// In de, this message translates to:
  /// **'Die Regeln des Wasserwechsels'**
  String get waterGuideChap1Title;

  /// No description provided for @waterGuideChap1Desc.
  ///
  /// In de, this message translates to:
  /// **'Pflanzen scheiden Toxine aus und Salze stauen sich an (EC-Creep). Ein wöchentlicher Wechsel stabilisiert den pH-Wert und die Nährstoffaufnahme.\n\nNutze den 2-Eimer-Wechsel-Trick in der Vegi oder eine kleine Tauchpumpe.'**
  String get waterGuideChap1Desc;

  /// No description provided for @waterGuideChap2Title.
  ///
  /// In de, this message translates to:
  /// **'Dein Leitungswasser (Der Start-EC)'**
  String get waterGuideChap2Title;

  /// No description provided for @waterGuideChap2Desc.
  ///
  /// In de, this message translates to:
  /// **'Wie hart ist dein Leitungswasser? Suche online nach \'Wasserwerte [Dein Wohnort]\', um den Bericht deines Versorgers zu finden, und prüfe den Grund-EC-Wert (ohne Dünger).'**
  String get waterGuideChap2Desc;

  /// No description provided for @waterGuideEc0_2.
  ///
  /// In de, this message translates to:
  /// **'EC 0.0 - 0.2 (Sehr weich)'**
  String get waterGuideEc0_2;

  /// No description provided for @waterGuideEc0_2Desc.
  ///
  /// In de, this message translates to:
  /// **'Nahezu salzfrei. Du MUSST CalMag (Calcium/Magnesium) hinzufügen, bis der EC ca. 0.4 erreicht, bevor der Hauptdünger beigemischt wird.'**
  String get waterGuideEc0_2Desc;

  /// No description provided for @waterGuideEc0_4.
  ///
  /// In de, this message translates to:
  /// **'EC 0.2 - 0.4 (Perfektes Wasser)'**
  String get waterGuideEc0_4;

  /// No description provided for @waterGuideEc0_4Desc.
  ///
  /// In de, this message translates to:
  /// **'Jackpot! Das ideale Leitungswasser. Kein zusätzliches CalMag nötig.'**
  String get waterGuideEc0_4Desc;

  /// No description provided for @waterGuideEc0_7.
  ///
  /// In de, this message translates to:
  /// **'EC 0.5 - 0.7 (Hartes Wasser)'**
  String get waterGuideEc0_7;

  /// No description provided for @waterGuideEc0_7Desc.
  ///
  /// In de, this message translates to:
  /// **'Viel Calcium. Kein CalMag nutzen! Nutze speziellen Hard-Water-Dünger und wechsle den Tank strikt wöchentlich.\n\nPro-Tipp: Wenn nur Magnesium fehlt, füge reines Bittersalz (0,1-0,3 g/L) hinzu.'**
  String get waterGuideEc0_7Desc;

  /// No description provided for @waterGuideEcHard.
  ///
  /// In de, this message translates to:
  /// **'EC > 0.7 (Sehr hart / Salzig)'**
  String get waterGuideEcHard;

  /// No description provided for @waterGuideEcHardDesc.
  ///
  /// In de, this message translates to:
  /// **'Ungeeignet für DWC! Zwingend aufbereiten.\n\nAchte im Wasserbericht auch auf Natrium (< 50 mg/L) und Chlorid (< 70 mg/L).'**
  String get waterGuideEcHardDesc;

  /// No description provided for @waterGuideChap3Title.
  ///
  /// In de, this message translates to:
  /// **'Wasser aufbereiten'**
  String get waterGuideChap3Title;

  /// No description provided for @waterGuideChap3Desc.
  ///
  /// In de, this message translates to:
  /// **'• Der Cut-Trick: Mische hartes Wasser 50/50 mit destilliertem Wasser.\n• Tischfilter (Brita) bringen nichts für den EC-Wert.\n• Umkehrosmose: Die beste Langzeitlösung.\n• Chlor ausgasen: Leitungswasser 24-48h abstehen lassen, bevor man es benutzt!'**
  String get waterGuideChap3Desc;

  /// No description provided for @waterGuideNext.
  ///
  /// In de, this message translates to:
  /// **'Verstanden, weiter!'**
  String get waterGuideNext;

  /// No description provided for @plantStatusAllOk.
  ///
  /// In de, this message translates to:
  /// **'Alles im grünen Bereich'**
  String get plantStatusAllOk;

  /// No description provided for @plantStatusOverdue.
  ///
  /// In de, this message translates to:
  /// **'Check-in überfällig!'**
  String get plantStatusOverdue;

  /// No description provided for @ppfdTargetRange.
  ///
  /// In de, this message translates to:
  /// **'Zielbereich: {min} - {max} µmol'**
  String ppfdTargetRange(int min, int max);

  /// No description provided for @ppfdHoldValue.
  ///
  /// In de, this message translates to:
  /// **'Wert festhalten'**
  String get ppfdHoldValue;

  /// No description provided for @ppfdMeasureAgain.
  ///
  /// In de, this message translates to:
  /// **'Neu messen'**
  String get ppfdMeasureAgain;

  /// No description provided for @ppfdSaveValue.
  ///
  /// In de, this message translates to:
  /// **'Wert speichern'**
  String get ppfdSaveValue;

  /// No description provided for @ppfdDiffuserWarning.
  ///
  /// In de, this message translates to:
  /// **'WICHTIG: Hast du einen Diffusor (z.B. Papier) über der Kamera?'**
  String get ppfdDiffuserWarning;

  /// No description provided for @ppfdNeedsMoreLight.
  ///
  /// In de, this message translates to:
  /// **'Mehr Licht'**
  String get ppfdNeedsMoreLight;

  /// No description provided for @ppfdNeedsLessLight.
  ///
  /// In de, this message translates to:
  /// **'Weniger Licht'**
  String get ppfdNeedsLessLight;

  /// No description provided for @checkinWaterChangeRecTitle.
  ///
  /// In de, this message translates to:
  /// **'Zeit für frisches Wasser?'**
  String get checkinWaterChangeRecTitle;

  /// No description provided for @checkinWaterChangeRecDesc.
  ///
  /// In de, this message translates to:
  /// **'Dein letzter kompletter Wasserwechsel ist mindestens 7 Tage her. Um die Ansammlung unbrauchbarer Salze zu verhindern und den pH-Wert zu stabilisieren, empfehlen wir, das Wasser heute zu wechseln.'**
  String get checkinWaterChangeRecDesc;

  /// No description provided for @checkinWaterChangeRecNow.
  ///
  /// In de, this message translates to:
  /// **'Ja, Wasserwechsel starten'**
  String get checkinWaterChangeRecNow;

  /// No description provided for @checkinWaterChangeRecLater.
  ///
  /// In de, this message translates to:
  /// **'Nein, nur Wasser nachfüllen'**
  String get checkinWaterChangeRecLater;

  /// No description provided for @checkinContinue.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get checkinContinue;

  /// No description provided for @checkinWaterLevelTitle.
  ///
  /// In de, this message translates to:
  /// **'Wasserstand prüfen'**
  String get checkinWaterLevelTitle;

  /// No description provided for @checkinWaterLevelDesc.
  ///
  /// In de, this message translates to:
  /// **'• Prüfe den Wasserstand im Eimer.\n• Ist er gesunken, fülle ihn mit klarem Leitungswasser wieder auf, bis das Wasser 1-2 cm unter dem Netztopf steht.\n• Trage hier ein, wie viele Liter du genau nachgefüllt hast.\n\nTIPP: Mache eine Markierung für die optimale Füllhöhe an den Eimer.'**
  String get checkinWaterLevelDesc;

  /// No description provided for @checkinWaterLevelLabel.
  ///
  /// In de, this message translates to:
  /// **'Nachgefüllte Liter'**
  String get checkinWaterLevelLabel;

  /// No description provided for @checkinWaterLevelSkip.
  ///
  /// In de, this message translates to:
  /// **'Kein Wasser nachgefüllt'**
  String get checkinWaterLevelSkip;

  /// No description provided for @checkinEcMeasureTitle.
  ///
  /// In de, this message translates to:
  /// **'Messwerte eintragen'**
  String get checkinEcMeasureTitle;

  /// No description provided for @checkinEcMeasureDesc.
  ///
  /// In de, this message translates to:
  /// **'• Miss den EC-Wert und den pH-Wert direkt im Eimerwasser (nachdem du aufgefüllt hast).\n• Trage beide Werte hier exakt ein.\n\nTIPP: Rühre das Wasser vor der Messung kurz um.'**
  String get checkinEcMeasureDesc;

  /// No description provided for @checkinNutrientTitle.
  ///
  /// In de, this message translates to:
  /// **'Dünger hinzufügen'**
  String get checkinNutrientTitle;

  /// No description provided for @checkinNutrientDesc.
  ///
  /// In de, this message translates to:
  /// **'• Basierend auf deinem nachgefüllten Wasser und den aktuellen Werten benötigst du heute die folgenden Mengen.\n• Gib die Dünger nacheinander in den Eimer und rühre gut um.\n\nTIPP: Mische pure Dünger niemals unverdünnt direkt zusammen.'**
  String get checkinNutrientDesc;

  /// No description provided for @checkinNutrientGrow.
  ///
  /// In de, this message translates to:
  /// **'Grow: {amount} ml'**
  String checkinNutrientGrow(String amount);

  /// No description provided for @checkinNutrientMicro.
  ///
  /// In de, this message translates to:
  /// **'Micro: {amount} ml'**
  String checkinNutrientMicro(String amount);

  /// No description provided for @checkinNutrientBloom.
  ///
  /// In de, this message translates to:
  /// **'Bloom: {amount} ml'**
  String checkinNutrientBloom(String amount);

  /// No description provided for @checkinEcTooHighPartial.
  ///
  /// In de, this message translates to:
  /// **'Dein EC-Wert ist zu hoch! Pumpe ca. 30% des Wassers ab und ersetze es durch klares, ungedüngtes Wasser.'**
  String get checkinEcTooHighPartial;

  /// No description provided for @checkinEcTooHighFull.
  ///
  /// In de, this message translates to:
  /// **'Dein EC-Wert ist zu hoch und das Wasser ist alt. Bitte wechsle das Wasser komplett.'**
  String get checkinEcTooHighFull;

  /// No description provided for @checkinWaterChangeButton.
  ///
  /// In de, this message translates to:
  /// **'Zum Wasserwechsel'**
  String get checkinWaterChangeButton;

  /// No description provided for @checkinPhAdjustTitle.
  ///
  /// In de, this message translates to:
  /// **'pH-Wert justieren'**
  String get checkinPhAdjustTitle;

  /// No description provided for @checkinPhAdjustDesc.
  ///
  /// In de, this message translates to:
  /// **'• Dein Zielbereich liegt bei 5.5 bis 6.5.\n• Ist dein gemessener Wert zu hoch, gib tröpfchenweise pH-Down hinzu.\n• Rühre um, warte eine Minute und miss erneut.\n\nTIPP: pH-Down besteht meist aus konzentrierter Säure. Wenige Tropfen verändern den Wert massiv. Arbeite extrem vorsichtig.'**
  String get checkinPhAdjustDesc;

  /// No description provided for @waterChangeTitle.
  ///
  /// In de, this message translates to:
  /// **'Wasserwechsel'**
  String get waterChangeTitle;

  /// No description provided for @waterChangeMethod1Title.
  ///
  /// In de, this message translates to:
  /// **'Der wöchentliche Wechsel'**
  String get waterChangeMethod1Title;

  /// No description provided for @waterChangeMethod1Desc.
  ///
  /// In de, this message translates to:
  /// **'• Wir empfehlen, das Wasser im Tank alle 7 bis 10 Tage komplett auszutauschen.\n• Pumpe das alte Wasser vollständig ab (z.B. mit Tauchpumpe).\n• Fülle frisches, temperiertes und pH-reguliertes Wasser mit Dünger ein.\n\nTIPP: Bereite das Wasser immer in einem zweiten Eimer vor.'**
  String get waterChangeMethod1Desc;

  /// No description provided for @waterChangeMethod2Title.
  ///
  /// In de, this message translates to:
  /// **'Methode 2: Zweiter Eimer'**
  String get waterChangeMethod2Title;

  /// No description provided for @waterChangeMethod2Desc.
  ///
  /// In de, this message translates to:
  /// **'• Bereite einen zweiten, sauberen Eimer vor.\n• Hebe den Deckel mitsamt Pflanze hoch und setze ihn auf den zweiten Eimer.\n• Leere und reinige den Haupttank und fülle ihn frisch auf.'**
  String get waterChangeMethod2Desc;

  /// No description provided for @waterChangeDone.
  ///
  /// In de, this message translates to:
  /// **'Wasserwechsel erledigt'**
  String get waterChangeDone;

  /// No description provided for @checkinPhStatusTitle.
  ///
  /// In de, this message translates to:
  /// **'pH-Wert Status'**
  String get checkinPhStatusTitle;

  /// No description provided for @checkinPhStatusOk.
  ///
  /// In de, this message translates to:
  /// **'Dein pH-Wert ist im perfekten Bereich (5.5 - 6.5)!'**
  String get checkinPhStatusOk;

  /// No description provided for @checkinPhStatusAdjust.
  ///
  /// In de, this message translates to:
  /// **'Dein pH-Wert ist nicht optimal. Bitte passe ihn mit pH Up / pH Down in kleinen Schritten an, bis er im Bereich 5.5 - 6.5 liegt.'**
  String get checkinPhStatusAdjust;

  /// No description provided for @checkinNutrientNone.
  ///
  /// In de, this message translates to:
  /// **'Kein Wasser nachgefüllt oder EC optimal. Keine Dünger-Anpassung nötig.'**
  String get checkinNutrientNone;

  /// No description provided for @checkinDeepDiveWaterChangeRecTitle.
  ///
  /// In de, this message translates to:
  /// **'Warum ein kompletter Wechsel?'**
  String get checkinDeepDiveWaterChangeRecTitle;

  /// No description provided for @checkinDeepDiveWaterChangeRecText.
  ///
  /// In de, this message translates to:
  /// **'Die Pflanze scheidet Stoffwechselprodukte in das Wasser aus und nimmt nie alle Nährstoffe gleichmäßig auf. Fügst du immer nur frisch hinzu, reichern sich unbrauchbare Salze an. Der EC-Wert mag stimmen, besteht aber nur noch aus Abfall. Ein Wechsel ist dein bester Schutz.'**
  String get checkinDeepDiveWaterChangeRecText;

  /// No description provided for @checkinDeepDiveWaterLevelTitle.
  ///
  /// In de, this message translates to:
  /// **'Die richtige Füllhöhe'**
  String get checkinDeepDiveWaterLevelTitle;

  /// No description provided for @checkinDeepDiveWaterLevelText.
  ///
  /// In de, this message translates to:
  /// **'Eine gesunde Pflanze trinkt extrem viel Wasser. Sinkt der Wasserstand, steigt automatisch die Konzentration der Nährstoffe im restlichen Wasser an, was zu Überdüngung führt. Gleichzeitig muss jedoch immer ein Luftspalt bleiben, damit die oberen \'Luftwurzeln\' Sauerstoff atmen können.'**
  String get checkinDeepDiveWaterLevelText;

  /// No description provided for @checkinDeepDiveEcMeasureTitle.
  ///
  /// In de, this message translates to:
  /// **'Das Steuerinstrument'**
  String get checkinDeepDiveEcMeasureTitle;

  /// No description provided for @checkinDeepDiveEcMeasureText.
  ///
  /// In de, this message translates to:
  /// **'Der EC-Wert sagt dir genau, wie hoch die Nährstoffkonzentration ist. Sinkt er über Nacht, hatte die Pflanze Hunger. Steigt er, war ihr das Wasser zu stark. Der pH-Wert entscheidet, ob die Pflanze diese Nährstoffe chemisch überhaupt aufnehmen kann.'**
  String get checkinDeepDiveEcMeasureText;

  /// No description provided for @checkinDeepDiveEcAdjustTitle.
  ///
  /// In de, this message translates to:
  /// **'Exaktes Düngen'**
  String get checkinDeepDiveEcAdjustTitle;

  /// No description provided for @checkinDeepDiveEcAdjustText.
  ///
  /// In de, this message translates to:
  /// **'Wir düngen niemals \'auf Verdacht\'. Wir ersetzen immer exakt nur die Nährstoffe für das Volumen an Wasser, das die Pflanze getrunken hat. Das verhindert, dass sich unverbrauchte Salze im Tank anstauen und den EC-Wert schleichend in toxische Höhen treiben.'**
  String get checkinDeepDiveEcAdjustText;

  /// No description provided for @checkinDeepDivePhMeasureTitle.
  ///
  /// In de, this message translates to:
  /// **'Warum der pH-Wert alles entscheidet'**
  String get checkinDeepDivePhMeasureTitle;

  /// No description provided for @checkinDeepDivePhMeasureText.
  ///
  /// In de, this message translates to:
  /// **'Cannabis kann Nährstoffe nur in einem bestimmten pH-Bereich aufnehmen. In DWC liegt dieser Sweet Spot zwischen 5.5 und 6.5. Ist der Wert falsch, kannst du so viel düngen wie du willst – die Pflanze verhungert bei vollem Magen (Nutrient Lockout).'**
  String get checkinDeepDivePhMeasureText;

  /// No description provided for @checkinDeepDivePhAdjustTitle.
  ///
  /// In de, this message translates to:
  /// **'Vorsichtige Korrektur'**
  String get checkinDeepDivePhAdjustTitle;

  /// No description provided for @checkinDeepDivePhAdjustText.
  ///
  /// In de, this message translates to:
  /// **'Bei falschen pH-Werten kommt es zum \'Nutrient Lockout\'. Die Pflanze verhungert bei vollem Magen. Ein leichter Drift des pH-Wertes im Rahmen von 5.5 bis 6.5 ist normal und sogar gut, da verschiedene Nährstoffe bei minimal unterschiedlichen pH-Werten am besten absorbiert werden.'**
  String get checkinDeepDivePhAdjustText;

  /// No description provided for @checkinDeepDiveRootsCheckTitle.
  ///
  /// In de, this message translates to:
  /// **'Der Wendepunkt'**
  String get checkinDeepDiveRootsCheckTitle;

  /// No description provided for @checkinDeepDiveRootsCheckText.
  ///
  /// In de, this message translates to:
  /// **'Dieser Moment markiert den Wendepunkt im DWC-Anbau. Sobald die Wurzeln das hochgradig mit Sauerstoff angereicherte Wasser direkt erreichen, schaltet die Pflanze den Turbo ein. Bis das passiert, versorgt sich die Pflanze primär aus der Feuchtigkeit der Steinwolle.'**
  String get checkinDeepDiveRootsCheckText;

  /// No description provided for @checkinDeepDiveTopWateringTitle.
  ///
  /// In de, this message translates to:
  /// **'Vorsichtiges Angießen'**
  String get checkinDeepDiveTopWateringTitle;

  /// No description provided for @checkinDeepDiveTopWateringText.
  ///
  /// In de, this message translates to:
  /// **'Solange die Wurzeln in der Luft hängen, riskierst du, dass der Steinwollwürfel austrocknet. Durch dieses \'Top Feeding\' hältst du den Blähton und den Würfel feucht. Sobald die Wurzeln im Wasser angekommen sind, ist dieser Schritt strengstens verboten (Gefahr von Stammfäule).'**
  String get checkinDeepDiveTopWateringText;

  /// No description provided for @checkinDeepDiveLampTitle.
  ///
  /// In de, this message translates to:
  /// **'Das Licht als Motor'**
  String get checkinDeepDiveLampTitle;

  /// No description provided for @checkinDeepDiveLampText.
  ///
  /// In de, this message translates to:
  /// **'Das Licht ist der Motor für das Wachstum. Die PPFD-Messung stellt sicher, dass wir diesen Motor nicht überdrehen. Wenn die Pflanze in die Höhe schießt, vervielfacht sich die Lichtintensität. Ein zu geringer Abstand führt unweigerlich zu Lichtstress (verbrannte Spitzen).'**
  String get checkinDeepDiveLampText;

  /// No description provided for @checkinDeepDiveHealthTitle.
  ///
  /// In de, this message translates to:
  /// **'Die Blätter als Display'**
  String get checkinDeepDiveHealthTitle;

  /// No description provided for @checkinDeepDiveHealthText.
  ///
  /// In de, this message translates to:
  /// **'Die Blätter sind das Display deiner Pflanze. Hängen sie extrem schlaff herunter, deutet das bei DWC fast immer auf ein Problem im Wasser hin (Sauerstoffmangel/Wurzelfäule). Braune oder gelbe Flecken signalisieren falsche pH-Werte. Nach oben gerollte Ränder sind der Versuch, Hitzestress abzubauen.'**
  String get checkinDeepDiveHealthText;

  /// No description provided for @checkinDeepDiveFinishTitle.
  ///
  /// In de, this message translates to:
  /// **'Routine ist alles'**
  String get checkinDeepDiveFinishTitle;

  /// No description provided for @checkinDeepDiveFinishText.
  ///
  /// In de, this message translates to:
  /// **'Konstanz ist beim DWC-Anbau alles. Indem du jeden Tag diese kleinen Checks durchführst, verhinderst du, dass kleine Schwankungen zu massiven Problemen eskalieren. Ein abrutschender pH-Wert ist nach einem Tag kein Problem – nach drei Tagen zeigt die Pflanze schwere Schäden.'**
  String get checkinDeepDiveFinishText;

  /// No description provided for @germinationDeepDive1Title.
  ///
  /// In de, this message translates to:
  /// **'Warum das Wasserglas?'**
  String get germinationDeepDive1Title;

  /// No description provided for @germinationDeepDive1Text.
  ///
  /// In de, this message translates to:
  /// **'Die harte Schale des Samens benötigt Feuchtigkeit, um aufzuweichen. Das handwarme Wasser simuliert den ersten Frühlingsregen und signalisiert dem Keimling, dass es Zeit ist, aufzuwachen. Lass den Samen jedoch nie länger als 24 Stunden im Glas, da er sonst ertrinkt – er benötigt Sauerstoff.'**
  String get germinationDeepDive1Text;

  /// No description provided for @germinationDeepDive1bTitle.
  ///
  /// In de, this message translates to:
  /// **'Warum pH-angepasstes Wasser?'**
  String get germinationDeepDive1bTitle;

  /// No description provided for @germinationDeepDive1bText.
  ///
  /// In de, this message translates to:
  /// **'Steinwolle ist bei der Herstellung extrem basisch (hoher pH-Wert). Würdest du sie nicht in saurem Wasser einweichen, würde sie später den pH-Wert in deinem DWC-Eimer ständig nach oben ziehen. Der Keimling könnte dann keine Nährstoffe mehr aufnehmen.'**
  String get germinationDeepDive1bText;

  /// No description provided for @germinationDeepDive2Title.
  ///
  /// In de, this message translates to:
  /// **'Die Dunkelheit'**
  String get germinationDeepDive2Title;

  /// No description provided for @germinationDeepDive2Text.
  ///
  /// In de, this message translates to:
  /// **'Cannabissamen sind Dunkelkeimer. In der Natur liegen sie geschützt unter der Erde. Fällt Licht auf den Samen, während er Feuchtigkeit zieht, kann dies seinen Hormonhaushalt stören und den Keimvorgang abbrechen.'**
  String get germinationDeepDive2Text;

  /// No description provided for @germinationDeepDive3Title.
  ///
  /// In de, this message translates to:
  /// **'Die Wurzel wächst'**
  String get germinationDeepDive3Title;

  /// No description provided for @germinationDeepDive3Text.
  ///
  /// In de, this message translates to:
  /// **'Die kleine weiße Spitze, die du siehst, ist die sogenannte Pfahlwurzel (Taproot). Aus ihr bildet sich das gesamte spätere Fundament der Pflanze. Sie ist extrem fragil. Setze sie auf keinen Fall direktem, starkem Licht aus.'**
  String get germinationDeepDive3Text;

  /// No description provided for @germinationDeepDive4Title.
  ///
  /// In de, this message translates to:
  /// **'Die Pfahlwurzel (Taproot)'**
  String get germinationDeepDive4Title;

  /// No description provided for @germinationDeepDive4Text.
  ///
  /// In de, this message translates to:
  /// **'Das kleine weiße Ding, das du siehst, ist die Pfahlwurzel. Sie ist das zukünftige Fundament deiner Pflanze. Aus ihr werden alle weiteren Wurzeln entspringen. Sie ist extrem empfindlich gegenüber Licht, Austrocknung und physischer Beschädigung – fasse sie am besten gar nicht oder nur sehr vorsichtig mit einer Pinzette an.'**
  String get germinationDeepDive4Text;

  /// No description provided for @germinationDeepDive5Title.
  ///
  /// In de, this message translates to:
  /// **'Jeder Same ist anders'**
  String get germinationDeepDive5Title;

  /// No description provided for @germinationDeepDive5Text.
  ///
  /// In de, this message translates to:
  /// **'Geduld ist die wichtigste Tugend eines Growers. Ältere Samen oder Samen mit einer besonders dicken Schale brauchen manchmal bis zu 3 oder 4 Tage. Wenn der Samen jedoch nach 5-7 Tagen im Wasser nicht keimt, war er wahrscheinlich tot oder nicht lebensfähig.'**
  String get germinationDeepDive5Text;

  /// No description provided for @germinationDeepDive6Title.
  ///
  /// In de, this message translates to:
  /// **'Der perfekte Startplatz'**
  String get germinationDeepDive6Title;

  /// No description provided for @germinationDeepDive6Text.
  ///
  /// In de, this message translates to:
  /// **'Wurzeln wachsen immer der Schwerkraft folgend nach unten (Geotropismus), während der Stängel nach oben wächst. Wenn du den Samen falsch herum einsetzt, muss der Keimling im Inneren erst eine 180-Grad-Wende vollziehen. Das kostet ihn wertvolle Energie und verzögert das Wachstum.'**
  String get germinationDeepDive6Text;

  /// No description provided for @germinationDeepDive7Title.
  ///
  /// In de, this message translates to:
  /// **'Blähton Vorbereitung'**
  String get germinationDeepDive7Title;

  /// No description provided for @germinationDeepDive7Text.
  ///
  /// In de, this message translates to:
  /// **'Der Blähton hat keinerlei Nährstoffe. Seine einzige Aufgabe ist es, der Pflanze mechanischen Halt zu geben und das Licht vom Wasserreservoir fernzuhalten. Ungewaschener Blähton spült feinen, roten Staub in deinen Eimer. Dieser Staub blockiert die feinen Poren der Wurzeln und ruiniert deine Luftpumpe.'**
  String get germinationDeepDive7Text;

  /// No description provided for @germinationDeepDive8Title.
  ///
  /// In de, this message translates to:
  /// **'DWC Prinzip für Anfänger'**
  String get germinationDeepDive8Title;

  /// No description provided for @germinationDeepDive8Text.
  ///
  /// In de, this message translates to:
  /// **'Beim Deep Water Culture System ist der Sauerstoff im Wasser dein wichtigster Verbündeter. Stünde die Steinwolle direkt im Wasser, würde sie sich komplett vollsaugen und der Keimling würde unweigerlich ertrinken. Die hohe Luftfeuchtigkeit im Eimer und die feinen Spritzer ziehen die Wurzeln förmlich nach unten.'**
  String get germinationDeepDive8Text;

  /// No description provided for @germinationDeepDive9Title.
  ///
  /// In de, this message translates to:
  /// **'PPFD und junge Pflanzen'**
  String get germinationDeepDive9Title;

  /// No description provided for @germinationDeepDive9Text.
  ///
  /// In de, this message translates to:
  /// **'PPFD misst die Anzahl der Lichtteilchen, die tatsächlich auf der Pflanze ankommen. Ein Sämling hat noch keine echten Blätter für die Photosynthese. Zu viel Licht in diesem Stadium führt zu starkem Lichtstress: Der Sämling bleicht aus, stoppt das Wachstum oder stirbt ab.'**
  String get germinationDeepDive9Text;

  /// No description provided for @diagnoseProblemButton.
  ///
  /// In de, this message translates to:
  /// **'Problem Diagnostizieren'**
  String get diagnoseProblemButton;

  /// No description provided for @problemSymptoms.
  ///
  /// In de, this message translates to:
  /// **'Symptome'**
  String get problemSymptoms;

  /// No description provided for @problemTriggers.
  ///
  /// In de, this message translates to:
  /// **'Auslöser'**
  String get problemTriggers;

  /// No description provided for @problemSolution.
  ///
  /// In de, this message translates to:
  /// **'Lösung'**
  String get problemSolution;

  /// No description provided for @problemPrevention.
  ///
  /// In de, this message translates to:
  /// **'Vorbeugung'**
  String get problemPrevention;

  /// No description provided for @problemActionWaterChange.
  ///
  /// In de, this message translates to:
  /// **'Wasserwechsel durchführen'**
  String get problemActionWaterChange;

  /// No description provided for @problemActionPpfdMeasure.
  ///
  /// In de, this message translates to:
  /// **'PPFD prüfen'**
  String get problemActionPpfdMeasure;

  /// No description provided for @problemActionEcAdjust.
  ///
  /// In de, this message translates to:
  /// **'EC-Wert prüfen'**
  String get problemActionEcAdjust;

  /// No description provided for @problemActionPhAdjust.
  ///
  /// In de, this message translates to:
  /// **'pH-Wert prüfen'**
  String get problemActionPhAdjust;

  /// No description provided for @problemSelectPlantPrompt.
  ///
  /// In de, this message translates to:
  /// **'Bitte wähle eine Pflanze aus, um die Aktion zu starten:'**
  String get problemSelectPlantPrompt;

  /// No description provided for @problemNutrientBurnName.
  ///
  /// In de, this message translates to:
  /// **'Nährstoffbrand (Überdüngung)'**
  String get problemNutrientBurnName;

  /// No description provided for @problemNutrientBurnSymptoms.
  ///
  /// In de, this message translates to:
  /// **'Braune, verbrannte und knusprige Blattspitzen, die sich langsam nach innen ausbreiten.'**
  String get problemNutrientBurnSymptoms;

  /// No description provided for @problemNutrientBurnTriggers.
  ///
  /// In de, this message translates to:
  /// **'Nährstoffbrand entsteht, wenn der EC-Wert so hoch ist, dass durch osmotischen Druck Salze in den Blattspitzen abgelagert werden. Eine Überdüngung wirft die Pflanze um Wochen zurück. Dünge bei Zweifeln weniger.'**
  String get problemNutrientBurnTriggers;

  /// No description provided for @problemNutrientBurnSolution.
  ///
  /// In de, this message translates to:
  /// **'Senke den EC-Wert im Wasser sofort. Pumpe ca. 30-50% des Wassers ab und fülle reines, pH-reguliertes (ungedüngtes) Wasser nach.'**
  String get problemNutrientBurnSolution;

  /// No description provided for @problemNutrientBurnPrevention.
  ///
  /// In de, this message translates to:
  /// **'Achte auf \'Tip Burn\' – winzige gelbe Punkte ganz an der Spitze der Blätter. Dies ist das perfekte Zeichen, dass du das exakte Limit der Pflanze erreicht hast.'**
  String get problemNutrientBurnPrevention;

  /// No description provided for @problemPhImbalanceName.
  ///
  /// In de, this message translates to:
  /// **'pH-Wert Schwankung'**
  String get problemPhImbalanceName;

  /// No description provided for @problemPhImbalanceSymptoms.
  ///
  /// In de, this message translates to:
  /// **'Gelbe, oft rostige Flecken auf den mittleren Blättern. Verdrehtes oder unförmiges Wachstum.'**
  String get problemPhImbalanceSymptoms;

  /// No description provided for @problemPhImbalanceTriggers.
  ///
  /// In de, this message translates to:
  /// **'Anfänger verwechseln diese Flecken oft mit Kalziummangel und düngen mehr – ein fataler Fehler. Die Mineralien sind da, aber der falsche pH-Wert blockiert die Wurzeln chemisch (Lockout).'**
  String get problemPhImbalanceTriggers;

  /// No description provided for @problemPhImbalanceSolution.
  ///
  /// In de, this message translates to:
  /// **'Korrigiere den pH-Wert sofort in den Bereich 5.5 bis 6.5. Ist das Wasser älter als 7 Tage, wechsle es komplett aus.'**
  String get problemPhImbalanceSolution;

  /// No description provided for @problemPhImbalancePrevention.
  ///
  /// In de, this message translates to:
  /// **'Nutze niemals Hausmittel wie Essig oder Zitronensaft, um den pH-Wert zu senken. Der pH-Wert schießt nach wenigen Stunden wieder unkontrolliert nach oben.'**
  String get problemPhImbalancePrevention;

  /// No description provided for @problemLightBurnName.
  ///
  /// In de, this message translates to:
  /// **'Lichtbrand'**
  String get problemLightBurnName;

  /// No description provided for @problemLightBurnSymptoms.
  ///
  /// In de, this message translates to:
  /// **'Die Blätter an den obersten Trieben werden gelb oder weiß gebleicht, während die Adern oft grün bleiben. Die Ränder rollen sich nach oben (Kanu-Form) um die Hitze abzuleiten.'**
  String get problemLightBurnSymptoms;

  /// No description provided for @problemLightBurnTriggers.
  ///
  /// In de, this message translates to:
  /// **'Die Lampe hängt zu nah an der Pflanze oder ist zu stark eingestellt. Die Lichtintensität (PPFD) übersteigt das, was die Pflanze verarbeiten kann.'**
  String get problemLightBurnTriggers;

  /// No description provided for @problemLightBurnSolution.
  ///
  /// In de, this message translates to:
  /// **'Erhöhe den Abstand zur Lampe oder dimme sie herunter. Miss den PPFD-Wert an der Pflanzenspitze, um ihn anzupassen.'**
  String get problemLightBurnSolution;

  /// No description provided for @problemLightBurnPrevention.
  ///
  /// In de, this message translates to:
  /// **'Passe den Lampenabstand an das Wachstum an. Nutze den PPFD-Meter bei jedem Check-In, um im optimalen Bereich zu bleiben.'**
  String get problemLightBurnPrevention;

  /// No description provided for @problemCalciumDeficiencyName.
  ///
  /// In de, this message translates to:
  /// **'Kalziummangel'**
  String get problemCalciumDeficiencyName;

  /// No description provided for @problemCalciumDeficiencySymptoms.
  ///
  /// In de, this message translates to:
  /// **'Kleine braune/rostige Flecken auf jüngeren und mittleren Blättern. Neue Blätter wachsen oft verkrüppelt oder haben gelbe Ränder.'**
  String get problemCalciumDeficiencySymptoms;

  /// No description provided for @problemCalciumDeficiencyTriggers.
  ///
  /// In de, this message translates to:
  /// **'Meist weiches Leitungswasser (RO-Wasser oder EC < 0.2) ohne CalMag-Zusatz. Manchmal auch blockiert durch falschen pH-Wert oder zu viel Kalium.'**
  String get problemCalciumDeficiencyTriggers;

  /// No description provided for @problemCalciumDeficiencySolution.
  ///
  /// In de, this message translates to:
  /// **'Korrigiere den EC-Wert, indem du CalMag hinzufügst (Grundwasser immer zuerst auf 0.4 EC mit CalMag anheben, bevor Dünger rein kommt).'**
  String get problemCalciumDeficiencySolution;

  /// No description provided for @problemCalciumDeficiencyPrevention.
  ///
  /// In de, this message translates to:
  /// **'Bei sehr weichem Wasser oder Osmosewasser zwingend bei jedem Wasserwechsel CalMag als Basis hinzufügen.'**
  String get problemCalciumDeficiencyPrevention;

  /// No description provided for @checkinVentilatorTitle.
  ///
  /// In de, this message translates to:
  /// **'Ventilator-Check'**
  String get checkinVentilatorTitle;

  /// No description provided for @checkinVentilatorDesc.
  ///
  /// In de, this message translates to:
  /// **'Laufen deine Umluft-Ventilatoren und sind sie richtig positioniert?'**
  String get checkinVentilatorDesc;

  /// No description provided for @checkinVentilatorNext.
  ///
  /// In de, this message translates to:
  /// **'Sieht gut aus'**
  String get checkinVentilatorNext;

  /// No description provided for @checkinVentilatorDeepDiveTitle.
  ///
  /// In de, this message translates to:
  /// **'Ventilator-Platzierung'**
  String get checkinVentilatorDeepDiveTitle;

  /// No description provided for @checkinVentilatorDeepDiveText.
  ///
  /// In de, this message translates to:
  /// **'Platziere einen Ventilator über dem Blätterdach und einen darunter. Sie sollten schwenken (oszillieren) und eine sanfte Brise erzeugen.\n\nTypische Fehler:\n- Richte Ventilatoren nie direkt auf kleine Pflanzen (Gefahr von Windbrand!).\n- Ein starrer Luftstrom trocknet die Blätter aus.\n- Stehende Luft ohne Umluft begünstigt Schimmel.'**
  String get checkinVentilatorDeepDiveText;

  /// No description provided for @settingsTitle.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get settingsTitle;

  /// No description provided for @settingsAppearance.
  ///
  /// In de, this message translates to:
  /// **'Erscheinungsbild'**
  String get settingsAppearance;

  /// No description provided for @settingsTheme.
  ///
  /// In de, this message translates to:
  /// **'Design'**
  String get settingsTheme;

  /// No description provided for @settingsThemeLight.
  ///
  /// In de, this message translates to:
  /// **'Hell'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In de, this message translates to:
  /// **'Dunkel'**
  String get settingsThemeDark;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In de, this message translates to:
  /// **'System-Standard'**
  String get settingsThemeSystem;

  /// No description provided for @settingsLanguage.
  ///
  /// In de, this message translates to:
  /// **'Sprache'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSystem.
  ///
  /// In de, this message translates to:
  /// **'System-Standard'**
  String get settingsLanguageSystem;

  /// No description provided for @settingsLanguageDe.
  ///
  /// In de, this message translates to:
  /// **'Deutsch'**
  String get settingsLanguageDe;

  /// No description provided for @settingsLanguageEn.
  ///
  /// In de, this message translates to:
  /// **'Englisch'**
  String get settingsLanguageEn;

  /// No description provided for @settingsUnits.
  ///
  /// In de, this message translates to:
  /// **'Einheiten'**
  String get settingsUnits;

  /// No description provided for @settingsVolumeUnit.
  ///
  /// In de, this message translates to:
  /// **'Volumen'**
  String get settingsVolumeUnit;

  /// No description provided for @settingsVolumeLiters.
  ///
  /// In de, this message translates to:
  /// **'Liter (L)'**
  String get settingsVolumeLiters;

  /// No description provided for @settingsVolumeGallons.
  ///
  /// In de, this message translates to:
  /// **'Gallonen (Gal)'**
  String get settingsVolumeGallons;

  /// No description provided for @settingsTempUnit.
  ///
  /// In de, this message translates to:
  /// **'Temperatur'**
  String get settingsTempUnit;

  /// No description provided for @settingsTempC.
  ///
  /// In de, this message translates to:
  /// **'Celsius (°C)'**
  String get settingsTempC;

  /// No description provided for @settingsTempF.
  ///
  /// In de, this message translates to:
  /// **'Fahrenheit (°F)'**
  String get settingsTempF;

  /// No description provided for @settingsCondUnit.
  ///
  /// In de, this message translates to:
  /// **'Leitfähigkeit'**
  String get settingsCondUnit;

  /// No description provided for @settingsCondEc.
  ///
  /// In de, this message translates to:
  /// **'EC (mS/cm)'**
  String get settingsCondEc;

  /// No description provided for @settingsCondPpm500.
  ///
  /// In de, this message translates to:
  /// **'PPM (500)'**
  String get settingsCondPpm500;

  /// No description provided for @settingsCondPpm700.
  ///
  /// In de, this message translates to:
  /// **'PPM (700)'**
  String get settingsCondPpm700;

  /// No description provided for @settingsDangerZone.
  ///
  /// In de, this message translates to:
  /// **'Gefahrenzone'**
  String get settingsDangerZone;

  /// No description provided for @settingsResetApp.
  ///
  /// In de, this message translates to:
  /// **'App zurücksetzen'**
  String get settingsResetApp;

  /// No description provided for @settingsResetWarning.
  ///
  /// In de, this message translates to:
  /// **'Möchtest du wirklich alle Pflanzen, Logs und Einstellungen löschen? Dies kann nicht rückgängig gemacht werden.'**
  String get settingsResetWarning;

  /// No description provided for @settingsCancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get settingsCancel;

  /// No description provided for @settingsDelete.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get settingsDelete;

  /// No description provided for @settingsNotifications.
  ///
  /// In de, this message translates to:
  /// **'Benachrichtigungen'**
  String get settingsNotifications;

  /// No description provided for @settingsCheckinFreq.
  ///
  /// In de, this message translates to:
  /// **'Check-in Erinnerungen'**
  String get settingsCheckinFreq;

  /// No description provided for @settingsFreqDaily.
  ///
  /// In de, this message translates to:
  /// **'Täglich'**
  String get settingsFreqDaily;

  /// No description provided for @settingsFreqEvery2Days.
  ///
  /// In de, this message translates to:
  /// **'Alle 2 Tage'**
  String get settingsFreqEvery2Days;

  /// No description provided for @settingsFreqWeekly.
  ///
  /// In de, this message translates to:
  /// **'Wöchentlich'**
  String get settingsFreqWeekly;

  /// No description provided for @settingsFreqOff.
  ///
  /// In de, this message translates to:
  /// **'Aus'**
  String get settingsFreqOff;

  /// No description provided for @checkinTransitionAutoTitle.
  ///
  /// In de, this message translates to:
  /// **'Beginnt die Blüte?'**
  String get checkinTransitionAutoTitle;

  /// No description provided for @checkinTransitionAutoDesc.
  ///
  /// In de, this message translates to:
  /// **'Es bilden sich erste kleine weiße Härchen (Vorblüte / Pistils) an den Blattachseln (Nodien). Zudem beginnt die Pflanze plötzlich stark in die Höhe zu wachsen.\n\nSiehst du diese weißen Härchen an deiner Pflanze?'**
  String get checkinTransitionAutoDesc;

  /// No description provided for @checkinTransitionAutoNo.
  ///
  /// In de, this message translates to:
  /// **'Nein, noch nicht'**
  String get checkinTransitionAutoNo;

  /// No description provided for @checkinTransitionAutoYes.
  ///
  /// In de, this message translates to:
  /// **'Ja, Blüte hat begonnen'**
  String get checkinTransitionAutoYes;

  /// No description provided for @checkinTransitionPhotoTitle.
  ///
  /// In de, this message translates to:
  /// **'Zeit für die Blüte?'**
  String get checkinTransitionPhotoTitle;

  /// No description provided for @checkinTransitionPhotoDesc.
  ///
  /// In de, this message translates to:
  /// **'Cannabis wächst in den ersten 2-3 Wochen der Blüte (dem \'Stretch\') extrem in die Höhe – oft verdoppelt oder verdreifacht sie ihre Größe.\n\nHat die Pflanze ca. 1/3 bis 1/2 des maximal verfügbaren Platzes erreicht und ist gesund?\n\nMöchtest du sie heute in die Blüte schicken?'**
  String get checkinTransitionPhotoDesc;

  /// No description provided for @checkinTransitionPhotoNo.
  ///
  /// In de, this message translates to:
  /// **'Nein, sie braucht noch Zeit'**
  String get checkinTransitionPhotoNo;

  /// No description provided for @checkinTransitionPhotoYes.
  ///
  /// In de, this message translates to:
  /// **'Ja, heute wird umgestellt'**
  String get checkinTransitionPhotoYes;

  /// No description provided for @checkinTransitionLightPhotoTitle.
  ///
  /// In de, this message translates to:
  /// **'Die Lichtumstellung (12/12)'**
  String get checkinTransitionLightPhotoTitle;

  /// No description provided for @checkinTransitionLightPhotoDesc.
  ///
  /// In de, this message translates to:
  /// **'Um die Blüte auszulösen, musst du deine Zeitschaltuhr heute auf 12 Stunden an / 12 Stunden aus umstellen.\n\nWICHTIG: In den 12 Stunden Dunkelheit darf kein noch so kleines Licht ins Zelt fallen (Störlicht), sonst zwittert die Pflanze.'**
  String get checkinTransitionLightPhotoDesc;

  /// No description provided for @checkinTransitionLightAutoTitle.
  ///
  /// In de, this message translates to:
  /// **'Licht bleibt auf 18/6'**
  String get checkinTransitionLightAutoTitle;

  /// No description provided for @checkinTransitionLightAutoDesc.
  ///
  /// In de, this message translates to:
  /// **'Da es sich um eine Autoflower handelt, musst du an der Zeitschaltuhr nichts ändern. Lass sie auf 18/6 (oder 20/4).\n\nAchte in den nächsten Tagen extrem auf den Lampenabstand, da sie stark in die Höhe wachsen wird.'**
  String get checkinTransitionLightAutoDesc;

  /// No description provided for @checkinFlowerWaterChangeRecTitle.
  ///
  /// In de, this message translates to:
  /// **'Neues Düngeschema'**
  String get checkinFlowerWaterChangeRecTitle;

  /// No description provided for @checkinFlowerWaterChangeRecDesc.
  ///
  /// In de, this message translates to:
  /// **'Da deine Pflanze nun in die Blütephase übergegangen ist, benötigt sie einen anderen Mix an Nährstoffen (mehr Phosphor/Kalium). Deshalb muss das Wasser heute unbedingt komplett gewechselt werden, bevor der neue Dünger angemischt wird.'**
  String get checkinFlowerWaterChangeRecDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
