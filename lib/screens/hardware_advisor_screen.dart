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
  final PageController _pageController = PageController();

  void _nextPage(int totalPages) {
    if (_pageController.page!.toInt() < totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/water_guide');
    }
  }

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
        isRequired: false,
        proTip: l10n.hw_second_bucketProTip,
        icon: Icons.delete_outline,
      ),
      _HardwareItemData(
        title: l10n.hw_water_pumpTitle,
        description: l10n.hw_water_pumpDesc,
        isRequired: false,
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
        title: l10n.hw_chillerTitle,
        description: l10n.hw_chillerDesc,
        isRequired: false,
        icon: Icons.ac_unit,
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
      body: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!item.isCompleteSet)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: item.isRequired
                            ? Colors.red.withValues(alpha: 0.2)
                            : Colors.blue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: item.isRequired ? Colors.red : Colors.blue,
                        ),
                      ),
                      child: Text(
                        item.isRequired ? '🔴 PFLICHT' : '🔵 UPGRADE',
                        style: TextStyle(
                          color: item.isRequired ? Colors.red : Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                if (item.isCompleteSet)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.orange,
                        ),
                      ),
                      child: const Text(
                        '⭐ ALL-IN-ONE',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                const Spacer(),
                Icon(
                  item.icon,
                  size: 100,
                  color: item.isCompleteSet ? Colors.orangeAccent : AppColors.growGreen,
                ),
                const SizedBox(height: 32),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TipFormattedText(
                  item.proTip != null ? '${item.description}\n\n${item.proTip}' : item.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
                  textAlign: TextAlign.center,
                ),
                if (item.isCompleteSet && item.options.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  ...item.options.map((opt) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Card(
                      color: AppColors.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.orangeAccent.withValues(alpha: 0.5), width: 1.5),
                      ),
                      margin: EdgeInsets.zero,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          iconColor: Colors.orangeAccent,
                          collapsedIconColor: Colors.orangeAccent,
                          title: Row(
                            children: [
                              const Icon(Icons.star_border, color: Colors.orangeAccent, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  opt.name,
                                  style: const TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (opt.description != null)
                                    Text(
                                      opt.description!,
                                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                                    ),
                                  const SizedBox(height: 16),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () => _launchUrl(opt.url),
                                    icon: const Icon(Icons.shopping_cart, size: 20),
                                    label: Text(
                                      l10n.hw_buy_idea_list,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
                if (!item.isCompleteSet && item.options.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Card(
                    color: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    margin: EdgeInsets.zero,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        iconColor: AppColors.growGreen,
                        collapsedIconColor: Colors.white70,
                        title: Text(
                          l10n.hw_buying_guide_title,
                          style: const TextStyle(
                            color: AppColors.growGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (item.buyingGuideText != null)
                                  Text(
                                    item.buyingGuideText!,
                                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                                  ),
                                const SizedBox(height: 16),
                                ...item.options.map((opt) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () => _launchUrl(opt.url),
                                    icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                                    label: Text(opt.name),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: AppColors.growGreen,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(
                                color: AppColors.growGreen, width: 2),
                          ),
                        ),
                        onPressed: () {
                          if (_pageController.page != null &&
                              _pageController.page!.toInt() > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            if (context.canPop()) {
                              context.pop();
                            }
                          }
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.growGreen,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () => _nextPage(items.length),
                        child: Text(
                          index == items.length - 1
                              ? 'Weiter zur Wasser-Masterclass'
                              : 'Weiter',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
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

  _HardwareItemData({
    required this.title,
    required this.description,
    required this.isRequired,
    this.proTip,
    required this.icon,
    this.buyingGuideText,
    this.options = const [],
    this.isCompleteSet = false,
  });
}
