/// Academic task types matching the design references.
enum TaskType {
  assignment('Assignment'),
  quiz('Quiz'),
  project('Project'),
  exam('Exam');

  const TaskType(this.label);
  final String label;
}

/// Scheduled academic task model.
class TaskModel {
  const TaskModel({
    required this.id,
    required this.title,
    required this.type,
    required this.deadlineLabel,
    required this.durationMinutes,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final TaskType type;
  final String deadlineLabel;
  final int durationMinutes;
  final bool isCompleted;

  String get durationLabel {
    if (durationMinutes >= 60 && durationMinutes % 60 == 0) {
      return '${durationMinutes ~/ 60} h';
    }
    return '$durationMinutes min';
  }

  TaskModel copyWith({
    String? title,
    TaskType? type,
    String? deadlineLabel,
    int? durationMinutes,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id,
      title: title ?? this.title,
      type: type ?? this.type,
      deadlineLabel: deadlineLabel ?? this.deadlineLabel,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
