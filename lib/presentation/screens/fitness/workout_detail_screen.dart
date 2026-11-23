import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';

/// Screen 23 — Workout Detail with interactive exercise steps and completion state.
class WorkoutDetailScreen extends StatelessWidget {
  const WorkoutDetailScreen({super.key, required this.workoutId});

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    final fitness = AppStateScope.of(context).fitness;

    return AuroraScaffold(
      auroraColor: AppColors.physicalFitness,
      body: ListenableBuilder(
        listenable: fitness,
        builder: (context, _) {
          final workout = fitness.workoutById(workoutId);
          if (workout == null) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppHeader(
                  title: 'Workout not found',
                  titleColor: AppColors.physicalFitness,
                ),
              ],
            );
          }

          final total = workout.exercises.length;
          final completed = workout.completedExerciseCount;
          final progress = total == 0 ? 0.0 : completed / total;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: workout.title,
                subtitle: '$total exercises · ${workout.durationMinutes} min',
                titleColor: AppColors.physicalFitness,
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard,
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress: $completed of $total exercises',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 6,
                        backgroundColor: AppColors.surfaceElevated,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          workout.isCompleted
                              ? AppColors.success
                              : AppColors.physicalFitness,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 12),
                  itemCount: workout.exercises.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final step = workout.exercises[index];
                    return InkWell(
                      onTap: () => fitness.toggleExercise(workout.id, step.id),
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      child: Ink(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceCard,
                          borderRadius: BorderRadius.circular(AppRadii.lg),
                          border: Border.all(
                            color: step.isDone
                                ? AppColors.success.withValues(alpha: 0.7)
                                : AppColors.border,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${step.instruction} · ${step.durationLabel}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              step.isDone
                                  ? LucideIcons.circleCheck
                                  : LucideIcons.circle,
                              color: step.isDone
                                  ? AppColors.success
                                  : AppColors.textSecondary,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: workout.isCompleted ? 'Completed ✓' : 'Mark Completed',
                backgroundColor: workout.isCompleted
                    ? AppColors.success
                    : AppColors.physicalFitness,
                onPressed: workout.isCompleted
                    ? null
                    : () {
                        fitness.markWorkoutCompleted(workout.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${workout.title} completed! +${workout.durationMinutes} min logged.',
                            ),
                          ),
                        );
                      },
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
