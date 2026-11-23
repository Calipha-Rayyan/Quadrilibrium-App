import 'package:flutter/material.dart';

import '../../core/utils/analytics_calculator.dart';
import '../../core/utils/date_time_utils.dart';
import '../../data/models/sleep_record_model.dart';
import '../../data/repositories/sleep_repository.dart';

/// ViewModel for Sleep Tracker and Sleep History.
class SleepViewModel extends ChangeNotifier {
  SleepViewModel(this._repository, {required this.onSleepHoursLogged});

  final SleepRepository _repository;
  final ValueChanged<double> onSleepHoursLogged;

  List<SleepRecordModel> get records => _repository.records;

  double? get averageSleepHours =>
      AnalyticsCalculator.calculateAverageSleepHours(
        records.map((r) => r.duration),
      );

  SleepRecordModel logSleep({
    required TimeOfDay bedtime,
    required TimeOfDay wakeTime,
    DateTime? date,
  }) {
    final record = SleepRecordModel(
      id: 'sleep-${DateTime.now().microsecondsSinceEpoch}',
      dateLabel: DateTimeUtils.formatShortDate(date ?? DateTime.now()),
      bedtime: bedtime,
      wakeTime: wakeTime,
    );
    _repository.addRecord(record);
    onSleepHoursLogged(record.durationHours);
    notifyListeners();
    return record;
  }

  void deleteRecord(String id) {
    _repository.deleteRecord(id);
    notifyListeners();
  }

  void resetAll() {
    _repository.resetAll();
    notifyListeners();
  }
}
