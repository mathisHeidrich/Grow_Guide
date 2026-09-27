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
  int _selectedMethod = 1;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: Text(l10n.waterChangeTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.surface,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.checkinDeepDiveWaterChangeRecTitle,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 16),
                        Text(l10n.checkinDeepDiveWaterChangeRecText,
                            style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.5)),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.growGreen,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(l10n.generalUnderstood,
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildExpandableMethodCard(
                        context,
                        methodIndex: 1,
                        title: l10n.waterChangeMethod1Title,
                        content: l10n.waterChangeMethod1Desc,
                        icon: Icons.waves,
                        isRecommended: true,
                      ),
                      const SizedBox(height: 16),
                      _buildExpandableMethodCard(
                        context,
                        methodIndex: 2,
                        title: l10n.waterChangeMethod2Title,
                        content: l10n.waterChangeMethod2Desc,
                        icon: Icons.wash,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
                  context.pop(true);
                },
                child: Text(
                  l10n.waterChangeDone,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableMethodCard(
    BuildContext context, {
    required int methodIndex,
    required String title,
    required String content,
    required IconData icon,
    bool isRecommended = false,
  }) {
    final isSelected = _selectedMethod == methodIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = methodIndex;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: AppColors.growGreen, width: 2)
              : Border.all(color: Colors.transparent, width: 2),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon,
                    color: isSelected ? AppColors.growGreen : Colors.white54,
                    size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? (isRecommended ? AppColors.growGreen : Colors.white) : Colors.white54,
                        ),
                  ),
                ),
                Icon(
                  isSelected ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.white54,
                ),
              ],
            ),
            if (isSelected) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white10),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_outlined, color: Colors.white24, size: 40),
                      SizedBox(height: 8),
                      Text("Bild-Platzhalter", style: TextStyle(color: Colors.white24)),
                    ],
                  ),
                ),
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
          ],
        ),
      ),
    );
  }
}
