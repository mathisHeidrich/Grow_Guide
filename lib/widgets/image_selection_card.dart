import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:app/l10n/app_localizations.dart';

class ImageSelectionCard extends StatefulWidget {
  final String leftImagePath;
  final String rightImagePath;
  final String leftTitle;
  final String rightTitle;
  final String leftSubtitle;
  final String rightSubtitle;
  
  /// Callback when the confirm button is pressed. 
  /// Passes 0 if left is selected, 1 if right is selected.
  final void Function(int) onConfirm;
  final Widget? backButton;

  const ImageSelectionCard({
    super.key,
    required this.leftImagePath,
    required this.rightImagePath,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftSubtitle,
    required this.rightSubtitle,
    required this.onConfirm,
    this.backButton,
  });

  @override
  State<ImageSelectionCard> createState() => _ImageSelectionCardState();
}

class _ImageSelectionCardState extends State<ImageSelectionCard> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildOption(
                context,
                index: 0,
                imagePath: widget.leftImagePath,
                title: widget.leftTitle,
                subtitle: widget.leftSubtitle,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildOption(
                context,
                index: 1,
                imagePath: widget.rightImagePath,
                title: widget.rightTitle,
                subtitle: widget.rightSubtitle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            if (widget.backButton != null) ...[
              Expanded(flex: 1, child: widget.backButton!),
              const SizedBox(width: 16),
            ],
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.growGreen,
                  foregroundColor: Colors.black,
                  disabledBackgroundColor: Colors.grey[800],
                  disabledForegroundColor: Colors.white54,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: _selectedIndex == null ? null : () => widget.onConfirm(_selectedIndex!),
                child: Text(
                  l10n.checkinNext,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required int index,
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? AppColors.growGreen : Colors.transparent;
    
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isSelected ? AppColors.growGreen : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
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
