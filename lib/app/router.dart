import 'package:go_router/go_router.dart';

import '../presentation/screens/academics/academics_dashboard_screen.dart';
import '../presentation/screens/academics/add_subject_screen.dart';
import '../presentation/screens/academics/bluttering_sheet_screen.dart';
import '../presentation/screens/academics/new_flashcard_screen.dart';
import '../presentation/screens/academics/new_task_screen.dart';
import '../presentation/screens/academics/pomodoro_timer_screen.dart';
import '../presentation/screens/academics/saved_sheets_screen.dart';
import '../presentation/screens/academics/schedule_generator_screen.dart';
import '../presentation/screens/academics/study_flashcards_screen.dart';
import '../presentation/screens/academics/subject_flashcards_screen.dart';
import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/auth/register_screen.dart';
import '../presentation/screens/auth/register_success_screen.dart';
import '../presentation/screens/auth/welcome_screen.dart';
import '../presentation/screens/dashboard/home_dashboard_screen.dart';
import '../presentation/screens/dashboard/progress_screen.dart';
import '../presentation/screens/dashboard/settings_screen.dart';
import '../presentation/screens/dashboard/trophy_room_screen.dart';
import '../presentation/screens/fitness/add_meal_screen.dart';
import '../presentation/screens/fitness/diet_intake_screen.dart';
import '../presentation/screens/fitness/physical_fitness_screen.dart';
import '../presentation/screens/fitness/water_intake_screen.dart';
import '../presentation/screens/fitness/workout_detail_screen.dart';
import '../presentation/screens/fitness/workouts_screen.dart';
import '../presentation/screens/mental_wellbeing/add_thought_card_screen.dart';
import '../presentation/screens/mental_wellbeing/breathing_exercises_screen.dart';
import '../presentation/screens/mental_wellbeing/meditation_screen.dart';
import '../presentation/screens/mental_wellbeing/mental_wellbeing_screen.dart';
import '../presentation/screens/mental_wellbeing/thought_reframer_screen.dart';
import '../presentation/screens/mental_wellbeing/view_thought_card_screen.dart';
import '../presentation/screens/sleep/sleep_history_screen.dart';
import '../presentation/screens/sleep/sleep_tracker_screen.dart';
import 'route_names.dart';

/// Single GoRouter configuration covering all 31+ Quadrilibrium screens.
GoRouter createAppRouter({String initialLocation = RouteNames.welcome}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      // Authentication
      GoRoute(
        path: RouteNames.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: RouteNames.registerSuccess,
        builder: (context, state) => const RegisterSuccessScreen(),
      ),

      // Main tabs
      GoRoute(
        path: RouteNames.home,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomeDashboardScreen()),
      ),
      GoRoute(
        path: RouteNames.analytics,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ProgressScreen()),
      ),
      GoRoute(
        path: RouteNames.trophies,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: TrophyRoomScreen()),
      ),
      GoRoute(
        path: RouteNames.settings,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SettingsScreen()),
      ),

      // Academics
      GoRoute(
        path: RouteNames.academics,
        builder: (context, state) => const AcademicsDashboardScreen(),
      ),
      GoRoute(
        path: RouteNames.schedule,
        builder: (context, state) => const ScheduleGeneratorScreen(),
      ),
      GoRoute(
        path: RouteNames.newTask,
        builder: (context, state) => const NewTaskScreen(),
      ),
      GoRoute(
        path: RouteNames.pomodoro,
        builder: (context, state) => const PomodoroTimerScreen(),
      ),
      GoRoute(
        path: RouteNames.bluttering,
        builder: (context, state) => const BlutteringSheetScreen(),
      ),
      GoRoute(
        path: RouteNames.savedSheets,
        builder: (context, state) => const SavedSheetsScreen(),
      ),
      GoRoute(
        path: RouteNames.flashcards,
        builder: (context, state) => const StudyFlashcardsScreen(),
      ),
      GoRoute(
        path: RouteNames.addSubject,
        builder: (context, state) => const AddSubjectScreen(),
      ),
      GoRoute(
        path: RouteNames.subjectFlashcards,
        builder: (context, state) => SubjectFlashcardsScreen(
          subjectId: state.pathParameters['subjectId'] ?? '',
        ),
      ),
      GoRoute(
        path: RouteNames.newFlashcard,
        builder: (context, state) => NewFlashcardScreen(
          subjectId: state.pathParameters['subjectId'] ?? '',
        ),
      ),

      // Physical Fitness
      GoRoute(
        path: RouteNames.fitness,
        builder: (context, state) => const PhysicalFitnessScreen(),
      ),
      GoRoute(
        path: RouteNames.workouts,
        builder: (context, state) => const WorkoutsScreen(),
      ),
      GoRoute(
        path: RouteNames.workoutDetail,
        builder: (context, state) =>
            WorkoutDetailScreen(workoutId: state.pathParameters['id'] ?? ''),
      ),
      GoRoute(
        path: RouteNames.waterIntake,
        builder: (context, state) => const WaterIntakeScreen(),
      ),
      GoRoute(
        path: RouteNames.dietIntake,
        builder: (context, state) => const DietIntakeScreen(),
      ),
      GoRoute(
        path: RouteNames.addMeal,
        builder: (context, state) => const AddMealScreen(),
      ),

      // Sleep
      GoRoute(
        path: RouteNames.sleep,
        builder: (context, state) => const SleepTrackerScreen(),
      ),
      GoRoute(
        path: RouteNames.sleepHistory,
        builder: (context, state) => const SleepHistoryScreen(),
      ),

      // Mental Wellbeing
      GoRoute(
        path: RouteNames.mental,
        builder: (context, state) => const MentalWellbeingScreen(),
      ),
      GoRoute(
        path: RouteNames.meditation,
        builder: (context, state) => const MeditationScreen(),
      ),
      GoRoute(
        path: RouteNames.breathing,
        builder: (context, state) => const BreathingExercisesScreen(),
      ),
      GoRoute(
        path: RouteNames.thoughts,
        builder: (context, state) => const ThoughtReframerScreen(),
      ),
      GoRoute(
        path: RouteNames.newThought,
        builder: (context, state) => const AddThoughtCardScreen(),
      ),
      GoRoute(
        path: RouteNames.viewThought,
        builder: (context, state) =>
            ViewThoughtCardScreen(thoughtId: state.pathParameters['id'] ?? ''),
      ),
    ],
  );
}
