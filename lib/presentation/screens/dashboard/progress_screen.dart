import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../app/theme_tokens.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/progress_model.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/aurora_scaffold.dart';

/// Screen 06 — Analytics (opened via the "Progress" bottom navigation tab).
/// Keeps every dimension on its own scale, unit, time window, and reference line.
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboard = AppStateScope.of(context).dashboard;

    return AuroraScaffold(
      auroraColor: AppColors.brandViolet,
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
      body: ListenableBuilder(
        listenable: dashboard,
        builder: (context, _) {
          final p = dashboard.progress;
          final subtitle = p.isSampleData
              ? 'Weekly metrics · distinct units · sample values'
              : 'Weekly metrics · distinct units · your recorded data';

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Analytics',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 18),
                _DimensionChartCard(
                  title: 'Academics',
                  caption:
                      'Focus time · 0–180 min/day · ${p.weeklyFocusMinutes} min/week',
                  accentColor: AppColors.academics,
                  points: p.academicFocusMinutesByDay,
                  maxY: 180,
                  emptyMessage: 'No focus sessions recorded yet.',
                ),
                const SizedBox(height: 14),
                _DimensionChartCard(
                  title: 'Physical Fitness',
                  caption:
                      'Moderate activity · ${p.weeklyActivityMinutes} min/week · WHO adult 150–300 min',
                  accentColor: AppColors.physicalFitness,
                  points: p.moderateActivityMinutesByDay,
                  maxY: 60,
                  emptyMessage: 'No activity minutes recorded yet.',
                ),
                const SizedBox(height: 14),
                _DimensionChartCard(
                  title: 'Mental Wellbeing',
                  caption:
                      'WHO-5 · 0–100 · 14-day recall · <${AppConstants.who5FollowUpThreshold} follow-up',
                  accentColor: AppColors.mentalWellbeing,
                  points: p.who5CheckInPoints,
                  maxY: 100,
                  referenceLineY: AppConstants.who5FollowUpThreshold.toDouble(),
                  emptyMessage: 'Not assessed — complete a 5-item WHO-5 check-in to plot.',
                ),
                const SizedBox(height: 14),
                _DimensionChartCard(
                  title: 'Sleep',
                  caption:
                      'Sleep duration · 0–10 h/night · adult guide ≥${AppConstants.adultSleepReferenceHours.toInt()} h',
                  accentColor: AppColors.sleep,
                  points: p.sleepHoursByDay,
                  maxY: 10,
                  referenceLineY: AppConstants.adultSleepReferenceHours,
                  emptyMessage: 'No sleep records logged yet.',
                ),
                const SizedBox(height: 14),
                Text(
                  '${AppConstants.who5Notice} Ranges are not interchangeable across cards.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DimensionChartCard extends StatelessWidget {
  const _DimensionChartCard({
    required this.title,
    required this.caption,
    required this.accentColor,
    required this.points,
    required this.maxY,
    required this.emptyMessage,
    this.referenceLineY,
  });

  final String title;
  final String caption;
  final Color accentColor;
  final List<DailyMetricPoint> points;
  final double maxY;
  final String emptyMessage;
  final double? referenceLineY;

  @override
  Widget build(BuildContext context) {
    final hasNonZeroData = points.any((p) => p.value > 0);

    return Container(
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
            title,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(color: accentColor),
          ),
          const SizedBox(height: 3),
          Text(
            caption,
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(fontSize: 11.5),
          ),
          const SizedBox(height: 14),
          if (!hasNonZeroData)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Center(
                child: Text(
                  emptyMessage,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          else
            SizedBox(
              height: 86,
              child: BarChart(
                BarChartData(
                  maxY: maxY,
                  minY: 0,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  extraLinesData: referenceLineY != null
                      ? ExtraLinesData(
                          horizontalLines: [
                            HorizontalLine(
                              y: referenceLineY!,
                              color: AppColors.textSecondary.withValues(
                                alpha: 0.4,
                              ),
                              strokeWidth: 1,
                              dashArray: [4, 4],
                            ),
                          ],
                        )
                      : null,
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx < 0 || idx >= points.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              points[idx].label,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 10.5,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: List.generate(points.length, (i) {
                    final isLatest = i == points.length - 1;
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: points[i].value.clamp(0, maxY),
                          width: points.length <= 4 ? 22 : 16,
                          borderRadius: BorderRadius.circular(6),
                          color: isLatest
                              ? accentColor
                              : accentColor.withValues(alpha: 0.52),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
