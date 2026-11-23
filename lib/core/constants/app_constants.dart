/// Application-wide constants and reference guidance strings.
abstract final class AppConstants {
  static const String appName = 'Quadrilibrium';
  static const String tagline = 'Balance in the Dark';

  /// Hydration defaults matching the sketches and latest PNG exports.
  static const int defaultWaterGoalGlasses = 8;
  static const int mlPerGlass = 250;

  /// Reference thresholds per `project-docs/docs/ANALYTICS_SCALE_SPEC.md`.
  static const int whoAdultModerateMinWeekly = 150;
  static const int whoAdultModerateMaxWeekly = 300;
  static const double adultSleepReferenceHours = 7.0;
  static const int who5FollowUpThreshold = 50;

  /// Honest sample-data & non-diagnostic notices.
  static const String sampleDataNotice =
      'Sample values shown for illustration until you record your own activity.';
  static const String who5Notice =
      'WHO-5 (0–100, 14-day recall) is a screening check-in, not a clinical diagnosis.';
  static const String localAuthNotice =
      'Local prototype mode: credentials are validated on-device with no remote server.';

  /// Max content width for phone-first layout on tablet/desktop viewports.
  static const double maxPhoneLayoutWidth = 460;
}
