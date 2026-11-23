import '../models/thought_card_model.dart';
import '../sample_data.dart';

/// In-memory repository for Mental Wellbeing thought cards and meditation logs.
class MentalWellbeingRepository {
  MentalWellbeingRepository()
    : _thoughtCards = SampleData.initialThoughtCards();

  final List<ThoughtCardModel> _thoughtCards;
  int _completedMeditationMinutes = 0;
  int _completedBreathingSessions = 0;

  List<ThoughtCardModel> get thoughtCards => List.unmodifiable(_thoughtCards);
  int get completedMeditationMinutes => _completedMeditationMinutes;
  int get completedBreathingSessions => _completedBreathingSessions;

  ThoughtCardModel? thoughtById(String id) {
    for (final c in _thoughtCards) {
      if (c.id == id) return c;
    }
    return null;
  }

  void addThoughtCard(ThoughtCardModel card) => _thoughtCards.insert(0, card);

  void deleteThoughtCard(String id) =>
      _thoughtCards.removeWhere((c) => c.id == id);

  void recordMeditationSession(int minutes) {
    if (minutes > 0) _completedMeditationMinutes += minutes;
  }

  void recordBreathingSession() {
    _completedBreathingSessions++;
  }

  void resetAll() {
    _thoughtCards.clear();
    _completedMeditationMinutes = 0;
    _completedBreathingSessions = 0;
  }
}
