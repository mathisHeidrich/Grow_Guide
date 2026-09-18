import re

with open('lib/screens/checkin_screen.dart', 'r') as f:
    content = f.read()

pattern = re.compile(r'<<<<<<< HEAD\n\s*_wrapWithInfo\(\n\s*_buildSlide\(\n\s*title: l10n.checkinHealthTitle,\n\s*text: l10n.checkinHealthDesc,\n\s*icon: Icons.eco,\n\s*nextButtonText: l10n.checkinHealthNext,\n\s*onNext: _nextPage,\n\s*showBack:\n\s*_initialRootsNotReached == true \|\| _needsWaterChange,\n\s*\),\n\s*l10n.checkinDeepDiveHealthTitle,\n\s*l10n.checkinDeepDiveHealthText\),\n=======\n\s*_buildSlide\(\n\s*title: l10n.checkinHealthTitle,\n\s*text: l10n.checkinHealthDesc,\n\s*icon: Icons.eco,\n\s*nextButtonText: l10n.checkinHealthNext,\n\s*onNext: _nextPage,\n\s*showBack:\n\s*_initialRootsNotReached == true \|\| _needsWaterChange,\n\s*extraWidget: ElevatedButton\.icon\(\n\s*style: ElevatedButton\.styleFrom\(\n\s*backgroundColor: Colors\.orange\.withOpacity\(0\.2\),\n\s*foregroundColor: Colors\.orangeAccent,\n\s*side: const BorderSide\(color: Colors\.orangeAccent\),\n\s*padding: const EdgeInsets\.symmetric\(vertical: 16\),\n\s*shape: RoundedRectangleBorder\(borderRadius: BorderRadius\.circular\(12\)\),\n\s*\),\n\s*icon: const Icon\(Icons\.healing\),\n\s*label: Text\(l10n\.diagnoseProblemButton, style: const TextStyle\(fontWeight: FontWeight\.bold\)\),\n\s*onPressed: \(\) \{\n\s*context\.push\(\'/problems\?plantId=\$\{widget\.plantId\}\'\);\n\s*\},\n\s*\),\n\s*\),\n>>>>>>> feature-problem-diagnosis', re.MULTILINE)

replacement = """                _wrapWithInfo(
                    _buildSlide(
                      title: l10n.checkinHealthTitle,
                      text: l10n.checkinHealthDesc,
                      icon: Icons.eco,
                      nextButtonText: l10n.checkinHealthNext,
                      onNext: _nextPage,
                      showBack:
                          _initialRootsNotReached == true || _needsWaterChange,
                      extraWidget: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.withOpacity(0.2),
                          foregroundColor: Colors.orangeAccent,
                          side: const BorderSide(color: Colors.orangeAccent),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        icon: const Icon(Icons.healing),
                        label: Text(l10n.diagnoseProblemButton, style: const TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          context.push('/problems?plantId=${widget.plantId}');
                        },
                      ),
                    ),
                    l10n.checkinDeepDiveHealthTitle,
                    l10n.checkinDeepDiveHealthText),"""

content = content.replace('<<<<<<< HEAD\n                _wrapWithInfo(\n                    _buildSlide(\n                      title: l10n.checkinHealthTitle,\n                      text: l10n.checkinHealthDesc,\n                      icon: Icons.eco,\n                      nextButtonText: l10n.checkinHealthNext,\n                      onNext: _nextPage,\n                      showBack:\n                          _initialRootsNotReached == true || _needsWaterChange,\n                    ),\n                    l10n.checkinDeepDiveHealthTitle,\n                    l10n.checkinDeepDiveHealthText),\n=======\n                _buildSlide(\n                  title: l10n.checkinHealthTitle,\n                  text: l10n.checkinHealthDesc,\n                  icon: Icons.eco,\n                  nextButtonText: l10n.checkinHealthNext,\n                  onNext: _nextPage,\n                  showBack:\n                      _initialRootsNotReached == true || _needsWaterChange,\n                  extraWidget: ElevatedButton.icon(\n                    style: ElevatedButton.styleFrom(\n                      backgroundColor: Colors.orange.withOpacity(0.2),\n                      foregroundColor: Colors.orangeAccent,\n                      side: const BorderSide(color: Colors.orangeAccent),\n                      padding: const EdgeInsets.symmetric(vertical: 16),\n                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),\n                    ),\n                    icon: const Icon(Icons.healing),\n                    label: Text(l10n.diagnoseProblemButton, style: const TextStyle(fontWeight: FontWeight.bold)),\n                    onPressed: () {\n                      context.push(\'/problems?plantId=${widget.plantId}\');\n                    },\n                  ),\n                ),\n>>>>>>> feature-problem-diagnosis', replacement)

with open('lib/screens/checkin_screen.dart', 'w') as f:
    f.write(content)
