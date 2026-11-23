/// Trophy Room achievement model separating unlocked and locked states.
class AchievementModel {
  const AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isUnlocked,
    required this.progress,
    this.isProvisional = false,
  });

  final String id;
  final String title;
  final String description;
  final bool isUnlocked;
  final double progress;
  final bool isProvisional;

  AchievementModel copyWith({bool? isUnlocked, double? progress}) {
    return AchievementModel(
      id: id,
      title: title,
      description: description,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      progress: progress ?? this.progress,
      isProvisional: isProvisional,
    );
  }
}
