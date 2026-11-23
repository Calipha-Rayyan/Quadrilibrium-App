import '../../core/constants/app_constants.dart';

/// Daily hydration tracking model with explicit glass count and millilitres.
class WaterIntakeModel {
  const WaterIntakeModel({
    required this.glassesConsumed,
    this.goalGlasses = AppConstants.defaultWaterGoalGlasses,
    this.mlPerGlass = AppConstants.mlPerGlass,
  });

  final int glassesConsumed;
  final int goalGlasses;
  final int mlPerGlass;

  int get consumedMl => glassesConsumed * mlPerGlass;
  int get goalMl => goalGlasses * mlPerGlass;
  double get progress =>
      goalGlasses <= 0 ? 0 : (glassesConsumed / goalGlasses).clamp(0.0, 1.0);

  WaterIntakeModel copyWith({int? glassesConsumed, int? goalGlasses}) {
    return WaterIntakeModel(
      glassesConsumed: glassesConsumed ?? this.glassesConsumed,
      goalGlasses: goalGlasses ?? this.goalGlasses,
      mlPerGlass: mlPerGlass,
    );
  }
}
