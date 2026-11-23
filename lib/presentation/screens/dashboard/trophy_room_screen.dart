import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/achievement_card.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/empty_state.dart';

/// Screen 07 — Trophy Room separating Unlocked and Locked achievements.
class TrophyRoomScreen extends StatelessWidget {
  const TrophyRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trophies = AppStateScope.of(context).trophies;

    return AuroraScaffold(
      auroraColor: AppColors.achievementGold,
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
      body: ListenableBuilder(
        listenable: trophies,
        builder: (context, _) {
          final unlocked = trophies.unlockedAchievements;
          final locked = trophies.lockedAchievements;

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trophy Room',
                  style: Theme.of(context).textTheme.headlineLarge
                      ?.copyWith(color: AppColors.achievementGold),
                ),
                const SizedBox(height: 4),
                Text(
                  '${unlocked.length} unlocked · ${locked.length} locked',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 22),
                Text(
                  'Unlocked',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                if (unlocked.isEmpty)
                  const EmptyState(
                    icon: LucideIcons.trophy,
                    title: 'No trophies unlocked yet',
                    message: 'Complete study sessions, workouts, hydration, or sleep logs to unlock achievements.',
                    accentColor: AppColors.achievementGold,
                  )
                else
                  ...unlocked.map(
                    (a) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AchievementCard(achievement: a),
                    ),
                  ),
                const SizedBox(height: 16),
                Text('Locked', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                ...locked.map(
                  (a) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: AchievementCard(achievement: a),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
