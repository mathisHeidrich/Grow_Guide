import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/theme/app_colors.dart';
import '../providers/settings_provider.dart';

class WaterSetupScreen extends ConsumerStatefulWidget {
  final bool isFromSettings;
  const WaterSetupScreen({super.key, this.isFromSettings = false});

  @override
  ConsumerState<WaterSetupScreen> createState() => _WaterSetupScreenState();
}

class _WaterSetupScreenState extends ConsumerState<WaterSetupScreen> {
  int _currentStep = 0;
  String? _selectedEc;
  String? _selectedChlorine;

  void _nextStep() {
    if (_currentStep == 0 && _selectedEc == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bitte wähle eine Option aus.')),
      );
      return;
    }
    if (_currentStep == 1 && _selectedChlorine == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bitte wähle eine Option aus.')),
      );
      return;
    }

    if (_currentStep < 1) {
      setState(() => _currentStep++);
    } else {
      _finishSetup();
    }
  }

  Future<void> _finishSetup() async {
    // Speichere den EC-Wert (Chlor wird absichtlich nicht gespeichert)
    await ref.read(settingsNotifierProvider).updateSettings(
          waterEcLevel: _selectedEc,
        );
    
    if (!mounted) return;
    
    if (widget.isFromSettings) {
      context.pop(); // Zurück zu den Einstellungen
    } else {
      context.go('/tent_setup');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.waterSetupTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: widget.isFromSettings ? const BackButton() : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Progress Indicator
              Row(
                children: [
                  Expanded(
                    child: _buildProgressSegment(isActive: true),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildProgressSegment(isActive: _currentStep >= 1),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Step Content
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _currentStep == 0
                      ? _buildStep1(l10n)
                      : _buildStep2(l10n),
                ),
              ),
              
              // Settings Hint (nur im Onboarding)
              if (!widget.isFromSettings) ...[
                const SizedBox(height: 16),
                Text(
                  l10n.waterSetupSettingsHint,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
              ],
              
              // Next Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.growGreen,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _nextStep,
                child: Text(
                  l10n.waterSetupNext,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSegment({required bool isActive}) {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.growGreen : AppColors.surface,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildStep1(AppLocalizations l10n) {
    return ListView(
      key: const ValueKey('step1'),
      children: [
        Text(
          l10n.waterSetupStep1Title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.waterSetupStep1Desc,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 24),
        
        _buildSelectionCard(
          title: l10n.waterSetupEcSoft,
          value: 'soft',
          groupValue: _selectedEc,
          onChanged: (val) => setState(() => _selectedEc = val),
          feedback: l10n.waterSetupEcSoftFeedback,
          color: Colors.green,
        ),
        _buildSelectionCard(
          title: l10n.waterSetupEcPerfect,
          value: 'perfect',
          groupValue: _selectedEc,
          onChanged: (val) => setState(() => _selectedEc = val),
          feedback: l10n.waterSetupEcPerfectFeedback,
          color: Colors.greenAccent,
        ),
        _buildSelectionCard(
          title: l10n.waterSetupEcHard,
          value: 'hard',
          groupValue: _selectedEc,
          onChanged: (val) => setState(() => _selectedEc = val),
          feedback: l10n.waterSetupEcHardFeedback,
          color: Colors.orange,
        ),
        _buildSelectionCard(
          title: l10n.waterSetupEcTooHard,
          value: 'too_hard',
          groupValue: _selectedEc,
          onChanged: (val) => setState(() => _selectedEc = val),
          feedback: l10n.waterSetupEcTooHardFeedback,
          color: Colors.red,
        ),
        _buildSelectionCard(
          title: l10n.waterSetupEcUnknown,
          value: 'unknown',
          groupValue: _selectedEc,
          onChanged: (val) => setState(() => _selectedEc = val),
          feedback: l10n.waterSetupEcUnknownFeedback,
          color: Colors.grey,
        ),
        
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline, color: Colors.blue, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.waterSetupStep1Tip,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildStep2(AppLocalizations l10n) {
    return ListView(
      key: const ValueKey('step2'),
      children: [
        Text(
          l10n.waterSetupStep2Title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.waterSetupStep2Desc,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 24),
        
        _buildSelectionCard(
          title: l10n.waterSetupChlorineYes,
          value: 'yes',
          groupValue: _selectedChlorine,
          onChanged: (val) => setState(() => _selectedChlorine = val),
        ),
        _buildSelectionCard(
          title: l10n.waterSetupChlorineNo,
          value: 'no',
          groupValue: _selectedChlorine,
          onChanged: (val) => setState(() => _selectedChlorine = val),
        ),
        _buildSelectionCard(
          title: l10n.waterSetupChlorineUnknown,
          value: 'unknown',
          groupValue: _selectedChlorine,
          onChanged: (val) => setState(() => _selectedChlorine = val),
        ),
        
        const SizedBox(height: 24),
        if (_selectedChlorine == 'yes' || _selectedChlorine == 'unknown')
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.withValues(alpha: 0.5)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.waterSetupChlorineFeedback,
                    style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildSelectionCard({
    required String title,
    required String value,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
    String? feedback,
    Color? color,
  }) {
    final isSelected = value == groupValue;
    final primaryColor = color ?? AppColors.growGreen;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () => onChanged(value),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor.withValues(alpha: 0.1) : AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? primaryColor : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    color: isSelected ? primaryColor : Colors.white54,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              if (isSelected && feedback != null) ...[
                const SizedBox(height: 12),
                Text(
                  feedback,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
