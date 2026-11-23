import '../models/flashcard_model.dart';
import '../models/study_sheet_model.dart';
import '../models/subject_model.dart';
import '../models/task_model.dart';
import '../sample_data.dart';

/// In-memory repository for Academics tasks, Bluttering sheets, subjects, and flashcards.
class AcademicsRepository {
  AcademicsRepository()
    : _tasks = SampleData.initialTasks(),
      _sheets = SampleData.initialStudySheets(),
      _subjects = SampleData.initialSubjects(),
      _flashcards = SampleData.initialFlashcards();

  final List<TaskModel> _tasks;
  final List<StudySheetModel> _sheets;
  final List<SubjectModel> _subjects;
  final List<FlashcardModel> _flashcards;

  List<TaskModel> get tasks => List.unmodifiable(_tasks);
  List<StudySheetModel> get sheets => List.unmodifiable(_sheets);
  List<SubjectModel> get subjects => List.unmodifiable(_subjects);
  List<FlashcardModel> get flashcards => List.unmodifiable(_flashcards);

  List<FlashcardModel> flashcardsForSubject(String subjectId) =>
      _flashcards.where((c) => c.subjectId == subjectId).toList();

  SubjectModel? subjectById(String subjectId) {
    for (final s in _subjects) {
      if (s.id == subjectId) return s;
    }
    return null;
  }

  void addTask(TaskModel task) => _tasks.insert(0, task);

  void toggleTaskCompleted(String taskId) {
    final index = _tasks.indexWhere((t) => t.id == taskId);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(
        isCompleted: !_tasks[index].isCompleted,
      );
    }
  }

  void deleteTask(String taskId) => _tasks.removeWhere((t) => t.id == taskId);

  void addStudySheet(StudySheetModel sheet) => _sheets.insert(0, sheet);

  void deleteStudySheet(String sheetId) =>
      _sheets.removeWhere((s) => s.id == sheetId);

  void addSubject(SubjectModel subject) => _subjects.add(subject);

  void addFlashcard(FlashcardModel card) => _flashcards.insert(0, card);

  void deleteFlashcard(String cardId) =>
      _flashcards.removeWhere((c) => c.id == cardId);

  void resetAll() {
    _tasks.clear();
    _sheets.clear();
  }
}
