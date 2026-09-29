import 'package:flutter/material.dart';
import '../widgets/tip_formatted_text.dart';
import 'package:go_router/go_router.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HardwareAdvisorScreen extends StatefulWidget {
  const HardwareAdvisorScreen({super.key});

  @override
  State<HardwareAdvisorScreen> createState() => _HardwareAdvisorScreenState();
}

class _HardwareAdvisorScreenState extends State<HardwareAdvisorScreen> {
  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Build the list of hardware items
    final items = [
      _HardwareItemData(
        title: l10n.hw_complete_sets_main_title,
        description: l10n.hw_complete_sets_main_desc,
        isRequired: true,
        icon: Icons.star,
        isCompleteSet: true,
        options: [
          HardwareProductOption(
            name: l10n.hw_complete_set_budget_name,
            url: 'https://amazon.de/dp/B000000000',
            description: l10n.hw_complete_set_budget_desc,
          ),
          HardwareProductOption(
            name: l10n.hw_complete_set_balanced_name,
            url: 'https://amazon.de/dp/B000000000',
            description: l10n.hw_complete_set_balanced_desc,
          ),
          HardwareProductOption(
            name: l10n.hw_complete_set_premium_name,
            url: 'https://amazon.de/dp/B000000000',
            description: l10n.hw_complete_set_premium_desc,
          ),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_grow_tentTitle,
        description: l10n.hw_grow_tentDesc,
        isRequired: true,
        icon: Icons.house,
        buyingGuideText: l10n.hw_buying_guide_tent,
        options: [
          HardwareProductOption(name: l10n.hw_option_budget, url: 'https://amazon.de/dp/B000000001'),
          HardwareProductOption(name: l10n.hw_option_premium, url: 'https://amazon.de/dp/B000000001'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_ledTitle,
        description: l10n.hw_ledDesc,
        isRequired: true,
        icon: Icons.lightbulb,
        buyingGuideText: l10n.hw_buying_guide_led,
        options: [
          HardwareProductOption(name: l10n.hw_option_budget, url: 'https://amazon.de/dp/B000000002'),
          HardwareProductOption(name: l10n.hw_option_premium, url: 'https://amazon.de/dp/B000000002'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_exhaustTitle,
        description: l10n.hw_exhaustDesc,
        isRequired: true,
        icon: Icons.air,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000003'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_carbon_filterTitle,
        description: l10n.hw_carbon_filterDesc,
        isRequired: true,
        icon: Icons.filter_alt,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000004'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_circulation_fanTitle,
        description: l10n.hw_circulation_fanDesc,
        isRequired: true,
        icon: Icons.toys,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000005'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_dwc_bucketTitle,
        description: l10n.hw_dwc_bucketDesc,
        isRequired: true,
        icon: Icons.delete,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000006'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_net_potTitle,
        description: l10n.hw_net_potDesc,
        isRequired: true,
        icon: Icons.grid_on,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000007'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_air_pumpTitle,
        description: l10n.hw_air_pumpDesc,
        isRequired: true,
        icon: Icons.bubble_chart,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000008'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_clay_pebblesTitle,
        description: l10n.hw_clay_pebblesDesc,
        isRequired: true,
        icon: Icons.scatter_plot,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000009'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_starter_cubesTitle,
        description: l10n.hw_starter_cubesDesc,
        isRequired: true,
        icon: Icons.crop_square,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000010'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_hydro_nutesTitle,
        description: l10n.hw_hydro_nutesDesc,
        isRequired: true,
        icon: Icons.water_drop,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000011'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_ph_dropsTitle,
        description: l10n.hw_ph_dropsDesc,
        isRequired: true,
        proTip: l10n.hw_ph_dropsProTip,
        icon: Icons.science,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000012'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_ec_meterTitle,
        description: l10n.hw_ec_meterDesc,
        isRequired: true,
        icon: Icons.speed,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000013'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_ph_downTitle,
        description: l10n.hw_ph_downDesc,
        isRequired: true,
        proTip: l10n.hw_ph_downProTip,
        icon: Icons.arrow_downward,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000014'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_ph_upTitle,
        description: l10n.hw_ph_upDesc,
        isRequired: true,
        icon: Icons.arrow_upward,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000015'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_timerTitle,
        description: l10n.hw_timerDesc,
        isRequired: true,
        icon: Icons.timer,
        buyingGuideText: l10n.hw_buying_guide_generic,
        options: [
          HardwareProductOption(name: l10n.hw_option_standard, url: 'https://amazon.de/dp/B000000016'),
        ],
      ),
      _HardwareItemData(
        title: l10n.hw_second_bucketTitle,
        description: l10n.hw_second_bucketDesc,
        isRequired: true,
        proTip: l10n.hw_second_bucketProTip,
        icon: Icons.delete_outline,
      ),
      _HardwareItemData(
        title: l10n.hw_water_pumpTitle,
        description: l10n.hw_water_pumpDesc,
        isRequired: true,
        proTip: l10n.hw_water_pumpProTip,
        icon: Icons.water,
      ),
      _HardwareItemData(
        title: l10n.hw_thermo_hygroTitle,
        description: l10n.hw_thermo_hygroDesc,
        isRequired: false,
        icon: Icons.thermostat,
      ),

      _HardwareItemData(
        title: l10n.hw_scissorsTitle,
        description: l10n.hw_scissorsDesc,
        isRequired: true,
        icon: Icons.cut,
      ),
      _HardwareItemData(
        title: l10n.hw_loupeTitle,
        description: l10n.hw_loupeDesc,
        isRequired: true,
        icon: Icons.search,
      ),
      _HardwareItemData(
        title: l10n.hw_scrog_netTitle,
        description: l10n.hw_scrog_netDesc,
        isRequired: true,
        icon: Icons.grid_4x4,
        requiredLevel: 2,
      ),
    ];

    // Sort: Complete set first, then Required, then Upgrade
    items.sort((a, b) {
      if (a.isCompleteSet) return -1;
      if (b.isCompleteSet) return 1;
      if (a.isRequired == b.isRequired) return 0;
      return a.isRequired ? -1 : 1;
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.hardwareAdvisorTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                itemCount: items.length + 1, // +1 for the intro header
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24.0, top: 8.0),
                      child: Text(
                        "Hier ist alles, was du für deinen DWC-Grow benötigst. Scrolle durch die Liste, um dir einen Überblick zu verschaffen.",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white70,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  
                  final item = items[index - 1];
                  return _HardwareItemCard(
                    item: item,
                    onLaunchUrl: _launchUrl,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.growGreen,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        side: const BorderSide(color: AppColors.growGreen, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () => context.go('/onboarding'),
                      child: const Text(
                        'Zurück',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
                      onPressed: () => context.go('/tent_setup'),
                      child: const Text(
                        'Weiter zum Zeltaufbau',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
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

class _HardwareItemCard extends StatelessWidget {
  final _HardwareItemData item;
  final void Function(String) onLaunchUrl;

  const _HardwareItemCard({
    required this.item,
    required this.onLaunchUrl,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: item.isCompleteSet 
            ? Colors.orangeAccent.withValues(alpha: 0.5) 
            : Colors.transparent,
          width: item.isCompleteSet ? 1.5 : 0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: item.isCompleteSet 
                      ? Colors.orangeAccent.withValues(alpha: 0.1) 
                      : AppColors.growGreen.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.icon,
                    size: 32,
                    color: item.isCompleteSet ? Colors.orangeAccent : AppColors.growGreen,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badges
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          if (item.isCompleteSet)
                            _buildBadge('⭐ ALL-IN-ONE', Colors.orange)
                          else if (item.isRequired)
                            _buildBadge('🔴 PFLICHT', Colors.red)
                          else
                            _buildBadge('🔵 UPGRADE', Colors.blue),
                          if (item.requiredLevel == 2)
                            _buildBadge('🚀 LEVEL 2 PRO', Colors.purpleAccent),
                        ],
                      ),
                      
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TipFormattedText(
              item.proTip != null ? '${item.description}\n\n${item.proTip}' : item.description,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            
            if (item.options.isNotEmpty) ...[
              const SizedBox(height: 16),
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  iconColor: item.isCompleteSet ? Colors.orangeAccent : AppColors.growGreen,
                  collapsedIconColor: Colors.white70,
                  title: Text(
                    item.isCompleteSet ? l10n.hw_buy_idea_list : l10n.hw_buying_guide_title,
                    style: TextStyle(
                      color: item.isCompleteSet ? Colors.orangeAccent : AppColors.growGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  children: [
                    if (item.buyingGuideText != null) ...[
                      Text(
                        item.buyingGuideText!,
                        style: const TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      const SizedBox(height: 12),
                    ],
                    ...item.options.map((opt) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () => onLaunchUrl(opt.url),
                        icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                        label: Text(
                          opt.name,
                          style: const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class HardwareProductOption {
  final String name;
  final String url;
  final String? description;

  HardwareProductOption({required this.name, required this.url, this.description});
}

class _HardwareItemData {
  final String title;
  final String description;
  final bool isRequired;
  final String? proTip;
  final IconData icon;
  final String? buyingGuideText;
  final List<HardwareProductOption> options;
  final bool isCompleteSet;
  final int requiredLevel;

  _HardwareItemData({
    required this.title,
    required this.description,
    required this.isRequired,
    this.proTip,
    required this.icon,
    this.buyingGuideText,
    this.options = const [],
    this.isCompleteSet = false,
    this.requiredLevel = 1,
  });
}
