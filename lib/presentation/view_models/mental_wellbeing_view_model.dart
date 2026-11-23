import 'package:flutter/foundation.dart';

import '../../data/models/thought_card_model.dart';
import '../../data/repositories/mental_wellbeing_repository.dart';

/// ViewModel for Mental Wellbeing: Meditation, Breathing Exercises, Thought Reframer.
class MentalWellbeingViewModel extends ChangeNotifier {
  MentalWellbeingViewModel(this._repository);

  final MentalWellbeingRepository _repository;

  List<ThoughtCardModel> get thoughtCards => _repository.thoughtCards;
  int get completedMeditationMinutes => _repository.completedMeditationMinutes;
  int get completedBreathingSessions => _repository.completedBreathingSessions;

  ThoughtCardModel? thoughtById(String id) => _repository.thoughtById(id);

  void addThoughtCard({
    required String stressfulThought,
    required String thinkingTrap,
    required String counterStatement,
  }) {
    _repository.addThoughtCard(
      ThoughtCardModel(
        id: 'thought-${DateTime.now().microsecondsSinceEpoch}',
        stressfulThought: stressfulThought.trim(),
        thinkingTrap: thinkingTrap.trim(),
        counterStatement: counterStatement.trim(),
        savedDateLabel: 'Saved today',
      ),
    );
    notifyListeners();
  }

  void deleteThoughtCard(String id) {
    _repository.deleteThoughtCard(id);
    notifyListeners();
  }

  void recordMeditationSession(int minutes) {
    _repository.recordMeditationSession(minutes);
    notifyListeners();
  }

  void recordBreathingSession() {
    _repository.recordBreathingSession();
    notifyListeners();
  }

  void resetAll() {
    _repository.resetAll();
    notifyListeners();
  }
}
