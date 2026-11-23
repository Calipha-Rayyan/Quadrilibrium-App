import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/empty_state.dart';

/// Screen 28 — Sleep History timeline.
class SleepHistoryScreen extends StatelessWidget {
  const SleepHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sleep = AppStateScope.of(context).sleep;

    return AuroraScaffold(
      auroraColor: AppColors.sleep,
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: ListenableBuilder(
        listenable: sleep,
        builder: (context, _) {
          final records = sleep.records;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(
                title: 'Sleep History',
                subtitle: 'Your recent nights',
                titleColor: AppColors.sleep,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: records.isEmpty
                    ? const Center(
                        child: EmptyState(
                          icon: LucideIcons.moon,
                          title: 'No sleep records yet',
                          message: 'Log your bedtime and wake-up time on the Sleep Tracker screen to see your history.',
                          accentColor: AppColors.sleep,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.only(bottom: 24),
                        itemCount: records.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final rec = records[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceCard,
                              borderRadius: BorderRadius.circular(AppRadii.lg),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: AppColors.sleep,
                                    borderRadius: BorderRadius.circular(
                                      AppRadii.pill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        rec.dateLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        rec.formattedRange,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  rec.formattedDuration,
                                  style: const TextStyle(
                                    color: AppColors.sleep,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                IconButton(
                                  tooltip: 'Delete sleep record',
                                  onPressed: () => sleep.deleteRecord(rec.id),
                                  icon: const Icon(
                                    LucideIcons.trash2,
                                    size: 17,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
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
