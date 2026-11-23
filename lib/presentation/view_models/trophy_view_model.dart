import 'package:flutter/foundation.dart';

import '../../data/models/achievement_model.dart';
import '../../data/repositories/progress_repository.dart';

/// ViewModel for Trophy Room achievements (separated unlocked and locked lists).
class TrophyViewModel extends ChangeNotifier {
  TrophyViewModel(this._repository);

  final ProgressRepository _repository;

  List<AchievementModel> get allAchievements => _repository.achievements;

  List<AchievementModel> get unlockedAchievements =>
      allAchievements.where((a) => a.isUnlocked).toList();

  List<AchievementModel> get lockedAchievements =>
      allAchievements.where((a) => !a.isUnlocked).toList();

  void updateProgress(String id, {required double progress, bool? unlocked}) {
    _repository.updateAchievementProgress(
      id,
      progress: progress,
      unlocked: unlocked,
    );
    notifyListeners();
  }

  void refresh() => notifyListeners();
}
