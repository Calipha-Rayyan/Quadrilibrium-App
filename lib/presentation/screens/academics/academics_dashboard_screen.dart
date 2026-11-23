import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';

/// Screen 11 — Academics Dashboard.
class AcademicsDashboardScreen extends StatelessWidget {
  const AcademicsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuroraScaffold(
      auroraColor: AppColors.academics,
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(
              title: 'Academics',
              subtitle: 'Stay on top of study goals',
              titleColor: AppColors.academics,
            ),
            const SizedBox(height: 24),
            AppCard(
              title: 'Schedule Generator',
              subtitle: 'Plan tasks and deadlines',
              icon: LucideIcons.calendar,
              accentColor: AppColors.academics,
              onTap: () => context.push(RouteNames.schedule),
            ),
            const SizedBox(height: 12),
            AppCard(
              title: 'Pomodoro Timer',
              subtitle: 'Focus in timed sessions',
              icon: LucideIcons.timer,
              accentColor: AppColors.academics,
              onTap: () => context.push(RouteNames.pomodoro),
            ),
            const SizedBox(height: 12),
            AppCard(
              title: 'Bluttering Sheet',
              subtitle: 'Timed free-writing recall',
              icon: LucideIcons.notebookPen,
              accentColor: AppColors.academics,
              onTap: () => context.push(RouteNames.bluttering),
            ),
            const SizedBox(height: 12),
            AppCard(
              title: 'Study Flashcards',
              subtitle: 'Review by subject',
              icon: LucideIcons.layers,
              accentColor: AppColors.academics,
              onTap: () => context.push(RouteNames.flashcards),
            ),
          ],
        ),
      ),
    );
  }
}
