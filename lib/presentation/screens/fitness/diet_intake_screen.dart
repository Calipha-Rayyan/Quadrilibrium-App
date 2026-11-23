import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../view_models/fitness_view_model.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/primary_button.dart';

/// Screen 25 — Diet Intake with macro bars and today's meals list.
class DietIntakeScreen extends StatelessWidget {
  const DietIntakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fitness = AppStateScope.of(context).fitness;

    return AuroraScaffold(
      auroraColor: AppColors.physicalFitness,
      body: ListenableBuilder(
        listenable: fitness,
        builder: (context, _) {
          final meals = fitness.meals;
          final hasSample = meals.any((m) => m.isSample);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: 'Diet Intake',
                subtitle: hasSample
                    ? 'Sample values for illustration'
                    : 'Your logged meals today',
                titleColor: AppColors.physicalFitness,
              ),
              const SizedBox(height: 18),
              _MacroBarCard(
                label: 'Carbohydrates',
                current: fitness.totalCarbsGrams,
                goal: FitnessViewModel.carbsGoalGrams,
                color: AppColors.achievementGold,
              ),
              const SizedBox(height: 10),
              _MacroBarCard(
                label: 'Protein',
                current: fitness.totalProteinGrams,
                goal: FitnessViewModel.proteinGoalGrams,
                color: AppColors.physicalFitness,
              ),
              const SizedBox(height: 10),
              _MacroBarCard(
                label: 'Fats',
                current: fitness.totalFatsGrams,
                goal: FitnessViewModel.fatsGoalGrams,
                color: AppColors.sleep,
              ),
              const SizedBox(height: 18),
              Text(
                'Today\'s meals',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: meals.isEmpty
                    ? const Center(
                        child: EmptyState(
                          icon: LucideIcons.utensils,
                          title: 'No meals logged today',
                          message: 'Tap Add Meal below to record your food and serving size.',
                          accentColor: AppColors.physicalFitness,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.only(bottom: 12),
                        itemCount: meals.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final meal = meals[index];
                          final sampleTag = meal.isSample ? ' (sample)' : '';
                          return AppCard(
                            title: meal.foodName,
                            subtitle:
                                '${meal.servingSize.label} · ${meal.calories} kcal$sampleTag',
                            icon: LucideIcons.utensils,
                            accentColor: AppColors.physicalFitness,
                            showChevron: false,
                            trailing: IconButton(
                              tooltip: 'Delete meal',
                              onPressed: () => fitness.deleteMeal(meal.id),
                              icon: const Icon(
                                LucideIcons.trash2,
                                size: 18,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Add Meal',
                backgroundColor: AppColors.physicalFitness,
                onPressed: () => context.push(RouteNames.addMeal),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

class _MacroBarCard extends StatelessWidget {
  const _MacroBarCard({
    required this.label,
    required this.current,
    required this.goal,
    required this.color,
  });

  final String label;
  final int current;
  final int goal;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final progress = goal <= 0 ? 0.0 : (current / goal).clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: Theme.of(context).textTheme.titleMedium),
              Text(
                '$current / $goal g',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.pill),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: AppColors.surfaceElevated,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
