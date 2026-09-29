import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../models/plant.dart';
import '../theme/app_colors.dart';

class TentDialog extends StatefulWidget {
  final Tent? existingTent;

  const TentDialog({super.key, this.existingTent});

  @override
  State<TentDialog> createState() => _TentDialogState();
}

class _TentDialogState extends State<TentDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _wattage;
  late String _lampType;
  late String _lightSchedule;

  @override
  void initState() {
    super.initState();
    _name = widget.existingTent?.name ?? '';
    _wattage = widget.existingTent?.lampWattage ?? 150;
    _lampType = widget.existingTent?.lampType ?? 'LED';
    _lightSchedule = widget.existingTent?.lightSchedule ?? 'Aus';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Text(
        widget.existingTent == null
            ? 'Neues Zelt erstellen'
            : 'Zelt bearbeiten',
        style: const TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Zelt Name'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Bitte eingeben' : null,
                onSaved: (val) => _name = val!,
              ),
              if (widget.existingTent != null) ...[
                const SizedBox(height: 16),
                const Text('Lichtzyklus',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'Aus', label: Text('Aus')),
                      ButtonSegment(value: '18/6', label: Text('18/6')),
                      ButtonSegment(value: '12/12', label: Text('12/12')),
                      ButtonSegment(value: '24/0', label: Text('24/0')),
                    ],
                    selected: {_lightSchedule},
                    onSelectionChanged: (Set<String> newSelection) {
                      setState(() => _lightSchedule = newSelection.first);
                    },
                  ),
                ),
              ],
              const SizedBox(height: 16),
              const Text('Lampentyp',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: ['LED', 'NDL', 'CMH'].map((type) {
                  return ChoiceChip(
                    label: Text(type),
                    selected: _lampType == type,
                    selectedColor: AppColors.growGreen,
                    onSelected: (val) {
                      if (val) setState(() => _lampType = type);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _wattage.toString(),
                decoration:
                    const InputDecoration(labelText: 'Wattzahl (z.B. 150)'),
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Bitte eingeben';
                  if (int.tryParse(val) == null) return 'Muss eine Zahl sein';
                  return null;
                },
                onSaved: (val) => _wattage = int.parse(val!),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child:
              const Text('Abbrechen', style: TextStyle(color: Colors.white70)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.growGreen,
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final result = TentsCompanion(
                name: drift.Value(_name),
                lampWattage: drift.Value(_wattage),
                lampType: drift.Value(_lampType),
                lightSchedule: drift.Value(_lightSchedule),
              );
              Navigator.pop(context, result);
            }
          },
          child: const Text('Speichern',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
