import 'package:flutter/foundation.dart';

import '../../data/models/meal_model.dart';
import '../../data/models/water_intake_model.dart';
import '../../data/models/workout_model.dart';
import '../../data/repositories/fitness_repository.dart';

/// ViewModel for Physical Fitness: Workouts, Water Intake, and Diet Intake.
class FitnessViewModel extends ChangeNotifier {
  FitnessViewModel(
    this._repository, {
    required this.onActivityMinutesRecorded,
    required this.onHydrationChanged,
  });

  final FitnessRepository _repository;
  final ValueChanged<int> onActivityMinutesRecorded;
  final ValueChanged<double> onHydrationChanged;

  static const int carbsGoalGrams = 250;
  static const int proteinGoalGrams = 90;
  static const int fatsGoalGrams = 65;

  List<WorkoutModel> get workouts => _repository.workouts;
  List<MealModel> get meals => _repository.meals;
  WaterIntakeModel get water => _repository.water;

  int get completedWorkoutsCount => workouts.where((w) => w.isCompleted).length;

  int get totalCarbsGrams => meals.fold<int>(0, (sum, m) => sum + m.carbsGrams);
  int get totalProteinGrams =>
      meals.fold<int>(0, (sum, m) => sum + m.proteinGrams);
  int get totalFatsGrams => meals.fold<int>(0, (sum, m) => sum + m.fatsGrams);

  WorkoutModel? workoutById(String id) => _repository.workoutById(id);

  void toggleExercise(String workoutId, String exerciseId) {
    final before = _repository.workoutById(workoutId)?.isCompleted ?? false;
    _repository.toggleExercise(workoutId, exerciseId);
    final after = _repository.workoutById(workoutId);
    if (!before && after != null && after.isCompleted) {
      onActivityMinutesRecorded(after.durationMinutes);
    }
    notifyListeners();
  }

  void markWorkoutCompleted(String workoutId) {
    final before = _repository.workoutById(workoutId);
    if (before == null) return;
    final wasCompleted = before.isCompleted;
    _repository.markWorkoutCompleted(workoutId);
    if (!wasCompleted) {
      onActivityMinutesRecorded(before.durationMinutes);
    }
    notifyListeners();
  }

  void addWaterGlass() {
    _repository.addWaterGlass();
    onHydrationChanged(_repository.water.progress);
    notifyListeners();
  }

  void removeWaterGlass() {
    _repository.removeWaterGlass();
    onHydrationChanged(_repository.water.progress);
    notifyListeners();
  }

  void addMeal({required FoodOption food, required ServingSize servingSize}) {
    final mult = servingSize.multiplier;
    _repository.addMeal(
      MealModel(
        id: 'meal-${DateTime.now().microsecondsSinceEpoch}',
        foodName: food.name,
        servingSize: servingSize,
        calories: (food.baseCalories * mult).round(),
        carbsGrams: (food.baseCarbsGrams * mult).round(),
        proteinGrams: (food.baseProteinGrams * mult).round(),
        fatsGrams: (food.baseFatsGrams * mult).round(),
      ),
    );
    notifyListeners();
  }

  void deleteMeal(String id) {
    _repository.deleteMeal(id);
    notifyListeners();
  }

  void resetAll() {
    _repository.resetAll();
    onHydrationChanged(0);
    notifyListeners();
  }
}
