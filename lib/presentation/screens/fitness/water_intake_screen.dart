import 'package:flutter/material.dart';

import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/progress_ring.dart';

/// Screen 24 — Water Intake with live glass counter, ml total, and 8-glass tiles.
class WaterIntakeScreen extends StatelessWidget {
  const WaterIntakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fitness = AppStateScope.of(context).fitness;

    return AuroraScaffold(
      auroraColor: AppColors.physicalFitness,
      body: ListenableBuilder(
        listenable: fitness,
        builder: (context, _) {
          final water = fitness.water;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: 'Water Intake',
                subtitle: 'Daily hydration goal: ${water.goalGlasses} glasses',
                titleColor: AppColors.physicalFitness,
              ),
              const Spacer(),
              Center(
                child: ProgressRing(
                  progress: water.progress,
                  accentColor: AppColors.sleep,
                  size: 220,
                  strokeWidth: 14,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${water.glassesConsumed}',
                        style: const TextStyle(
                          fontSize: 46,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'OF ${water.goalGlasses} GLASSES',
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(letterSpacing: 1.0),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${water.consumedMl} ml / ${water.goalMl} ml',
                        style: const TextStyle(
                          color: AppColors.sleep,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(water.goalGlasses, (index) {
                  final filled = index < water.glassesConsumed;
                  return Expanded(
                    child: Container(
                      height: 36,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: filled
                            ? AppColors.sleep
                            : AppColors.surfaceElevated,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: filled ? AppColors.sleep : AppColors.border,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                label: '+ Add Glass (${water.mlPerGlass} ml)',
                backgroundColor: AppColors.sleep,
                onPressed: fitness.addWaterGlass,
              ),
              if (water.glassesConsumed > 0) ...[
                const SizedBox(height: 8),
                Center(
                  child: TextButton(
                    onPressed: fitness.removeWaterGlass,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textSecondary,
                    ),
                    child: const Text('Undo last glass'),
                  ),
                ),
              ],
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
