import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quadrilibrium/core/utils/analytics_calculator.dart';
import 'package:quadrilibrium/core/utils/date_time_utils.dart';
import 'package:quadrilibrium/core/utils/input_validators.dart';

void main() {
  group('AnalyticsCalculator', () {
    test('sums valid focus minutes and ignores non-positive entries', () {
      expect(
        AnalyticsCalculator.calculateFocusMinutes([85, 110, 0, -5, 65]),
        260,
      );
    });

    test('returns null due-task completion when zero tasks are due', () {
      expect(
        AnalyticsCalculator.calculateDueTaskCompletion(
          completedDue: 0,
          totalDue: 0,
        ),
        isNull,
      );
      expect(
        AnalyticsCalculator.calculateDueTaskCompletion(
          completedDue: 3,
          totalDue: 4,
        ),
        75.0,
      );
    });

    test(
      'computes moderate-equivalent activity minutes using 4:8 MET ratio',
      () {
        expect(
          AnalyticsCalculator.calculateModerateEquivalentMinutes(
            moderateMinutes: 120,
            vigorousMinutes: 60,
          ),
          240,
        );
      },
    );

    test('WHO-5 returns null if any item is missing or out of range', () {
      expect(
        AnalyticsCalculator.calculateWho5RawScore([3, 4, null, 3, 4]),
        isNull,
      );
      expect(
        AnalyticsCalculator.calculateWho5RawScore([3, 4, 6, 3, 4]),
        isNull,
      );
      final raw = AnalyticsCalculator.calculateWho5RawScore([3, 4, 3, 4, 3]);
      expect(raw, 17);
      expect(AnalyticsCalculator.calculateWho5Percent(raw), 68);
    });

    test('calculates average sleep hours and returns null when empty', () {
      expect(AnalyticsCalculator.calculateAverageSleepHours([]), isNull);
      final avg = AnalyticsCalculator.calculateAverageSleepHours([
        const Duration(hours: 7, minutes: 30),
        const Duration(hours: 6, minutes: 30),
      ]);
      expect(avg, 7.0);
    });
  });

  group('DateTimeUtils', () {
    test('calculates sleep duration across midnight correctly', () {
      final overnight = DateTimeUtils.calculateSleepDuration(
        const TimeOfDay(hour: 23, minute: 0),
        const TimeOfDay(hour: 6, minute: 30),
      );
      expect(overnight, const Duration(hours: 7, minutes: 30));
      expect(DateTimeUtils.formatHoursMinutes(overnight), '7h 30m');

      final sameMorning = DateTimeUtils.calculateSleepDuration(
        const TimeOfDay(hour: 1, minute: 0),
        const TimeOfDay(hour: 7, minute: 0),
      );
      expect(sameMorning, const Duration(hours: 6, minutes: 0));
    });

    test('formats timer seconds as MM:SS', () {
      expect(DateTimeUtils.formatTimerSeconds(900), '15:00');
      expect(DateTimeUtils.formatTimerSeconds(582), '09:42');
      expect(DateTimeUtils.formatTimerSeconds(-5), '00:00');
    });
  });

  group('InputValidators', () {
    test('validates email, password, and confirmation', () {
      expect(InputValidators.email(''), isNotNull);
      expect(InputValidators.email('not-an-email'), isNotNull);
      expect(InputValidators.email('alex@university.edu'), isNull);

      expect(InputValidators.password('1234567'), isNotNull);
      expect(InputValidators.password('12345678'), isNull);

      expect(InputValidators.confirmPassword('diff', '12345678'), isNotNull);
      expect(InputValidators.confirmPassword('12345678', '12345678'), isNull);
    });
  });
}
