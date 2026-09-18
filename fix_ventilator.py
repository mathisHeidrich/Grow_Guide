import re

with open('lib/screens/checkin_screen.dart', 'r') as f:
    content = f.read()

pattern = r'<<<<<<< HEAD\n\s*_wrapWithInfo\(_buildLampSlide\(\), l10n.checkinDeepDiveLampTitle,\n\s*l10n.checkinDeepDiveLampText\),\n\s*_wrapWithInfo\(\n\s*_buildSlide\(\n\s*title: l10n.checkinFinishTitle,\n\s*text: l10n.checkinFinishDesc,\n\s*icon: Icons.check_circle,\n\s*nextButtonText: l10n.checkinFinishNext,\n\s*onNext: _completeCheckin,\n\s*showBack: true,\n\s*\),\n\s*l10n.checkinDeepDiveFinishTitle,\n\s*l10n.checkinDeepDiveFinishText\),\n=======\n\s*_buildLampSlide\(\),\n\s*if \(_needsWaterChange\) _buildVentilatorSlide\(\),\n\s*_buildSlide\(\n\s*title: l10n.checkinFinishTitle,\n\s*text: l10n.checkinFinishDesc,\n\s*icon: Icons.check_circle,\n\s*nextButtonText: l10n.checkinFinishNext,\n\s*onNext: _completeCheckin,\n\s*showBack: true,\n\s*\),\n>>>>>>> feature-ventilator-screen'

replacement = """                _wrapWithInfo(_buildLampSlide(), l10n.checkinDeepDiveLampTitle,
                    l10n.checkinDeepDiveLampText),
                if (_needsWaterChange)
                  _wrapWithInfo(
                      _buildVentilatorSlide(),
                      l10n.checkinVentilatorDeepDiveTitle,
                      l10n.checkinVentilatorDeepDiveText),
                _wrapWithInfo(
                    _buildSlide(
                      title: l10n.checkinFinishTitle,
                      text: l10n.checkinFinishDesc,
                      icon: Icons.check_circle,
                      nextButtonText: l10n.checkinFinishNext,
                      onNext: _completeCheckin,
                      showBack: true,
                    ),
                    l10n.checkinDeepDiveFinishTitle,
                    l10n.checkinDeepDiveFinishText),"""

content = re.sub(pattern, replacement, content)

with open('lib/screens/checkin_screen.dart', 'w') as f:
    f.write(content)
