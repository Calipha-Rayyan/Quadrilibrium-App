import 'package:flutter/foundation.dart';

import '../../data/models/progress_model.dart';
import '../../data/repositories/progress_repository.dart';

/// ViewModel for Home Dashboard and Analytics / Progress screens.
class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel(this._repository);

  final ProgressRepository _repository;

  ProgressModel get progress => _repository.progress;

  int get unlockedTrophyCount =>
      _repository.achievements.where((a) => a.isUnlocked).length;

  void recordFocusMinutes(int minutes) {
    _repository.addFocusMinutesToday(minutes);
    notifyListeners();
  }

  void recordActivityMinutes(int minutes) {
    _repository.addActivityMinutesToday(minutes);
    notifyListeners();
  }

  void recordSleepHours(double hours) {
    _repository.addSleepHoursToday(hours);
    notifyListeners();
  }

  void refresh() => notifyListeners();

  void resetAll() {
    _repository.resetAll();
    notifyListeners();
  }
}
