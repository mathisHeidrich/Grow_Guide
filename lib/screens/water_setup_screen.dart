import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/theme/app_colors.dart';
import '../providers/settings_provider.dart';
import '../widgets/tip_formatted_text.dart';

class WaterSetupScreen extends ConsumerStatefulWidget {
  final bool isFromSettings;
  const WaterSetupScreen({super.key, this.isFromSettings = false});

  @override
  ConsumerState<WaterSetupScreen> createState() => _WaterSetupScreenState();
}

class _WaterSetupScreenState extends ConsumerState<WaterSetupScreen> {
  final PageController _pageController = PageController();
  
  String? _selectedEc;
  bool _missingMeter = false;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeSetup() async {
    // If the user hasn't selected EC and they clicked "missing meter", save as unknown
    String? finalEc = _missingMeter ? 'unknown' : _selectedEc;
    
    await ref.read(settingsNotifierProvider).updateSettings(
          waterEcLevel: finalEc,
        );
    
    if (!mounted) return;
    
    if (widget.isFromSettings) {
      context.pop(); // Zurück zu den Einstellungen
    } else {
      context.go('/'); // End of onboarding, go to Dashboard
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: widget.isFromSettings ? AppBar(
        title: Text(l10n.waterSetupTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
      ) : null,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildSlide(
              title: l10n.waterSetupIntroTitle,
              text: l10n.waterSetupIntroDesc,
              icon: Icons.water_drop,
              nextButtonText: l10n.waterSetupIntroNext,
              onNext: _nextPage,
            ),
            _buildEcMeasureSlide(l10n),
            _buildEcFeedbackSlide(l10n),
            _buildSlide(
              title: l10n.waterSetupChlorineTitle,
              text: l10n.waterSetupChlorineDesc,
              icon: Icons.science,
              iconColor: Colors.orangeAccent,
              nextButtonText: l10n.waterSetupFinish,
              onNext: _completeSetup,
              showBack: true,
              extraWidget: Container(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEcMeasureSlide(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  const Icon(Icons.speed, size: 100, color: AppColors.growGreen),
                  const SizedBox(height: 32),
                  Text(
                    l10n.waterSetupEcMeasureTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TipFormattedText(
                    l10n.waterSetupEcMeasureDesc,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  
                  _buildSelectionCard(
                    title: '0.0 - 0.3 (Sehr weich)',
                    value: 'soft',
                    groupValue: _selectedEc,
                    onChanged: (val) {
                      setState(() {
                        _selectedEc = val;
                        _missingMeter = false;
                      });
                    },
                    color: Colors.green,
                  ),
                  _buildSelectionCard(
                    title: '0.4 - 0.6 (Optimal)',
                    value: 'perfect',
                    groupValue: _selectedEc,
                    onChanged: (val) {
                      setState(() {
                        _selectedEc = val;
                        _missingMeter = false;
                      });
                    },
                    color: Colors.greenAccent,
                  ),
                  _buildSelectionCard(
                    title: '0.7 - 0.9 (Hart)',
                    value: 'hard',
                    groupValue: _selectedEc,
                    onChanged: (val) {
                      setState(() {
                        _selectedEc = val;
                        _missingMeter = false;
                      });
                    },
                    color: Colors.orange,
                  ),
                  _buildSelectionCard(
                    title: '> 1.0 (Sehr hart)',
                    value: 'too_hard',
                    groupValue: _selectedEc,
                    onChanged: (val) {
                      setState(() {
                        _selectedEc = val;
                        _missingMeter = false;
                      });
                    },
                    color: Colors.red,
                  ),
                  
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _missingMeter ? AppColors.surface : Colors.transparent,
                      foregroundColor: _missingMeter ? Colors.white : Colors.white70,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: _missingMeter ? Colors.orangeAccent : Colors.white30,
                          width: _missingMeter ? 2 : 1,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _missingMeter = true;
                        _selectedEc = null;
                      });
                    },
                    child: Text(
                      l10n.waterSetupEcMissingBtn,
                      style: TextStyle(
                        fontWeight: _missingMeter ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          
          Row(
            children: [
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    side: const BorderSide(color: Colors.white54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _previousPage,
                  child: const Text('Zurück'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (_selectedEc == null && !_missingMeter) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Bitte wähle einen Wert aus oder klicke "Ich habe mein Messgerät noch nicht".')),
                      );
                      return;
                    }
                    _nextPage();
                  },
                  child: Text(
                    l10n.waterSetupNext,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildEcFeedbackSlide(AppLocalizations l10n) {
    String title = '';
    String text = '';
    IconData icon = Icons.info_outline;
    Color iconColor = AppColors.growGreen;

    if (_missingMeter) {
      title = "Alles klar!";
      text = l10n.waterSetupEcMissingHint;
      icon = Icons.hourglass_empty;
      iconColor = Colors.orangeAccent;
    } else {
      switch (_selectedEc) {
        case 'soft':
          title = "Sehr weiches Wasser";
          text = l10n.waterSetupEcSoftFeedback;
          icon = Icons.water;
          iconColor = Colors.blue;
          break;
        case 'perfect':
          title = "Optimaler EC-Wert";
          text = l10n.waterSetupEcPerfectFeedback;
          icon = Icons.star;
          iconColor = Colors.greenAccent;
          break;
        case 'hard':
          title = "Hartes Wasser";
          text = l10n.waterSetupEcHardFeedback;
          icon = Icons.warning_amber_rounded;
          iconColor = Colors.orange;
          break;
        case 'too_hard':
          title = "Sehr hartes Wasser";
          text = l10n.waterSetupEcTooHardFeedback;
          icon = Icons.error_outline;
          iconColor = Colors.red;
          break;
        default:
          title = "Dein Wasser";
          text = "";
      }
    }

    return _buildSlide(
      title: title,
      text: text,
      icon: icon,
      iconColor: iconColor,
      nextButtonText: l10n.waterSetupNext,
      onNext: _nextPage,
      showBack: true,
    );
  }

  Widget _buildSlide({
    required String title,
    required String text,
    required IconData icon,
    Color iconColor = AppColors.growGreen,
    required String nextButtonText,
    required VoidCallback onNext,
    bool showBack = false,
    Widget? extraWidget,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  Icon(icon, size: 100, color: iconColor),
                  const SizedBox(height: 32),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  TipFormattedText(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  if (extraWidget != null) ...[
                    const SizedBox(height: 32),
                    extraWidget,
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          Row(
            children: [
              if (showBack)
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      side: const BorderSide(color: Colors.white54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: _previousPage,
                    child: const Text('Zurück'),
                  ),
                ),
              if (showBack) const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.growGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: onNext,
                  child: Text(
                    nextButtonText,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSelectionCard({
    required String title,
    required String value,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
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
          child: Row(
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
        ),
      ),
    );
  }
}
