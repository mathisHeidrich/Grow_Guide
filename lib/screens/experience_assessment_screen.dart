import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/theme/app_colors.dart';
import '../providers/database_provider.dart';

class ExperienceAssessmentScreen extends ConsumerStatefulWidget {
  const ExperienceAssessmentScreen({super.key});

  @override
  ConsumerState<ExperienceAssessmentScreen> createState() => _ExperienceAssessmentScreenState();
}

class _ExperienceAssessmentScreenState extends ConsumerState<ExperienceAssessmentScreen> {
  String? _selectedLevel;

  Future<void> _saveAndContinue() async {
    if (_selectedLevel == null) return;
    
    final db = ref.read(databaseProvider).db;
    final settings = await (db.select(db.appSettingsTable)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();
    
    if (settings != null) {
      await db.update(db.appSettingsTable).replace(
        settings.copyWith(experienceLevel: _selectedLevel),
      );
    }
    
    if (!mounted) return;
    
    // Nach der Auswahl geht es direkt in den Hardware-Ratgeber
    context.go('/hardware_advisor');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Icon(Icons.psychology, size: 80, color: AppColors.growGreen),
              const SizedBox(height: 32),
              Text(
                l10n.experienceTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.experienceDesc,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              
              Expanded(
                child: ListView(
                  children: [
                    _buildOption(
                      id: 'beginner',
                      title: l10n.experienceLevelBeginner,
                      description: l10n.experienceLevelBeginnerDesc,
                      icon: Icons.eco_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildOption(
                      id: 'soil',
                      title: l10n.experienceLevelSoil,
                      description: l10n.experienceLevelSoilDesc,
                      icon: Icons.yard_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildOption(
                      id: 'pro',
                      title: l10n.experienceLevelPro,
                      description: l10n.experienceLevelProDesc,
                      icon: Icons.science_outlined,
                    ),
                  ],
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.growGreen,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _selectedLevel == null ? null : _saveAndContinue,
                child: const Text(
                  "Weiter",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required String id,
    required String title,
    required String description,
    required IconData icon,
  }) {
    final isSelected = _selectedLevel == id;
    
    return InkWell(
      onTap: () => setState(() => _selectedLevel = id),
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
