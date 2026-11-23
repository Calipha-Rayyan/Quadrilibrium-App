import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme_tokens.dart';
import '../../data/models/achievement_model.dart';

/// Trophy Room achievement card with distinct unlocked (gold) and locked states.
class AchievementCard extends StatelessWidget {
  const AchievementCard({super.key, required this.achievement});

  final AchievementModel achievement;

  @override
  Widget build(BuildContext context) {
    final unlocked = achievement.isUnlocked;
    final accent = unlocked ? AppColors.achievementGold : AppColors.brandViolet;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(
          color: unlocked
              ? AppColors.achievementGold.withValues(alpha: 0.65)
              : AppColors.border,
          width: 1,
        ),
        boxShadow: unlocked
            ? [
                BoxShadow(
                  color: AppColors.achievementGold.withValues(alpha: 0.1),
                  blurRadius: 18,
                  offset: const Offset(0, 4),
                ),
              ]
            : const [],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: unlocked
                  ? AppColors.achievementGold.withValues(alpha: 0.18)
                  : AppColors.surfaceElevated,
              border: Border.all(
                color: unlocked ? AppColors.achievementGold : AppColors.border,
                width: 1.4,
              ),
            ),
            child: Icon(
              unlocked ? LucideIcons.trophy : LucideIcons.lock,
              size: 20,
              color: unlocked
                  ? AppColors.achievementGold
                  : AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 3),
                Text(
                  achievement.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                  child: LinearProgressIndicator(
                    value: achievement.progress.clamp(0.0, 1.0),
                    minHeight: 5,
                    backgroundColor: AppColors.surfaceElevated,
                    valueColor: AlwaysStoppedAnimation<Color>(accent),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            unlocked ? LucideIcons.trophy : LucideIcons.lock,
            size: 18,
            color: unlocked
                ? AppColors.achievementGold
                : AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
