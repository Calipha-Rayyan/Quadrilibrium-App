import '../models/meal_model.dart';
import '../models/water_intake_model.dart';
import '../models/workout_model.dart';
import '../sample_data.dart';

/// In-memory repository for Physical Fitness workouts, hydration, and diet intake.
class FitnessRepository {
  FitnessRepository()
    : _workouts = SampleData.initialWorkouts(),
      _meals = SampleData.initialMeals(),
      _water = SampleData.initialWater;

  final List<WorkoutModel> _workouts;
  final List<MealModel> _meals;
  WaterIntakeModel _water;

  List<WorkoutModel> get workouts => List.unmodifiable(_workouts);
  List<MealModel> get meals => List.unmodifiable(_meals);
  WaterIntakeModel get water => _water;

  WorkoutModel? workoutById(String id) {
    for (final w in _workouts) {
      if (w.id == id) return w;
    }
    return null;
  }

  void toggleExercise(String workoutId, String exerciseId) {
    final wIdx = _workouts.indexWhere((w) => w.id == workoutId);
    if (wIdx == -1) return;
    final workout = _workouts[wIdx];
    final updated = workout.exercises.map((e) {
      if (e.id == exerciseId) return e.copyWith(isDone: !e.isDone);
      return e;
    }).toList();
    final allDone = updated.every((e) => e.isDone);
    _workouts[wIdx] = workout.copyWith(
      exercises: updated,
      isCompleted: allDone ? true : workout.isCompleted,
    );
  }

  void markWorkoutCompleted(String workoutId) {
    final wIdx = _workouts.indexWhere((w) => w.id == workoutId);
    if (wIdx == -1) return;
    final workout = _workouts[wIdx];
    final updated = workout.exercises
        .map((e) => e.copyWith(isDone: true))
        .toList();
    _workouts[wIdx] = workout.copyWith(exercises: updated, isCompleted: true);
  }

  void addWaterGlass() {
    if (_water.glassesConsumed < 16) {
      _water = _water.copyWith(glassesConsumed: _water.glassesConsumed + 1);
    }
  }

  void removeWaterGlass() {
    if (_water.glassesConsumed > 0) {
      _water = _water.copyWith(glassesConsumed: _water.glassesConsumed - 1);
    }
  }

  void addMeal(MealModel meal) => _meals.insert(0, meal);

  void deleteMeal(String mealId) => _meals.removeWhere((m) => m.id == mealId);

  void resetAll() {
    _water = const WaterIntakeModel(glassesConsumed: 0);
    _meals.clear();
    for (var i = 0; i < _workouts.length; i++) {
      final w = _workouts[i];
      _workouts[i] = w.copyWith(
        isCompleted: false,
        exercises: w.exercises.map((e) => e.copyWith(isDone: false)).toList(),
      );
    }
  }
}
