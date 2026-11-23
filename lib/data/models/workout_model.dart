enum WorkoutCategory {
  workout('Workouts'),
  stretch('Stretches');

  const WorkoutCategory(this.label);
  final String label;
}

class ExerciseStep {
  const ExerciseStep({
    required this.id,
    required this.name,
    required this.instruction,
    required this.durationLabel,
    this.isDone = false,
  });

  final String id;
  final String name;
  final String instruction;
  final String durationLabel;
  final bool isDone;

  ExerciseStep copyWith({bool? isDone}) {
    return ExerciseStep(
      id: id,
      name: name,
      instruction: instruction,
      durationLabel: durationLabel,
      isDone: isDone ?? this.isDone,
    );
  }
}

/// Guided workout or stretch routine with explicit duration and intensity.
class WorkoutModel {
  const WorkoutModel({
    required this.id,
    required this.title,
    required this.category,
    required this.durationMinutes,
    required this.exercises,
    this.isCompleted = false,
    this.isVigorous = false,
  });

  final String id;
  final String title;
  final WorkoutCategory category;
  final int durationMinutes;
  final List<ExerciseStep> exercises;
  final bool isCompleted;
  final bool isVigorous;

  int get completedExerciseCount => exercises.where((e) => e.isDone).length;

  WorkoutModel copyWith({List<ExerciseStep>? exercises, bool? isCompleted}) {
    return WorkoutModel(
      id: id,
      title: title,
      category: category,
      durationMinutes: durationMinutes,
      exercises: exercises ?? this.exercises,
      isCompleted: isCompleted ?? this.isCompleted,
      isVigorous: isVigorous,
    );
  }
}
