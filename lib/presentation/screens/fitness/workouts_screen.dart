import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../../data/models/workout_model.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';

/// Screen 22 — Workouts & Stretches list with category filters.
class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  WorkoutCategory? _filter;

  @override
  Widget build(BuildContext context) {
    final fitness = AppStateScope.of(context).fitness;

    return AuroraScaffold(
      auroraColor: AppColors.physicalFitness,
      body: ListenableBuilder(
        listenable: fitness,
        builder: (context, _) {
          final all = fitness.workouts;
          final filtered = _filter == null
              ? all
              : all.where((w) => w.category == _filter).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: 'Workouts & Stretches',
                subtitle:
                    '${fitness.completedWorkoutsCount} of ${all.length} completed this week',
                titleColor: AppColors.physicalFitness,
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 10,
                children: [
                  _FilterPill(
                    label: 'All',
                    selected: _filter == null,
                    onTap: () => setState(() => _filter = null),
                  ),
                  _FilterPill(
                    label: 'Workouts',
                    selected: _filter == WorkoutCategory.workout,
                    onTap: () =>
                        setState(() => _filter = WorkoutCategory.workout),
                  ),
                  _FilterPill(
                    label: 'Stretches',
                    selected: _filter == WorkoutCategory.stretch,
                    onTap: () =>
                        setState(() => _filter = WorkoutCategory.stretch),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: filtered.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final workout = filtered[index];
                    return AppCard(
                      title: workout.title,
                      subtitle:
                          '${workout.exercises.length} exercises · ${workout.durationMinutes} min',
                      icon: LucideIcons.dumbbell,
                      accentColor: AppColors.physicalFitness,
                      showChevron: false,
                      onTap: () => context.push(
                        RouteNames.workoutDetailPath(workout.id),
                      ),
                      trailing: Text(
                        workout.isCompleted ? 'Done ✓' : 'Start',
                        style: TextStyle(
                          color: workout.isCompleted
                              ? AppColors.success
                              : AppColors.physicalFitness,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      showCheckmark: true,
      checkmarkColor: AppColors.physicalFitness,
      selectedColor: AppColors.physicalFitness.withValues(alpha: 0.18),
      backgroundColor: AppColors.surfaceCard,
      side: BorderSide(
        color: selected ? AppColors.physicalFitness : AppColors.border,
      ),
      labelStyle: TextStyle(
        color: selected ? AppColors.physicalFitness : AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      onSelected: (_) => onTap(),
    );
  }
}
