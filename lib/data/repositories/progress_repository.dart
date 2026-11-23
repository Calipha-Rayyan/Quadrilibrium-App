import '../models/achievement_model.dart';
import '../models/progress_model.dart';
import '../sample_data.dart';

/// In-memory repository for separate-scale Analytics progress and Trophy Room achievements.
class ProgressRepository {
  ProgressRepository()
    : _progress = SampleData.initialProgress(),
      _achievements = SampleData.initialAchievements();

  ProgressModel _progress;
  final List<AchievementModel> _achievements;

  ProgressModel get progress => _progress;
  List<AchievementModel> get achievements => List.unmodifiable(_achievements);

  void addFocusMinutesToday(int minutes) {
    if (minutes <= 0) return;
    final list = List<DailyMetricPoint>.from(
      _progress.academicFocusMinutesByDay,
    );
    if (list.isNotEmpty) {
      final last = list.last;
      list[list.length - 1] = DailyMetricPoint(
        label: last.label,
        value: last.value + minutes,
      );
    }
    _progress = _progress.copyWith(
      academicFocusMinutesByDay: list,
      isSampleData: false,
    );
  }

  void addActivityMinutesToday(int minutes) {
    if (minutes <= 0) return;
    final list = List<DailyMetricPoint>.from(
      _progress.moderateActivityMinutesByDay,
    );
    if (list.isNotEmpty) {
      final last = list.last;
      list[list.length - 1] = DailyMetricPoint(
        label: last.label,
        value: last.value + minutes,
      );
    }
    _progress = _progress.copyWith(
      moderateActivityMinutesByDay: list,
      isSampleData: false,
    );
  }

  void addSleepHoursToday(double hours) {
    if (hours <= 0) return;
    final list = List<DailyMetricPoint>.from(_progress.sleepHoursByDay);
    if (list.isNotEmpty) {
      final last = list.last;
      list[list.length - 1] = DailyMetricPoint(label: last.label, value: hours);
    }
    _progress = _progress.copyWith(sleepHoursByDay: list, isSampleData: false);
  }

  void updateAchievementProgress(
    String id, {
    required double progress,
    bool? unlocked,
  }) {
    final idx = _achievements.indexWhere((a) => a.id == id);
    if (idx == -1) return;
    final clamped = progress.clamp(0.0, 1.0);
    _achievements[idx] = _achievements[idx].copyWith(
      progress: clamped,
      isUnlocked: unlocked ?? (clamped >= 1.0),
    );
  }

  void resetAll() {
    _progress = const ProgressModel(
      academicFocusMinutesByDay: [
        DailyMetricPoint(label: 'M', value: 0),
        DailyMetricPoint(label: 'T', value: 0),
        DailyMetricPoint(label: 'W', value: 0),
        DailyMetricPoint(label: 'T', value: 0),
        DailyMetricPoint(label: 'F', value: 0),
        DailyMetricPoint(label: 'S', value: 0),
        DailyMetricPoint(label: 'S', value: 0),
      ],
      moderateActivityMinutesByDay: [
        DailyMetricPoint(label: 'M', value: 0),
        DailyMetricPoint(label: 'T', value: 0),
        DailyMetricPoint(label: 'W', value: 0),
        DailyMetricPoint(label: 'T', value: 0),
        DailyMetricPoint(label: 'F', value: 0),
        DailyMetricPoint(label: 'S', value: 0),
        DailyMetricPoint(label: 'S', value: 0),
      ],
      who5CheckInPoints: [],
      sleepHoursByDay: [
        DailyMetricPoint(label: 'M', value: 0),
        DailyMetricPoint(label: 'T', value: 0),
        DailyMetricPoint(label: 'W', value: 0),
        DailyMetricPoint(label: 'T', value: 0),
        DailyMetricPoint(label: 'F', value: 0),
        DailyMetricPoint(label: 'S', value: 0),
        DailyMetricPoint(label: 'S', value: 0),
      ],
      streakDays: 0,
      isSampleData: false,
    );
    for (var i = 0; i < _achievements.length; i++) {
      _achievements[i] = _achievements[i].copyWith(
        isUnlocked: false,
        progress: 0,
      );
    }
  }
}
