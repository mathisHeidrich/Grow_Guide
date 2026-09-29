import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/time_provider.dart';

import '../providers/database_provider.dart';
import 'package:app/l10n/app_localizations.dart';
import '../models/plant.dart';
import '../theme/app_colors.dart';
import 'package:drift/drift.dart' as drift;
import 'package:app/theme/app_colors.dart';

class AddPlantScreen extends ConsumerStatefulWidget {
  const AddPlantScreen({super.key});

  @override
  ConsumerState<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends ConsumerState<AddPlantScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int? _selectedTentId;

  double? _waterVolume = 20.0;
  final _customWaterController = TextEditingController();

  NutrientBrand _nutrientBrand = NutrientBrand.cannaAqua;
  PlantType _plantType = PlantType.photo;

  PlantPhase _currentPhase = PlantPhase.germination;
  final _dayInPhaseController = TextEditingController(text: '1');

  String _growLevel = 'level1';

  final List<double> _volumeOptions = [10.0, 15.0, 20.0, 25.0, 30.0];

  @override
  void dispose() {
    _customWaterController.dispose();
    _dayInPhaseController.dispose();
    super.dispose();
  }

  Future<void> _savePlant() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final db = ref.read(databaseProvider).db;

    double finalVolume =
        _waterVolume ?? double.tryParse(_customWaterController.text) ?? 20.0;
    int finalDay = int.tryParse(_dayInPhaseController.text) ?? 1;

    final now = ref.read(timeProvider);
    final phaseStart = now.subtract(Duration(days: finalDay - 1));

    await db.into(db.plants).insert(PlantsCompanion.insert(
          name: _name,
          currentPhase: _currentPhase,
          phaseStartDate: drift.Value(phaseStart),
          waterVolumeLiters: finalVolume,
          nutrientBrand: _nutrientBrand,
          type: _plantType,
          tentId: drift.Value(_selectedTentId),
          growLevel: drift.Value(_growLevel),
        ));

    if (mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.addPlantTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(l10n.addPlantSection1),
              TextFormField(
                decoration: InputDecoration(
                  labelText: l10n.addPlantNameLabel,
                  border: const OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? l10n.addPlantRequired : null,
                onSaved: (val) => _name = val!,
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(l10n.addPlantSection2),
              Text(l10n.addPlantVolumeDesc,
                  style: const TextStyle(color: AppColors.textSecondary)),
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
                decoration: InputDecoration(
                  labelText: l10n.addPlantCustomLiters,
                  border: const OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (val) {
                  if (val.isNotEmpty) setState(() => _waterVolume = null);
                },
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(l10n.addPlantSection3),
              Text(l10n.addPlantBrandDesc,
                  style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Column(
                children: NutrientBrand.values.map((brand) {
                  String label = brand.toString().split('.').last;
                  if (brand == NutrientBrand.cannaAqua) {
                    label = 'Canna Aqua';
                  }
                  if (brand == NutrientBrand.ta) {
                    label = 'General Hydroponics';
                  }
                  if (brand == NutrientBrand.advancedNutrients) {
                    label = 'Advanced Nutrients';
                  }
                  if (brand == NutrientBrand.plagron) {
                    label = 'Plagron';
                  }

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
              _buildSectionTitle(l10n.addPlantSection4),
              Text(l10n.addPlantTypeDesc,
                  style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: Center(child: Text(l10n.addPlantTypePhoto)),
                      selected: _plantType == PlantType.photo,
                      selectedColor: AppColors.growGreen,
                      onSelected: (val) =>
                          setState(() => _plantType = PlantType.photo),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ChoiceChip(
                      label: Center(child: Text(l10n.addPlantTypeAuto)),
                      selected: _plantType == PlantType.auto,
                      selectedColor: AppColors.growGreen,
                      onSelected: (val) =>
                          setState(() => _plantType = PlantType.auto),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Zelt wählen'), // TODO: l10n
              Text('In welches Zelt soll diese Pflanze?',
                  style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              StreamBuilder<List<Tent>>(
                stream: ref
                    .watch(databaseProvider)
                    .db
                    .select(ref.watch(databaseProvider).db.tents)
                    .watch(),
                builder: (context, snapshot) {
                  final tents = snapshot.data ?? [];
                  if (tents.isEmpty)
                    return const Text(
                        'Keine Zelte gefunden. Bitte erstelle ein Zelt auf dem Dashboard.');
                  if (_selectedTentId == null && tents.isNotEmpty) {
                    Future.microtask(
                        () => setState(() => _selectedTentId = tents.first.id));
                  }
                  return DropdownButtonFormField<int>(
                    value: _selectedTentId,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    items: tents
                        .map((t) =>
                            DropdownMenuItem(value: t.id, child: Text(t.name)))
                        .toList(),
                    onChanged: (val) => setState(() => _selectedTentId = val),
                    validator: (val) =>
                        val == null ? 'Bitte Zelt wählen' : null,
                  );
                },
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(l10n.addPlantSection6),
              Text(l10n.addPlantPhaseDesc,
                  style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ChoiceChip(
                    label: Text(l10n.addPlantPhaseGermination),
                    selected: _currentPhase == PlantPhase.germination,
                    selectedColor: AppColors.growGreen,
                    onSelected: (val) =>
                        setState(() => _currentPhase = PlantPhase.germination),
                  ),
                  ChoiceChip(
                    label: Text(l10n.addPlantPhaseVeg),
                    selected: _currentPhase == PlantPhase.veg,
                    selectedColor: AppColors.growGreen,
                    onSelected: (val) =>
                        setState(() => _currentPhase = PlantPhase.veg),
                  ),
                  ChoiceChip(
                    label: Text(l10n.addPlantPhaseFlower),
                    selected: _currentPhase == PlantPhase.flower,
                    selectedColor: AppColors.growGreen,
                    onSelected: (val) =>
                        setState(() => _currentPhase = PlantPhase.flower),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dayInPhaseController,
                decoration: InputDecoration(
                  labelText: l10n.addPlantCurrentDay,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val == null || val.isEmpty ? l10n.addPlantRequired : null,
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(l10n.addPlantSectionGrowLevel),
              Text(l10n.addPlantGrowLevelDesc,
                  style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Column(
                children: [
                  _buildGrowLevelOption(
                    id: 'level1',
                    title: l10n.growLevel1,
                    description: l10n.growLevel1Desc,
                    icon: Icons.eco_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildGrowLevelOption(
                    id: 'level2',
                    title: l10n.growLevel2,
                    description: l10n.growLevel2Desc,
                    icon: Icons.science_outlined,
                  ),
                ],
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _savePlant,
                  child: Text(l10n.addPlantSubmit,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => context.go('/'),
                  child: Text(l10n.checkinBack, // using "Zurück" as cancel
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16)),
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
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildGrowLevelOption({
    required String id,
    required String title,
    required String description,
    required IconData icon,
  }) {
    final isSelected = _growLevel == id;

    return InkWell(
      onTap: () => setState(() => _growLevel = id),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.growGreen.withValues(alpha: 0.1)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.growGreen : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected ? AppColors.growGreen : Colors.white54,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.white70 : Colors.white54,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
