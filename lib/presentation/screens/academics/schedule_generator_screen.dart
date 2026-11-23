import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/primary_button.dart';

/// Screen 12 — Schedule Generator.
class ScheduleGeneratorScreen extends StatelessWidget {
  const ScheduleGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final academics = AppStateScope.of(context).academics;

    return AuroraScaffold(
      auroraColor: AppColors.academics,
      body: ListenableBuilder(
        listenable: academics,
        builder: (context, _) {
          final tasks = academics.tasks;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: 'Schedule Generator',
                subtitle: tasks.isEmpty
                    ? 'Your study plan'
                    : 'Your study plan · ${tasks.length} tasks',
                titleColor: AppColors.academics,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: tasks.isEmpty
                    ? Center(
                        child: EmptyState(
                          icon: LucideIcons.calendar,
                          title: 'No tasks scheduled',
                          message: 'Add your upcoming quizzes, assignments, or exams to build your study plan.',
                          accentColor: AppColors.academics,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.only(bottom: 16),
                        itemCount: tasks.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return AppCard(
                            title: task.title,
                            subtitle:
                                '${task.type.label} · ${task.deadlineLabel}',
                            icon: task.isCompleted
                                ? LucideIcons.check
                                : LucideIcons.calendar,
                            accentColor: task.isCompleted
                                ? AppColors.success
                                : AppColors.academics,
                            showChevron: false,
                            onTap: () => academics.toggleTaskCompleted(task.id),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  task.durationLabel,
                                  style: const TextStyle(
                                    color: AppColors.academics,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                IconButton(
                                  tooltip: 'Delete task',
                                  onPressed: () {
                                    academics.deleteTask(task.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Removed "${task.title}"',
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    LucideIcons.trash2,
                                    size: 18,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Add Task',
                backgroundColor: AppColors.academics,
                onPressed: () => context.push(RouteNames.newTask),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
