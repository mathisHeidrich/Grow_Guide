import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'package:app/theme/app_colors.dart';

class WaterChangeScreen extends StatefulWidget {
  const WaterChangeScreen({super.key});

  @override
  State<WaterChangeScreen> createState() => _WaterChangeScreenState();
}

class _WaterChangeScreenState extends State<WaterChangeScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.waterChangeTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildMethodCard(
            context,
            title: l10n.waterChangeMethod1Title,
            content: l10n.waterChangeMethod1Desc,
            icon: Icons.waves,
            isRecommended: true,
          ),
          const SizedBox(height: 24),
          _buildMethodCard(
            context,
            title: l10n.waterChangeMethod2Title,
            content: l10n.waterChangeMethod2Desc,
            icon: Icons.wash,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.growGreen,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              // Return true to indicate the water change was completed
              context.pop(true);
            },
            child: Text(
              l10n.waterChangeDone,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodCard(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
    bool isRecommended = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: isRecommended
            ? Border.all(color: AppColors.growGreen, width: 2)
            : null,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon,
                  color: isRecommended ? AppColors.growGreen : Colors.white,
                  size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            isRecommended ? AppColors.growGreen : Colors.white,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}
