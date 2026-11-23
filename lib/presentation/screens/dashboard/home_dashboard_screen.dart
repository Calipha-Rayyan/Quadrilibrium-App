import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/dimension_card.dart';

/// Screen 05 — Home Dashboard.
/// Displays "4 DIMENSIONS TRACKED" in the center ring (never an unvalidated
/// composite health score), matching `design/screens/01_auth_home_analytics.png`.
class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);

    return AuroraScaffold(
      auroraColor: AppColors.brandViolet,
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: ListenableBuilder(
        listenable: Listenable.merge([
          state.auth,
          state.dashboard,
          state.trophies,
        ]),
        builder: (context, _) {
          final user = state.auth.currentUser;
          final progress = state.dashboard.progress;
          final focusHours = progress.weeklyFocusHours;
          final activityMin = progress.weeklyActivityMinutes;
          final who5 = progress.latestWho5Score;
          final avgSleep = progress.averageSleepHours;
          final trophies = state.trophies.unlockedAchievements.length;

          final periodPrefix = progress.isSampleData
              ? 'Sample week'
              : 'This week';

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$periodPrefix · ${user.firstName}',
                  style: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your dimensions at a glance',
                  style: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Semantics(
                    label: 'Four dimensions tracked: Academics, Physical Fitness, Mental Wellbeing, and Sleep',
                    child: SizedBox(
                      width: 210,
                      height: 210,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(210, 210),
                            painter: _FourDimensionsRingPainter(
                              academicsFraction: (focusHours / 12.0).clamp(
                                0.15,
                                1.0,
                              ),
                              fitnessFraction: (activityMin / 300.0).clamp(
                                0.15,
                                1.0,
                              ),
                              mentalFraction: ((who5 ?? 0) / 100.0).clamp(
                                0.15,
                                1.0,
                              ),
                              sleepFraction: ((avgSleep ?? 0) / 8.0).clamp(
                                0.15,
                                1.0,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textPrimary,
                                  height: 1.0,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'DIMENSIONS TRACKED',
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 10,
                                      letterSpacing: 1.0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.55,
                  children: [
                    DimensionCard(
                      title: 'Academics',
                      metricSubtitle:
                          '${focusHours.toStringAsFixed(1)} h focus/week',
                      accentColor: AppColors.academics,
                      onTap: () => context.push(RouteNames.academics),
                    ),
                    DimensionCard(
                      title: 'Physical Fitness',
                      metricSubtitle: '$activityMin min activity/week',
                      accentColor: AppColors.physicalFitness,
                      onTap: () => context.push(RouteNames.fitness),
                    ),
                    DimensionCard(
                      title: 'Mental Wellbeing',
                      metricSubtitle: who5 != null
                          ? 'WHO-5 $who5/100'
                          : 'Not assessed',
                      accentColor: AppColors.mentalWellbeing,
                      onTap: () => context.push(RouteNames.mental),
                    ),
                    DimensionCard(
                      title: 'Sleep',
                      metricSubtitle: avgSleep != null
                          ? '${avgSleep.toStringAsFixed(1)} h avg/night'
                          : 'No data yet',
                      accentColor: AppColors.sleep,
                      onTap: () => context.push(RouteNames.sleep),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCard,
                    borderRadius: BorderRadius.circular(AppRadii.lg),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _SummaryStat(
                          value: '${progress.streakDays} days',
                          label: 'Streak',
                        ),
                      ),
                      Expanded(
                        child: _SummaryStat(
                          value: avgSleep != null
                              ? '${avgSleep.toStringAsFixed(1)} h'
                              : '—',
                          label: 'Avg sleep',
                        ),
                      ),
                      Expanded(
                        child: _SummaryStat(
                          value: '$trophies',
                          label: 'Trophies',
                        ),
                      ),
                    ],
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

class _SummaryStat extends StatelessWidget {
  const _SummaryStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 2),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _FourDimensionsRingPainter extends CustomPainter {
  const _FourDimensionsRingPainter({
    required this.academicsFraction,
    required this.fitnessFraction,
    required this.mentalFraction,
    required this.sleepFraction,
  });

  final double academicsFraction;
  final double fitnessFraction;
  final double mentalFraction;
  final double sleepFraction;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 14.0;
    final rect = (Offset.zero & size).deflate(strokeWidth / 2 + 4);
    const gap = 0.22;
    const quadrantSweep = (math.pi / 2) - gap;

    final quadrants = <(double, double, Color)>[
      (-math.pi / 2 + gap / 2, academicsFraction, AppColors.academics),
      (0 + gap / 2, fitnessFraction, AppColors.physicalFitness),
      (math.pi / 2 + gap / 2, mentalFraction, AppColors.mentalWellbeing),
      (math.pi + gap / 2, sleepFraction, AppColors.sleep),
    ];

    for (final (start, fraction, color) in quadrants) {
      final trackPaint = Paint()
        ..color = AppColors.surfaceElevated
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(rect, start, quadrantSweep, false, trackPaint);

      final activePaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        rect,
        start,
        quadrantSweep * fraction.clamp(0.0, 1.0),
        false,
        activePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _FourDimensionsRingPainter oldDelegate) =>
      oldDelegate.academicsFraction != academicsFraction ||
      oldDelegate.fitnessFraction != fitnessFraction ||
      oldDelegate.mentalFraction != mentalFraction ||
      oldDelegate.sleepFraction != sleepFraction;
}
