import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';

/// Screen 29 — Mental Wellbeing Dashboard.
class MentalWellbeingScreen extends StatelessWidget {
  const MentalWellbeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuroraScaffold(
      auroraColor: AppColors.mentalWellbeing,
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(
              title: 'Mental Wellbeing',
              subtitle: 'Calm the mind',
              titleColor: AppColors.mentalWellbeing,
            ),
            const SizedBox(height: 24),
            AppCard(
              title: 'Meditation',
              subtitle: '30 minute guided session',
              icon: LucideIcons.moon,
              accentColor: AppColors.mentalWellbeing,
              onTap: () => context.push(RouteNames.meditation),
            ),
            const SizedBox(height: 12),
            AppCard(
              title: 'Breathing Exercises',
              subtitle: 'Inhale, hold, exhale',
              icon: LucideIcons.wind,
              accentColor: AppColors.mentalWellbeing,
              onTap: () => context.push(RouteNames.breathing),
            ),
            const SizedBox(height: 12),
            AppCard(
              title: 'Thought Reframer',
              subtitle: 'Challenge stressful thoughts',
              icon: LucideIcons.notebookPen,
              accentColor: AppColors.mentalWellbeing,
              onTap: () => context.push(RouteNames.thoughts),
            ),
          ],
        ),
      ),
    );
  }
}
