/// Saved Bluttering Sheet timed recall writing entry.
class StudySheetModel {
  const StudySheetModel({
    required this.id,
    required this.title,
    required this.content,
    required this.durationMinutes,
    required this.savedDateLabel,
    this.wasExpired = false,
  });

  final String id;
  final String title;
  final String content;
  final int durationMinutes;
  final String savedDateLabel;
  final bool wasExpired;
}
