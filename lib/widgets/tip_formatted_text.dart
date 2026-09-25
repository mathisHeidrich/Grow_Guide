import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class TipFormattedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TipFormattedText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the text contains a tip indicator
    final tipRegex = RegExp(r'(\n\n)?(?:TIPP|Tipp|Pro-Tipp):\s*(.*)', dotAll: true);
    final match = tipRegex.firstMatch(text);

    if (match != null) {
      final beforeText = text.substring(0, match.start).trim();
      final tipText = match.group(2)?.trim() ?? '';

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (beforeText.isNotEmpty) ...[
            Text(
              beforeText,
              style: style,
              textAlign: textAlign,
            ),
            const SizedBox(height: 24),
          ],
          if (tipText.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.growGreen.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: AppColors.growGreen,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Tipp: $tipText',
                      style: const TextStyle(
                        color: AppColors.growGreen,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    }

    // Fallback if no tip is found
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
