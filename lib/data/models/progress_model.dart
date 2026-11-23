/// Separate weekly/periodic analytics series with explicit units and provenance.
/// Never combines dimensions into a single arbitrary wellbeing score.
class DailyMetricPoint {
  const DailyMetricPoint({required this.label, required this.value});

  final String label;
  final double value;
}

class ProgressModel {
  const ProgressModel({
    required this.academicFocusMinutesByDay,
    required this.moderateActivityMinutesByDay,
    required this.who5CheckInPoints,
    required this.sleepHoursByDay,
    required this.streakDays,
    required this.isSampleData,
  });

  /// Daily focus time in minutes (chart scale 0–180 min/day).
  final List<DailyMetricPoint> academicFocusMinutesByDay;

  /// Daily moderate activity in minutes (chart scale 0–60 min/day).
  final List<DailyMetricPoint> moderateActivityMinutesByDay;

  /// Periodic WHO-5 scores (0–100, 14-day recall). Empty means "Not assessed".
  final List<DailyMetricPoint> who5CheckInPoints;

  /// Nightly sleep duration in hours (chart scale 0–10 h/night).
  final List<DailyMetricPoint> sleepHoursByDay;

  final int streakDays;
  final bool isSampleData;

  int get weeklyFocusMinutes =>
      academicFocusMinutesByDay.fold<int>(0, (sum, p) => sum + p.value.round());

  double get weeklyFocusHours => weeklyFocusMinutes / 60.0;

  int get weeklyActivityMinutes => moderateActivityMinutesByDay.fold<int>(
    0,
    (sum, p) => sum + p.value.round(),
  );

  int? get latestWho5Score =>
      who5CheckInPoints.isEmpty ? null : who5CheckInPoints.last.value.round();

  double? get averageSleepHours {
    final valid = sleepHoursByDay.where((p) => p.value > 0).toList();
    if (valid.isEmpty) return null;
    final total = valid.fold<double>(0, (sum, p) => sum + p.value);
    return total / valid.length;
  }

  ProgressModel copyWith({
    List<DailyMetricPoint>? academicFocusMinutesByDay,
    List<DailyMetricPoint>? moderateActivityMinutesByDay,
    List<DailyMetricPoint>? who5CheckInPoints,
    List<DailyMetricPoint>? sleepHoursByDay,
    int? streakDays,
    bool? isSampleData,
  }) {
    return ProgressModel(
      academicFocusMinutesByDay:
          academicFocusMinutesByDay ?? this.academicFocusMinutesByDay,
      moderateActivityMinutesByDay:
          moderateActivityMinutesByDay ?? this.moderateActivityMinutesByDay,
      who5CheckInPoints: who5CheckInPoints ?? this.who5CheckInPoints,
      sleepHoursByDay: sleepHoursByDay ?? this.sleepHoursByDay,
      streakDays: streakDays ?? this.streakDays,
      isSampleData: isSampleData ?? this.isSampleData,
    );
  }
}
