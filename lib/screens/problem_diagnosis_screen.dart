import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/mock_problems.dart';
import '../models/plant_problem.dart';
import 'package:app/l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class ProblemDiagnosisScreen extends StatefulWidget {
  final int? plantId;

  const ProblemDiagnosisScreen({super.key, this.plantId});

  @override
  State<ProblemDiagnosisScreen> createState() => _ProblemDiagnosisScreenState();
}

class _ProblemDiagnosisScreenState extends State<ProblemDiagnosisScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String _getLocalizedName(AppLocalizations l10n, String key) {
    switch (key) {
      case 'problemNutrientBurnName': return l10n.problemNutrientBurnName;
      case 'problemPhImbalanceName': return l10n.problemPhImbalanceName;
      case 'problemLightBurnName': return l10n.problemLightBurnName;
      case 'problemCalciumDeficiencyName': return l10n.problemCalciumDeficiencyName;
      default: return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.diagnoseProblemButton),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: mockProblems.length,
              itemBuilder: (context, index) {
                final problem = mockProblems[index];
                final isSelected = index == _currentPage;
                final scale = isSelected ? 1.0 : 0.9;
                
                return TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 300),
                  tween: Tween<double>(begin: scale, end: scale),
                  builder: (context, double value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: _buildProblemCard(context, problem, l10n),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProblemCard(BuildContext context, PlantProblem problem, AppLocalizations l10n) {
    final name = _getLocalizedName(l10n, problem.localizedNameKey);
    
    return GestureDetector(
      onTap: () {
        context.push('/problem_detail/${problem.id}${widget.plantId != null ? '?plantId=${widget.plantId}' : ''}');
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xFF1E1E1E),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  // Using a colored container with an icon as a placeholder since we don't have real images yet.
                  child: Container(
                    color: Colors.grey[800],
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 80,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Details ansehen',
                        style: TextStyle(
                          color: AppColors.growGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
