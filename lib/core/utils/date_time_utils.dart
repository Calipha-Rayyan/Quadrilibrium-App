import 'package:flutter/material.dart';

/// Date, time, and sleep-duration formatting and calculation helpers.
abstract final class DateTimeUtils {
  static const List<String> _weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Calculates sleep duration between [bedtime] and [wakeTime],
  /// handling crossing midnight correctly.
  static Duration calculateSleepDuration(
    TimeOfDay bedtime,
    TimeOfDay wakeTime,
  ) {
    final bedMinutes = bedtime.hour * 60 + bedtime.minute;
    final wakeMinutes = wakeTime.hour * 60 + wakeTime.minute;
    var diff = wakeMinutes - bedMinutes;
    if (diff <= 0) {
      diff += 24 * 60;
    }
    return Duration(minutes: diff);
  }

  /// Formats a [Duration] as `7h 30m`.
  static String formatHoursMinutes(Duration duration) {
    final totalMinutes = duration.inMinutes;
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    final mm = minutes.toString().padLeft(2, '0');
    return '${hours}h ${mm}m';
  }

  /// Formats seconds as `MM:SS` (e.g., `15:00` or `09:42`).
  static String formatTimerSeconds(int totalSeconds) {
    final safe = totalSeconds < 0 ? 0 : totalSeconds;
    final minutes = (safe ~/ 60).toString().padLeft(2, '0');
    final seconds = (safe % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// Formats [TimeOfDay] in 12-hour `11:00 PM` format.
  static String formatTimeOfDay(TimeOfDay time) {
    final hour12 = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour12:$minute $period';
  }

  /// Formats [DateTime] as `Mon, 16 Nov` or `Fri, 27 Nov 2026`.
  static String formatShortDate(DateTime date, {bool includeYear = false}) {
    final wd = _weekdays[date.weekday - 1];
    final mo = _months[date.month - 1];
    if (includeYear) {
      return '$wd, ${date.day} $mo ${date.year}';
    }
    return '$wd, ${date.day} $mo';
  }
}
