enum ServingSize {
  small('Small', 0.7),
  medium('Medium', 1.0),
  large('Large', 1.45);

  const ServingSize(this.label, this.multiplier);
  final String label;
  final double multiplier;
}

class FoodOption {
  const FoodOption({
    required this.name,
    required this.baseCalories,
    required this.baseCarbsGrams,
    required this.baseProteinGrams,
    required this.baseFatsGrams,
  });

  final String name;
  final int baseCalories;
  final int baseCarbsGrams;
  final int baseProteinGrams;
  final int baseFatsGrams;
}

/// Logged meal entry with explicit macronutrients in grams.
class MealModel {
  const MealModel({
    required this.id,
    required this.foodName,
    required this.servingSize,
    required this.calories,
    required this.carbsGrams,
    required this.proteinGrams,
    required this.fatsGrams,
    this.isSample = false,
  });

  final String id;
  final String foodName;
  final ServingSize servingSize;
  final int calories;
  final int carbsGrams;
  final int proteinGrams;
  final int fatsGrams;
  final bool isSample;
}
