import '../models/plant.dart';

enum TestScenarioType {
  onboarding,
  seedAdded,
  earlyVeg,
  midVeg,
  harvestReady,
}

class TestScenario {
  final TestScenarioType type;
  final String title;
  final String description;
  final DateTime startTime;
  final List<Plant> plants;
  final bool hasCompletedOnboarding;

  TestScenario({
    required this.type,
    required this.title,
    required this.description,
    required this.startTime,
    required this.plants,
    this.hasCompletedOnboarding = true,
  });

  static List<TestScenario> get all => [
        TestScenario(
          type: TestScenarioType.onboarding,
          title: 'Onboarding (Leer)',
          description: 'Frische Installation ohne Pflanzen.',
          startTime: DateTime(2024, 1, 1),
          plants: [],
          hasCompletedOnboarding: false,
        ),
        TestScenario(
          type: TestScenarioType.seedAdded,
          title: 'Samen hinzugefügt',
          description: 'Ein Samen wurde hinzugefügt, aber die Keimung noch nicht gestartet.',
          startTime: DateTime(2024, 1, 2),
          plants: [
            Plant()
              ..name = 'Royal Gorilla'
              ..currentPhase = PlantPhase.germination
              ..currentDayInPhase = 0
              ..waterVolumeLiters = 10.0
              ..nutrientBrand = NutrientBrand.cannaAqua
              ..type = PlantType.photo
              ..lampWattage = 150
              ..lampType = 'LED'
              ..plantsUnderLamp = 1
              ..rootsReachedWater = false
              ..measurementHistory = [],
          ],
        ),
        TestScenario(
          type: TestScenarioType.earlyVeg,
          title: 'Frisch Gekeimt (Veg Tag 1)',
          description: 'Samen ist gekeimt und frisch im Eimer (Wurzeln noch nicht im Wasser).',
          startTime: DateTime(2024, 1, 5),
          plants: [
            Plant()
              ..name = 'Royal Gorilla'
              ..currentPhase = PlantPhase.veg
              ..currentDayInPhase = 1
              ..waterVolumeLiters = 10.0
              ..nutrientBrand = NutrientBrand.cannaAqua
              ..type = PlantType.photo
              ..lampWattage = 150
              ..lampType = 'LED'
              ..plantsUnderLamp = 1
              ..rootsReachedWater = false
              ..measurementHistory = [],
          ],
        ),
        TestScenario(
          type: TestScenarioType.midVeg,
          title: 'Wachstumsphase (Tag 14)',
          description: 'Eine Pflanze (White Widow) in Woche 2 der Vegetationsphase.',
          startTime: DateTime(2024, 1, 15),
          plants: [
            Plant()
              ..name = 'White Widow Auto'
              ..currentPhase = PlantPhase.veg
              ..currentDayInPhase = 14
              ..waterVolumeLiters = 10.0
              ..nutrientBrand = NutrientBrand.cannaAqua
              ..type = PlantType.auto
              ..lampWattage = 150
              ..lampType = 'LED'
              ..plantsUnderLamp = 1
              ..measurementHistory = [],
          ],
        ),
        TestScenario(
          type: TestScenarioType.harvestReady,
          title: 'Erntebereit',
          description: 'Pflanze am Ende der Blüte, wartet auf die Ernte.',
          startTime: DateTime(2024, 3, 10),
          plants: [
            Plant()
              ..name = 'Amnesia Haze'
              ..currentPhase = PlantPhase.flower
              ..currentDayInPhase = 60
              ..waterVolumeLiters = 15.0
              ..nutrientBrand = NutrientBrand.ta
              ..type = PlantType.photo
              ..lampWattage = 300
              ..lampType = 'LED'
              ..plantsUnderLamp = 2
              ..measurementHistory = [],
          ],
        ),
      ];
}
