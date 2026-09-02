import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // Build the list of hardware items
    final items = [
      _HardwareItemData(
        title: l10n.hw_grow_tentTitle,
        description: l10n.hw_grow_tentDesc,
        isRequired: true,
        icon: Icons.house,
      ),
      _HardwareItemData(
        title: l10n.hw_ledTitle,
        description: l10n.hw_ledDesc,
        isRequired: true,
        icon: Icons.lightbulb,
      ),
      _HardwareItemData(
        title: l10n.hw_exhaustTitle,
        description: l10n.hw_exhaustDesc,
        isRequired: true,
        icon: Icons.air,
      ),
      _HardwareItemData(
        title: l10n.hw_carbon_filterTitle,
        description: l10n.hw_carbon_filterDesc,
        isRequired: true,
        icon: Icons.filter_alt,
      ),
      _HardwareItemData(
        title: l10n.hw_circulation_fanTitle,
        description: l10n.hw_circulation_fanDesc,
        isRequired: true,
        icon: Icons.toys,
      ),
      _HardwareItemData(
        title: l10n.hw_dwc_bucketTitle,
        description: l10n.hw_dwc_bucketDesc,
        isRequired: true,
        icon: Icons.delete,
      ),
      _HardwareItemData(
        title: l10n.hw_net_potTitle,
        description: l10n.hw_net_potDesc,
        isRequired: true,
        icon: Icons.grid_on,
      ),
      _HardwareItemData(
        title: l10n.hw_air_pumpTitle,
        description: l10n.hw_air_pumpDesc,
        isRequired: true,
        icon: Icons.bubble_chart,
      ),
      _HardwareItemData(
        title: l10n.hw_clay_pebblesTitle,
        description: l10n.hw_clay_pebblesDesc,
        isRequired: true,
        icon: Icons.scatter_plot,
      ),
      _HardwareItemData(
        title: l10n.hw_starter_cubesTitle,
        description: l10n.hw_starter_cubesDesc,
        isRequired: true,
        icon: Icons.crop_square,
      ),
      _HardwareItemData(
        title: l10n.hw_hydro_nutesTitle,
        description: l10n.hw_hydro_nutesDesc,
        isRequired: true,
        icon: Icons.water_drop,
      ),
      _HardwareItemData(
        title: l10n.hw_ph_dropsTitle,
        description: l10n.hw_ph_dropsDesc,
        isRequired: true,
        proTip: l10n.hw_ph_dropsProTip,
        icon: Icons.science,
      ),
      _HardwareItemData(
        title: l10n.hw_ec_meterTitle,
        description: l10n.hw_ec_meterDesc,
        isRequired: true,
        icon: Icons.speed,
      ),
      _HardwareItemData(
        title: l10n.hw_ph_downTitle,
        description: l10n.hw_ph_downDesc,
        isRequired: true,
        proTip: l10n.hw_ph_downProTip,
        icon: Icons.arrow_downward,
      ),
      _HardwareItemData(
        title: l10n.hw_ph_upTitle,
        description: l10n.hw_ph_upDesc,
        isRequired: true,
        icon: Icons.arrow_upward,
      ),
      _HardwareItemData(
        title: l10n.hw_timerTitle,
        description: l10n.hw_timerDesc,
        isRequired: true,
        icon: Icons.timer,
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

    items.sort((a, b) {
      if (a.isRequired == b.isRequired) return 0;
      return a.isRequired ? -1 : 1;
    });

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: item.isRequired ? Colors.red.withOpacity(0.2) : Colors.blue.withOpacity(0.2),
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
                const Spacer(),
                Icon(item.icon, size: 120, color: const Color(0xFF00E676)),
                const SizedBox(height: 48),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
                  textAlign: TextAlign.center,
                ),
                if (item.proTip != null) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF00E676).withOpacity(0.3)),
                    ),
                    child: Text(
                      item.proTip!,
                      style: const TextStyle(color: Color(0xFF00E676)),
                      textAlign: TextAlign.center,
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
                          foregroundColor: const Color(0xFF00E676),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(color: Color(0xFF00E676), width: 2),
                          ),
                        ),
                        onPressed: () {
                          if (_pageController.page != null && _pageController.page!.toInt() > 0) {
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
                          backgroundColor: const Color(0xFF00E676),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () => _nextPage(items.length),
                        child: Text(
                          index == items.length - 1 ? 'Weiter zur Wasser-Masterclass' : 'Weiter',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

class _HardwareItemData {
  final String title;
  final String description;
  final bool isRequired;
  final String? proTip;
  final IconData icon;

  _HardwareItemData({
    required this.title,
    required this.description,
    required this.isRequired,
    this.proTip,
    required this.icon,
  });
}
