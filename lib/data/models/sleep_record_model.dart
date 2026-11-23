import 'package:flutter/material.dart';

import '../../core/utils/date_time_utils.dart';

/// Individual sleep log record with explicit bedtime, wake-up time, and derived duration.
class SleepRecordModel {
  const SleepRecordModel({
    required this.id,
    required this.dateLabel,
    required this.bedtime,
    required this.wakeTime,
    this.isSample = false,
  });

  final String id;
  final String dateLabel;
  final TimeOfDay bedtime;
  final TimeOfDay wakeTime;
  final bool isSample;

  Duration get duration =>
      DateTimeUtils.calculateSleepDuration(bedtime, wakeTime);

  double get durationHours => duration.inMinutes / 60.0;

  String get formattedDuration => DateTimeUtils.formatHoursMinutes(duration);

  String get formattedRange =>
      'Bed ${DateTimeUtils.formatTimeOfDay(bedtime)} • Wake ${DateTimeUtils.formatTimeOfDay(wakeTime)}';
}
