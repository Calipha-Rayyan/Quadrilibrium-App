import 'package:flutter/widgets.dart';

import '../../data/repositories/academics_repository.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/fitness_repository.dart';
import '../../data/repositories/mental_wellbeing_repository.dart';
import '../../data/repositories/progress_repository.dart';
import '../../data/repositories/sleep_repository.dart';
import 'academics_view_model.dart';
import 'auth_view_model.dart';
import 'dashboard_view_model.dart';
import 'fitness_view_model.dart';
import 'mental_wellbeing_view_model.dart';
import 'sleep_view_model.dart';
import 'trophy_view_model.dart';

/// Central state container wiring all feature ViewModels together using Flutter's
/// built-in [ChangeNotifier] pattern without external state-management packages.
class AppState {
  AppState() {
    final authRepo = AuthRepository();
    final academicsRepo = AcademicsRepository();
    final fitnessRepo = FitnessRepository();
    final sleepRepo = SleepRepository();
    final mentalRepo = MentalWellbeingRepository();
    final progressRepo = ProgressRepository();

    auth = AuthViewModel(authRepo);
    dashboard = DashboardViewModel(progressRepo);
    trophies = TrophyViewModel(progressRepo);

    academics = AcademicsViewModel(
      academicsRepo,
      onFocusMinutesRecorded: (minutes) {
        dashboard.recordFocusMinutes(minutes);
        final progress = (academics.completedPomodorosToday / 4.0).clamp(
          0.0,
          1.0,
        );
        trophies.updateProgress('focus-master', progress: progress);
        dashboard.refresh();
      },
    );

    fitness = FitnessViewModel(
      fitnessRepo,
      onActivityMinutesRecorded: (minutes) {
        dashboard.recordActivityMinutes(minutes);
      },
      onHydrationChanged: (progress) {
        trophies.updateProgress('hydration-hero', progress: progress);
        dashboard.refresh();
      },
    );

    sleep = SleepViewModel(
      sleepRepo,
      onSleepHoursLogged: (hours) {
        dashboard.recordSleepHours(hours);
        if (hours >= 7.0) {
          trophies.updateProgress(
            'healthy-sleeper',
            progress: 1.0,
            unlocked: true,
          );
          dashboard.refresh();
        }
      },
    );

    mentalWellbeing = MentalWellbeingViewModel(mentalRepo);
  }

  late final AuthViewModel auth;
  late final DashboardViewModel dashboard;
  late final TrophyViewModel trophies;
  late final AcademicsViewModel academics;
  late final FitnessViewModel fitness;
  late final SleepViewModel sleep;
  late final MentalWellbeingViewModel mentalWellbeing;

  /// Clears user progress across all four dimensions and trophies.
  void resetAllProgress() {
    academics.resetAll();
    fitness.resetAll();
    sleep.resetAll();
    mentalWellbeing.resetAll();
    dashboard.resetAll();
    trophies.refresh();
  }

  void dispose() {
    auth.dispose();
    dashboard.dispose();
    trophies.dispose();
    academics.dispose();
    fitness.dispose();
    sleep.dispose();
    mentalWellbeing.dispose();
  }
}

/// InheritedWidget providing [AppState] to the widget tree.
class AppStateScope extends InheritedWidget {
  const AppStateScope({
    super.key,
    required this.appState,
    required super.child,
  });

  final AppState appState;

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'No AppStateScope found in context');
    return scope!.appState;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) =>
      appState != oldWidget.appState;
}
