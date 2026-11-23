import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';

/// Screen 21 — Physical Fitness Dashboard.
class PhysicalFitnessScreen extends StatelessWidget {
  const PhysicalFitnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fitness = AppStateScope.of(context).fitness;

    return AuroraScaffold(
      auroraColor: AppColors.physicalFitness,
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: ListenableBuilder(
        listenable: fitness,
        builder: (context, _) {
          final water = fitness.water;
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppHeader(
                  title: 'Physical Fitness',
                  subtitle: 'Move, hydrate, fuel',
                  titleColor: AppColors.physicalFitness,
                ),
                const SizedBox(height: 24),
                AppCard(
                  title: 'Workouts and Stretches',
                  subtitle: 'Guided routines',
                  icon: LucideIcons.dumbbell,
                  accentColor: AppColors.physicalFitness,
                  onTap: () => context.push(RouteNames.workouts),
                ),
                const SizedBox(height: 12),
                AppCard(
                  title: 'Water Intake',
                  subtitle:
                      '${water.glassesConsumed} of ${water.goalGlasses} glasses today',
                  icon: LucideIcons.droplet,
                  accentColor: AppColors.physicalFitness,
                  onTap: () => context.push(RouteNames.waterIntake),
                ),
                const SizedBox(height: 12),
                AppCard(
                  title: 'Diet Intake',
                  subtitle: 'Carbs, protein and fats',
                  icon: LucideIcons.utensils,
                  accentColor: AppColors.physicalFitness,
                  onTap: () => context.push(RouteNames.dietIntake),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
