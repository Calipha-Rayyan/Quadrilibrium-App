# Architecture

**Product:** Quadrilibrium — Midnight Aurora  
**Platform:** Flutter / Dart  
**Status:** Proposed implementation architecture; verify against the current repository before changing existing code.

## 1. Architectural approach

Use a feature-oriented Flutter structure with a small app shell and clear separation between presentation, state/view models, data models and repositories. The first milestone is a local/sample-data prototype. Do not add a backend or persistence package until the associated feature is approved.

### Layers

1. **App** — app bootstrap, theme, route table and global configuration.
2. **Core** — constants, small utilities, reusable services and design-independent helpers.
3. **Presentation** — screens, shared widgets and view models/state holders.
4. **Data** — models, sample data and repository implementations.

UI widgets must not contain database/network code. Screens call view models or repositories; repositories own data access.

## 2. Recommended project structure

```text
quadrilibrium/
├── android/
├── ios/
├── web/
├── assets/
│   ├── images/
│   ├── icons/
│   ├── animations/
│   └── fonts/
├── docs/
├── .claude/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   ├── app.dart
│   │   ├── router.dart
│   │   ├── route_names.dart
│   │   ├── theme.dart
│   │   └── theme_tokens.dart
│   ├── core/
│   │   ├── constants/
│   │   ├── extensions/
│   │   ├── services/
│   │   ├── utils/
│   │   └── widgets/
│   ├── data/
│   │   ├── local/
│   │   ├── models/
│   │   ├── repositories/
│   │   └── sample_data.dart
│   └── presentation/
│       ├── screens/
│       │   ├── auth/
│       │   ├── dashboard/
│       │   ├── academics/
│       │   ├── fitness/
│       │   ├── sleep/
│       │   └── mental_wellbeing/
│       ├── view_models/
│       └── widgets/
├── test/
│   ├── unit/
│   └── widget/
├── integration_test/
├── pubspec.yaml
├── analysis_options.yaml
├── README.md
├── PRD.md
├── ARCHITECTURE.md
├── DESIGN.md
├── RULES.md
├── TASKS.md
├── TEST_PLAN.md
├── SECURITY.md
├── DECISIONS.md
└── MEMORY.md
```

## 3. Screen file mapping

### Authentication

- `auth/welcome_screen.dart`
- `auth/login_screen.dart`
- `auth/register_screen.dart`
- `auth/register_success_screen.dart`

### Main dashboard

- `dashboard/home_dashboard_screen.dart`
- `dashboard/progress_screen.dart` (visible title: Analytics)
- `dashboard/trophy_room_screen.dart`
- `dashboard/settings_screen.dart`

### Academics

- `academics/academics_dashboard_screen.dart`
- `academics/schedule_generator_screen.dart`
- `academics/new_task_screen.dart`
- `academics/pomodoro_timer_screen.dart`
- `academics/bluttering_sheet_screen.dart`
- `academics/saved_sheets_screen.dart`
- `academics/study_flashcards_screen.dart`
- `academics/add_subject_screen.dart`
- `academics/subject_flashcards_screen.dart`
- `academics/new_flashcard_screen.dart`

### Fitness

- `fitness/physical_fitness_screen.dart`
- `fitness/workouts_screen.dart`
- `fitness/workout_detail_screen.dart`
- `fitness/water_intake_screen.dart`
- `fitness/diet_intake_screen.dart`
- `fitness/add_meal_screen.dart`

### Sleep

- `sleep/sleep_tracker_screen.dart`
- `sleep/sleep_history_screen.dart`

### Mental wellbeing

- `mental_wellbeing/mental_wellbeing_screen.dart`
- `mental_wellbeing/meditation_screen.dart`
- `mental_wellbeing/breathing_exercises_screen.dart`
- `mental_wellbeing/thought_reframer_screen.dart`
- `mental_wellbeing/add_thought_card_screen.dart`
- `mental_wellbeing/view_thought_card_screen.dart`

## 4. Shared data models

Suggested models (keep fields minimal and typed):

- `UserModel`
- `TaskModel`
- `SubjectModel`
- `FlashcardModel`
- `StudySheetModel`
- `WorkoutModel`
- `WorkoutSessionModel` (duration and intensity are required before activity-minute analytics)
- `MealModel`
- `WaterIntakeModel`
- `SleepRecordModel`
- `ThoughtCardModel`
- `AchievementModel`
- `ProgressModel`
- `Who5AssessmentModel` (only if the official WHO-5 is added with licensing/attribution)

Use `DateTime` for date/time values and numeric types with explicit units. Avoid storing ambiguous values such as `progress: 75` without a metric name and unit.

## 5. Navigation

Use one GoRouter configuration in `lib/app/router.dart`. Define named routes in `route_names.dart` or route constants in one place. Route names must be stable and must not be duplicated across screen widgets.

High-level routes:

```text
/                         Welcome
/login                    Login
/register                 Register
/register-success         Registration success
/home                    Home Dashboard
/analytics               Progress / Analytics
/trophies                Trophy Room
/settings                Settings
/academics               Academics dashboard
/academics/schedule      Schedule Generator
/academics/new-task      New Task
/academics/pomodoro      Pomodoro Timer
/academics/bluttering    Bluttering Sheet
/academics/saved-sheets  Saved Sheets
/academics/flashcards    Study Flashcards
/fitness                 Physical Fitness dashboard
/fitness/workouts        Workouts & Stretches
/fitness/workout/:id     Workout Detail
/fitness/water           Water Intake
/fitness/diet            Diet Intake
/fitness/add-meal        Add Meal
/sleep                   Sleep Tracker
/sleep/history           Sleep History
/mental                  Mental Wellbeing dashboard
/mental/meditation       Meditation
/mental/breathing        Breathing Exercises
/mental/thoughts         Thought Reframer
/mental/thoughts/new     Add Thought Card
/mental/thoughts/:id     View Thought Card
```

Main navigation is Home, Progress, Trophies and Settings. Focused activities such as Meditation, Pomodoro and timed writing should use a clear back/exit route and can hide the bottom navigation.

## 6. State management

Start with Flutter built-ins (`ChangeNotifier`, `ValueNotifier`, `setState`) where they fit. Use one pattern consistently per feature. Do not introduce Provider, Riverpod, Bloc or another dependency solely because it is popular; adopt one only after a concrete state-management need is documented in `DECISIONS.md`.

Timers must use a single source of truth for duration, remaining time and running/paused/completed state. UI animation must not become the source of truth for elapsed time.

## 7. Data and repository strategy

**Prototype phase:** hard-coded/sample data in `data/sample_data.dart`; in-memory repositories only where interactions need to update a list/counter.

**Later phase:** select a local or remote persistence layer only after requirements, data ownership, migration, backup, export and privacy needs are defined. Never add Firebase, Supabase or a custom API by assumption.

## 8. Analytics service boundary

Place calculation functions in a dedicated utility/service, not in a chart widget. Suggested functions:

- `calculateFocusMinutes(sessions, period)`
- `calculateDueTaskCompletion(completedDue, totalDue)`
- `calculateModerateEquivalentMinutes(moderateMinutes, vigorousMinutes)`
- `calculateWho5RawScore(responses)`
- `calculateWho5Percent(rawScore)`
- `calculateSleepDuration(bedtime, wakeTime)`
- `calculateAverageSleepDuration(records, period)`

Return a typed result with metric name, value, unit, window, provenance and whether the value is sample/estimated/user-entered. See `docs/ANALYTICS_SCALE_SPEC.md`.

## 9. Dependencies

The supplied terminal output confirms these packages were added:

- `go_router`
- `google_fonts`
- `fl_chart`
- `lucide_icons`
- `lottie`

Before changing package names or major versions, inspect `pubspec.yaml` and `pubspec.lock`. Add packages only when a planned feature uses them. Keep the code functional without optional Lottie assets by providing a Flutter-native fallback.

## 10. Architecture quality rules

- One screen per file.
- Shared visual patterns live in reusable widgets.
- Business calculations live outside widgets.
- Use immutable models where practical.
- Keep date, time, minutes, hours and scores explicit.
- Use stable route names and typed route parameters.
- Keep sample data separate from production repositories.
- Do not log passwords, private reflections or wellbeing questionnaire answers.
