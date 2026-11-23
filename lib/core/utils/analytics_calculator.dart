/// Pure, testable analytics calculation functions per
/// `project-docs/docs/ANALYTICS_SCALE_SPEC.md`.
///
/// Dimensions remain separate with explicit units and scales.
/// Never combines dimensions into an unvalidated global score.
abstract final class AnalyticsCalculator {
  /// Sums valid non-negative focus session minutes.
  static int calculateFocusMinutes(Iterable<int> sessionMinutes) {
    var total = 0;
    for (final m in sessionMinutes) {
      if (m > 0) total += m;
    }
    return total;
  }

  /// Calculates completion percentage for tasks due in the selected period.
  /// Returns `null` when [totalDue] <= 0 so UI displays "No tasks due" / "N/A"
  /// rather than a misleading 0%.
  static double? calculateDueTaskCompletion({
    required int completedDue,
    required int totalDue,
  }) {
    if (totalDue <= 0) return null;
    final clamped = completedDue.clamp(0, totalDue);
    return (clamped / totalDue) * 100.0;
  }

  /// Calculates moderate-equivalent activity minutes using the 4:8 MET ratio:
  /// `moderate + (2 * vigorous)`. Not labeled a "GPAQ score".
  static int calculateModerateEquivalentMinutes({
    required int moderateMinutes,
    required int vigorousMinutes,
  }) {
    final mod = moderateMinutes < 0 ? 0 : moderateMinutes;
    final vig = vigorousMinutes < 0 ? 0 : vigorousMinutes;
    return mod + (2 * vig);
  }

  /// Calculates WHO-5 raw score (0..25).
  /// Returns `null` if fewer or more than 5 items are provided, or if any item
  /// is null or outside 0..5. Never silently imputes missing answers as 0.
  static int? calculateWho5RawScore(List<int?> responses) {
    if (responses.length != 5) return null;
    var sum = 0;
    for (final item in responses) {
      if (item == null || item < 0 || item > 5) return null;
      sum += item;
    }
    return sum;
  }

  /// Converts a valid WHO-5 raw score (0..25) to percentage (0..100).
  static int? calculateWho5Percent(int? rawScore) {
    if (rawScore == null || rawScore < 0 || rawScore > 25) return null;
    return rawScore * 4;
  }

  /// Calculates average sleep duration in hours across valid records.
  /// Returns `null` when [durations] is empty so UI shows "No data yet".
  static double? calculateAverageSleepHours(Iterable<Duration> durations) {
    var count = 0;
    var totalMinutes = 0;
    for (final d in durations) {
      if (d.inMinutes > 0) {
        totalMinutes += d.inMinutes;
        count++;
      }
    }
    if (count == 0) return null;
    return totalMinutes / 60.0 / count;
  }
}
