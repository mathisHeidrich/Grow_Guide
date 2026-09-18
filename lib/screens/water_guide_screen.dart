import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/l10n/app_localizations.dart';

class WaterGuideScreen extends StatelessWidget {
  const WaterGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(l10n.waterGuideTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildChapterCard(
            context,
            title: l10n.waterGuideChap1Title,
            content: l10n.waterGuideChap1Desc,
            icon: Icons.autorenew,
          ),
          const SizedBox(height: 24),
          _buildChapterCard(
            context,
            title: l10n.waterGuideChap2Title,
            content: l10n.waterGuideChap2Desc,
            icon: Icons.speed,
            additionalContent: Column(
              children: [
                const SizedBox(height: 16),
                _buildEcStatus(
                  context,
                  color: Colors.green,
                  title: l10n.waterGuideEc0_2,
                  desc: l10n.waterGuideEc0_2Desc,
                ),
                const SizedBox(height: 12),
                _buildEcStatus(
                  context,
                  color: Colors.green,
                  title: l10n.waterGuideEc0_4,
                  desc: l10n.waterGuideEc0_4Desc,
                ),
                const SizedBox(height: 12),
                _buildEcStatus(
                  context,
                  color: Colors.yellow,
                  title: l10n.waterGuideEc0_7,
                  desc: l10n.waterGuideEc0_7Desc,
                ),
                const SizedBox(height: 12),
                _buildEcStatus(
                  context,
                  color: Colors.red,
                  title: l10n.waterGuideEcHard,
                  desc: l10n.waterGuideEcHardDesc,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildChapterCard(
            context,
            title: l10n.waterGuideChap3Title,
            content: l10n.waterGuideChap3Desc,
            icon: Icons.water_drop,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00E676),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => context.go('/tent_setup'),
            child: Text(
              l10n.waterGuideNext,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildChapterCard(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
    Widget? additionalContent,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF00E676), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
          if (additionalContent != null) additionalContent,
        ],
      ),
    );
  }

  Widget _buildEcStatus(
    BuildContext context, {
    required Color color,
    required String title,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle, color: color, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
