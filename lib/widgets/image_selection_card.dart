import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ImageSelectionCard extends StatelessWidget {
  final String leftImagePath;
  final String rightImagePath;
  final String leftTitle;
  final String rightTitle;
  final String leftSubtitle;
  final String rightSubtitle;
  final VoidCallback onLeftSelected;
  final VoidCallback onRightSelected;
  final Color leftAccentColor;
  final Color rightAccentColor;

  const ImageSelectionCard({
    super.key,
    required this.leftImagePath,
    required this.rightImagePath,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftSubtitle,
    required this.rightSubtitle,
    required this.onLeftSelected,
    required this.onRightSelected,
    this.leftAccentColor = Colors.white24,
    this.rightAccentColor = AppColors.growGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildOption(
            context,
            imagePath: leftImagePath,
            title: leftTitle,
            subtitle: leftSubtitle,
            onTap: onLeftSelected,
            color: leftAccentColor,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildOption(
            context,
            imagePath: rightImagePath,
            title: rightTitle,
            subtitle: rightSubtitle,
            onTap: onRightSelected,
            color: rightAccentColor,
          ),
        ),
      ],
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
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
