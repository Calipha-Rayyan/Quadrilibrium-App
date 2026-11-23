import 'package:flutter/foundation.dart';

import '../../data/models/flashcard_model.dart';
import '../../data/models/study_sheet_model.dart';
import '../../data/models/subject_model.dart';
import '../../data/models/task_model.dart';
import '../../data/repositories/academics_repository.dart';

/// ViewModel for Academics: Schedule Generator, Pomodoro, Bluttering Sheet, Flashcards.
class AcademicsViewModel extends ChangeNotifier {
  AcademicsViewModel(this._repository, {required this.onFocusMinutesRecorded});

  final AcademicsRepository _repository;
  final ValueChanged<int> onFocusMinutesRecorded;

  int _completedPomodorosToday = 1;

  List<TaskModel> get tasks => _repository.tasks;
  List<StudySheetModel> get sheets => _repository.sheets;
  List<SubjectModel> get subjects => _repository.subjects;
  int get completedPomodorosToday => _completedPomodorosToday;

  SubjectModel? subjectById(String id) => _repository.subjectById(id);

  List<FlashcardModel> flashcardsForSubject(String subjectId) =>
      _repository.flashcardsForSubject(subjectId);

  int flashcardCountForSubject(String subjectId) =>
      _repository.flashcardsForSubject(subjectId).length;

  void addTask({
    required String title,
    required TaskType type,
    required String deadlineLabel,
    required int durationMinutes,
  }) {
    _repository.addTask(
      TaskModel(
        id: 'task-${DateTime.now().microsecondsSinceEpoch}',
        title: title.trim(),
        type: type,
        deadlineLabel: deadlineLabel.trim(),
        durationMinutes: durationMinutes,
      ),
    );
    notifyListeners();
  }

  void toggleTaskCompleted(String taskId) {
    _repository.toggleTaskCompleted(taskId);
    notifyListeners();
  }

  void deleteTask(String taskId) {
    _repository.deleteTask(taskId);
    notifyListeners();
  }

  void recordPomodoroCompletion(int minutes) {
    _completedPomodorosToday++;
    onFocusMinutesRecorded(minutes);
    notifyListeners();
  }

  void saveStudySheet({
    required String title,
    required String content,
    required int durationMinutes,
    required bool wasExpired,
  }) {
    _repository.addStudySheet(
      StudySheetModel(
        id: 'sheet-${DateTime.now().microsecondsSinceEpoch}',
        title: title.trim(),
        content: content.trim(),
        durationMinutes: durationMinutes,
        savedDateLabel: 'Today',
        wasExpired: wasExpired,
      ),
    );
    notifyListeners();
  }

  void deleteStudySheet(String id) {
    _repository.deleteStudySheet(id);
    notifyListeners();
  }

  SubjectModel addSubject({required String name, String description = ''}) {
    final subject = SubjectModel(
      id: 'sub-${DateTime.now().microsecondsSinceEpoch}',
      name: name.trim(),
      description: description.trim(),
    );
    _repository.addSubject(subject);
    notifyListeners();
    return subject;
  }

  void addFlashcard({
    required String subjectId,
    required String term,
    required String description,
  }) {
    _repository.addFlashcard(
      FlashcardModel(
        id: 'fc-${DateTime.now().microsecondsSinceEpoch}',
        subjectId: subjectId,
        term: term.trim(),
        description: description.trim(),
      ),
    );
    notifyListeners();
  }

  void deleteFlashcard(String cardId) {
    _repository.deleteFlashcard(cardId);
    notifyListeners();
  }

  void resetAll() {
    _completedPomodorosToday = 0;
    _repository.resetAll();
    notifyListeners();
  }
}
