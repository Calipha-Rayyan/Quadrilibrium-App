/// Stable route paths and names for Quadrilibrium.
/// Matches `project-docs/ARCHITECTURE.md`.
abstract final class RouteNames {
  // Authentication
  static const String welcome = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String registerSuccess = '/register-success';

  // Main navigation tabs
  static const String home = '/home';
  static const String analytics = '/analytics';
  static const String trophies = '/trophies';
  static const String settings = '/settings';

  // Academics
  static const String academics = '/academics';
  static const String schedule = '/academics/schedule';
  static const String newTask = '/academics/new-task';
  static const String pomodoro = '/academics/pomodoro';
  static const String bluttering = '/academics/bluttering';
  static const String savedSheets = '/academics/saved-sheets';
  static const String flashcards = '/academics/flashcards';
  static const String addSubject = '/academics/flashcards/add-subject';
  static const String subjectFlashcards = '/academics/flashcards/:subjectId';
  static const String newFlashcard = '/academics/flashcards/:subjectId/new';

  static String subjectFlashcardsPath(String subjectId) =>
      '/academics/flashcards/$subjectId';
  static String newFlashcardPath(String subjectId) =>
      '/academics/flashcards/$subjectId/new';

  // Physical Fitness
  static const String fitness = '/fitness';
  static const String workouts = '/fitness/workouts';
  static const String workoutDetail = '/fitness/workout/:id';
  static const String waterIntake = '/fitness/water';
  static const String dietIntake = '/fitness/diet';
  static const String addMeal = '/fitness/add-meal';

  static String workoutDetailPath(String workoutId) =>
      '/fitness/workout/$workoutId';

  // Sleep
  static const String sleep = '/sleep';
  static const String sleepHistory = '/sleep/history';

  // Mental Wellbeing
  static const String mental = '/mental';
  static const String meditation = '/mental/meditation';
  static const String breathing = '/mental/breathing';
  static const String thoughts = '/mental/thoughts';
  static const String newThought = '/mental/thoughts/new';
  static const String viewThought = '/mental/thoughts/:id';

  static String viewThoughtPath(String thoughtId) =>
      '/mental/thoughts/$thoughtId';
}
