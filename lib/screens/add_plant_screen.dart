import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/database_provider.dart';
import '../models/plant.dart';
import '../theme/app_colors.dart';

class AddPlantScreen extends ConsumerStatefulWidget {
  const AddPlantScreen({super.key});

  @override
  ConsumerState<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends ConsumerState<AddPlantScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  
  double? _waterVolume = 20.0;
  final _customWaterController = TextEditingController();

  NutrientBrand _nutrientBrand = NutrientBrand.cannaAqua;
  PlantType _plantType = PlantType.photo;

  String _lampType = 'LED';
  int? _lampWattage = 200;
  final _customWattageController = TextEditingController();
  
  int? _plantsUnderLamp = 1;
  final _customPlantsController = TextEditingController();

  PlantPhase _currentPhase = PlantPhase.veg;
  final _dayInPhaseController = TextEditingController(text: '1');

  final List<double> _volumeOptions = [10.0, 15.0, 20.0, 25.0, 30.0];
  final List<int> _wattageOptions = [100, 150, 200, 300, 400];
  final List<int> _plantsOptions = [1, 2, 3, 4];

  @override
  void dispose() {
    _customWaterController.dispose();
    _customWattageController.dispose();
    _customPlantsController.dispose();
    _dayInPhaseController.dispose();
    super.dispose();
  }

  Future<void> _savePlant() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final db = ref.read(databaseProvider).isar;

    double finalVolume = _waterVolume ?? double.tryParse(_customWaterController.text) ?? 20.0;
    int finalWattage = _lampWattage ?? int.tryParse(_customWattageController.text) ?? 200;
    int finalPlants = _plantsUnderLamp ?? int.tryParse(_customPlantsController.text) ?? 1;
    int finalDay = int.tryParse(_dayInPhaseController.text) ?? 1;

    final newPlant = Plant()
      ..name = _name
      ..currentPhase = _currentPhase
      ..currentDayInPhase = finalDay
      ..waterVolumeLiters = finalVolume
      ..nutrientBrand = _nutrientBrand
      ..type = _plantType
      ..lampType = _lampType
      ..lampWattage = finalWattage
      ..plantsUnderLamp = finalPlants
      ..measurementHistory = [];

    await db.writeTxn(() async {
      await db.plants.put(newPlant);
    });

    if (mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Neue Pflanze anlegen')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('1. Pflanzenname / Eimerbezeichnung'),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name deiner Pflanze oder des Eimers',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? 'Pflichtfeld' : null,
                onSaved: (val) => _name = val!,
              ),
              const SizedBox(height: 32),

              _buildSectionTitle('2. Reservoirvolumen (in Litern)'),
              const Text('Wie viel Liter Wasser fasst dein Eimer im Betrieb?', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _volumeOptions.map((v) {
                  return ChoiceChip(
                    label: Text('${v.toInt()} L'),
                    selected: _waterVolume == v,
                    selectedColor: AppColors.growGreen,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _waterVolume = v;
                          _customWaterController.clear();
                        });
                      }
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _customWaterController,
                decoration: const InputDecoration(
                  labelText: 'Individuell (z.B. 18.5 L)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (val) {
                  if (val.isNotEmpty) setState(() => _waterVolume = null);
                },
              ),
              const SizedBox(height: 32),

              _buildSectionTitle('3. Wahl der Düngermarke'),
              const Text('Welche Nährstofflinie nutzt du für diese Pflanze?', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Column(
                children: NutrientBrand.values.map((brand) {
                  String label = brand.toString().split('.').last;
                  if (brand == NutrientBrand.cannaAqua) label = 'Canna Aqua';
                  if (brand == NutrientBrand.ta) label = 'General Hydroponics';
                  if (brand == NutrientBrand.advancedNutrients) label = 'Advanced Nutrients';
                  if (brand == NutrientBrand.plagron) label = 'Plagron';

                  return RadioListTile<NutrientBrand>(
                    title: Text(label),
                    value: brand,
                    groupValue: _nutrientBrand,
                    activeColor: AppColors.growGreen,
                    onChanged: (val) => setState(() => _nutrientBrand = val!),
                    contentPadding: EdgeInsets.zero,
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),

              _buildSectionTitle('4. Pflanzen-Genetik'),
              const Text('Um welchen Pflanzentyp handelt es sich?', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Center(child: Text('Photo (Photoperiodisch)')),
                      selected: _plantType == PlantType.photo,
                      selectedColor: AppColors.growGreen,
                      onSelected: (val) => setState(() => _plantType = PlantType.photo),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ChoiceChip(
                      label: const Center(child: Text('Auto (Autoflowering)')),
                      selected: _plantType == PlantType.auto,
                      selectedColor: AppColors.growGreen,
                      onSelected: (val) => setState(() => _plantType = PlantType.auto),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              _buildSectionTitle('5. Beleuchtungs- & Lampen-Daten'),
              const Text('Deine Beleuchtungs-Daten (für exakte Abstandsempfehlungen)', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              const Text('Lampentyp:', style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                children: ['LED', 'NDL', 'CMH'].map((t) => ChoiceChip(
                  label: Text(t),
                  selected: _lampType == t,
                  selectedColor: AppColors.growGreen,
                  onSelected: (val) => setState(() => _lampType = t),
                )).toList(),
              ),
              const SizedBox(height: 16),
              const Text('Wattzahl:', style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                children: _wattageOptions.map((w) => ChoiceChip(
                  label: Text('${w}W'),
                  selected: _lampWattage == w,
                  selectedColor: AppColors.growGreen,
                  onSelected: (val) {
                    if (val) setState(() { _lampWattage = w; _customWattageController.clear(); });
                  },
                )).toList(),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _customWattageController,
                decoration: const InputDecoration(
                  labelText: 'Individuell (z.B. 240 W)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  if (val.isNotEmpty) setState(() => _lampWattage = null);
                },
              ),
              const SizedBox(height: 16),
              const Text('Anzahl Pflanzen unter Lampe:', style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                children: _plantsOptions.map((p) => ChoiceChip(
                  label: Text(p == 4 ? '4+' : '$p'),
                  selected: _plantsUnderLamp == p,
                  selectedColor: AppColors.growGreen,
                  onSelected: (val) {
                    if (val) setState(() { _plantsUnderLamp = p; _customPlantsController.clear(); });
                  },
                )).toList(),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _customPlantsController,
                decoration: const InputDecoration(
                  labelText: 'Individuell (z.B. 6)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  if (val.isNotEmpty) setState(() => _plantsUnderLamp = null);
                },
              ),
              const SizedBox(height: 32),

              _buildSectionTitle('6. Aktueller Start-Stand & Tag'),
              const Text('In welcher Phase & an welchem Tag befindet sich die Pflanze heute?', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('Keimling / Steckling'),
                    selected: _currentPhase == PlantPhase.germination,
                    selectedColor: AppColors.growGreen,
                    onSelected: (val) => setState(() => _currentPhase = PlantPhase.germination),
                  ),
                  ChoiceChip(
                    label: const Text('Vegetation'),
                    selected: _currentPhase == PlantPhase.veg,
                    selectedColor: AppColors.growGreen,
                    onSelected: (val) => setState(() => _currentPhase = PlantPhase.veg),
                  ),
                  ChoiceChip(
                    label: const Text('Blütephase'),
                    selected: _currentPhase == PlantPhase.flower,
                    selectedColor: AppColors.growGreen,
                    onSelected: (val) => setState(() => _currentPhase = PlantPhase.flower),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dayInPhaseController,
                decoration: const InputDecoration(
                  labelText: 'Aktueller Tag in dieser Phase (z.B. 1)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? 'Pflichtfeld' : null,
              ),
              const SizedBox(height: 48),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _savePlant,
                  child: const Text('Pflanze im Dashboard anlegen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
