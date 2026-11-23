import 'package:flutter/material.dart';

import 'models/achievement_model.dart';
import 'models/flashcard_model.dart';
import 'models/meal_model.dart';
import 'models/progress_model.dart';
import 'models/sleep_record_model.dart';
import 'models/study_sheet_model.dart';
import 'models/subject_model.dart';
import 'models/task_model.dart';
import 'models/thought_card_model.dart';
import 'models/user_model.dart';
import 'models/water_intake_model.dart';
import 'models/workout_model.dart';

/// Illustrative sample data matching the Midnight Aurora visual references
/// and `project-docs/docs/ANALYTICS_SCALE_SPEC.md`.
abstract final class SampleData {
  static const UserModel defaultUser = UserModel(
    id: 'local-user-1',
    fullName: 'Alex Morgan',
    email: 'you@university.edu',
    avatarIndex: 0,
    isSampleUser: true,
  );

  static List<TaskModel> initialTasks() => [
    const TaskModel(
      id: 'task-1',
      title: 'DSA Quiz',
      type: TaskType.quiz,
      deadlineLabel: 'Due Fri',
      durationMinutes: 30,
    ),
    const TaskModel(
      id: 'task-2',
      title: 'ADA Project',
      type: TaskType.project,
      deadlineLabel: 'Due Mon',
      durationMinutes: 120,
    ),
    const TaskModel(
      id: 'task-3',
      title: 'DSA Quiz 2',
      type: TaskType.quiz,
      deadlineLabel: 'Due Wed',
      durationMinutes: 60,
    ),
    const TaskModel(
      id: 'task-4',
      title: 'SC Homework',
      type: TaskType.assignment,
      deadlineLabel: 'Due Thu',
      durationMinutes: 30,
    ),
  ];

  static List<StudySheetModel> initialStudySheets() => [
    const StudySheetModel(
      id: 'sheet-1',
      title: 'DSA recall — Trees',
      content: 'Binary search trees maintain left < parent < right. In-order traversal yields sorted output. AVL and Red-Black trees keep height O(log n).',
      durationMinutes: 10,
      savedDateLabel: 'Today',
    ),
    const StudySheetModel(
      id: 'sheet-2',
      title: 'ADA — Greedy methods',
      content: 'Greedy choice property + optimal substructure. Examples: Huffman coding, Kruskal and Prim MST, Dijkstra with non-negative weights.',
      durationMinutes: 10,
      savedDateLabel: 'Yesterday',
    ),
    const StudySheetModel(
      id: 'sheet-3',
      title: 'SC — Number systems',
      content: 'Binary, octal, hexadecimal conversions; two\'s complement representation for signed integers and IEEE-754 floating point basics.',
      durationMinutes: 5,
      savedDateLabel: 'Mon',
    ),
  ];

  static List<SubjectModel> initialSubjects() => [
    const SubjectModel(
      id: 'dsa',
      name: 'DSA',
      description: 'Data Structures and Algorithms',
    ),
    const SubjectModel(
      id: 'ada',
      name: 'ADA',
      description: 'Analysis and Design of Algorithms',
    ),
    const SubjectModel(
      id: 'sc',
      name: 'SC',
      description: 'Software Construction & Systems',
    ),
    const SubjectModel(
      id: 'toa',
      name: 'TOA',
      description: 'Theory of Automata',
    ),
  ];

  static List<FlashcardModel> initialFlashcards() => [
    const FlashcardModel(
      id: 'fc-1',
      subjectId: 'dsa',
      term: 'Binary Search Tree',
      description: 'A binary tree where left children are smaller and right children are larger than the parent.',
    ),
    const FlashcardModel(
      id: 'fc-2',
      subjectId: 'dsa',
      term: 'Stack',
      description: 'A LIFO (Last-In, First-Out) linear structure supporting push, pop, and peek in O(1) time.',
    ),
    const FlashcardModel(
      id: 'fc-3',
      subjectId: 'dsa',
      term: 'Queue',
      description: 'A FIFO (First-In, First-Out) structure used in BFS, scheduling, and buffering.',
    ),
    const FlashcardModel(
      id: 'fc-4',
      subjectId: 'dsa',
      term: 'Hash Table',
      description: 'Maps keys to buckets via a hash function for average O(1) lookup, insert, and delete.',
    ),
    const FlashcardModel(
      id: 'fc-5',
      subjectId: 'ada',
      term: 'Dynamic Programming',
      description: 'Solves overlapping subproblems with optimal substructure via memoization or tabulation.',
    ),
    const FlashcardModel(
      id: 'fc-6',
      subjectId: 'ada',
      term: 'Master Theorem',
      description: 'Determines asymptotic bounds for divide-and-conquer recurrences T(n) = aT(n/b) + f(n).',
    ),
    const FlashcardModel(
      id: 'fc-7',
      subjectId: 'sc',
      term: 'Two\'s Complement',
      description: 'Invert all bits and add 1 to represent signed negative integers in binary.',
    ),
    const FlashcardModel(
      id: 'fc-8',
      subjectId: 'toa',
      term: 'Deterministic Finite Automaton',
      description: 'A 5-tuple (Q, Σ, δ, q0, F) with exactly one transition per state and input symbol.',
    ),
  ];

  static const List<FoodOption> foodCatalog = [
    FoodOption(
      name: 'Brown Rice',
      baseCalories: 215,
      baseCarbsGrams: 45,
      baseProteinGrams: 5,
      baseFatsGrams: 2,
    ),
    FoodOption(
      name: 'White Rice with Dal',
      baseCalories: 290,
      baseCarbsGrams: 52,
      baseProteinGrams: 14,
      baseFatsGrams: 6,
    ),
    FoodOption(
      name: 'Fried Rice',
      baseCalories: 340,
      baseCarbsGrams: 48,
      baseProteinGrams: 10,
      baseFatsGrams: 12,
    ),
    FoodOption(
      name: 'Zarda Rice',
      baseCalories: 310,
      baseCarbsGrams: 58,
      baseProteinGrams: 6,
      baseFatsGrams: 8,
    ),
  ];

  static List<MealModel> initialMeals() => [
    const MealModel(
      id: 'meal-1',
      foodName: 'Brown Rice',
      servingSize: ServingSize.medium,
      calories: 215,
      carbsGrams: 90,
      proteinGrams: 24,
      fatsGrams: 16,
      isSample: true,
    ),
    const MealModel(
      id: 'meal-2',
      foodName: 'White Rice with Dal',
      servingSize: ServingSize.large,
      calories: 420,
      carbsGrams: 90,
      proteinGrams: 30,
      fatsGrams: 22,
      isSample: true,
    ),
  ];

  static const WaterIntakeModel initialWater = WaterIntakeModel(
    glassesConsumed: 3,
    goalGlasses: 8,
    mlPerGlass: 250,
  );

  static List<WorkoutModel> initialWorkouts() => [
    const WorkoutModel(
      id: 'morning-stretch',
      title: 'Morning Stretch',
      category: WorkoutCategory.stretch,
      durationMinutes: 10,
      exercises: [
        ExerciseStep(
          id: 'ex-1',
          name: '1  Neck Rolls',
          instruction: 'Slowly roll your head side to side',
          durationLabel: '30 sec',
        ),
        ExerciseStep(
          id: 'ex-2',
          name: '2  Shoulder Stretch',
          instruction: 'Pull one arm across your chest',
          durationLabel: '30 sec',
        ),
        ExerciseStep(
          id: 'ex-3',
          name: '3  Cat-Cow',
          instruction: 'Alternate arching and rounding your back',
          durationLabel: '1 min',
        ),
        ExerciseStep(
          id: 'ex-4',
          name: '4  Hamstring Stretch',
          instruction: 'Reach toward your toes, knees soft',
          durationLabel: '1 min',
        ),
        ExerciseStep(
          id: 'ex-5',
          name: '5  Hip Flexor Stretch',
          instruction: 'Step into a gentle kneeling lunge',
          durationLabel: '1 min',
        ),
        ExerciseStep(
          id: 'ex-6',
          name: '6  Deep Breathing Cool-Down',
          instruction: 'Stand tall and take five slow breaths',
          durationLabel: '1 min',
        ),
      ],
    ),
    const WorkoutModel(
      id: 'full-body-basics',
      title: 'Full Body Basics',
      category: WorkoutCategory.workout,
      durationMinutes: 20,
      exercises: [
        ExerciseStep(
          id: 'fb-1',
          name: '1  Jumping Jacks',
          instruction: 'Light cardio warm-up at steady pace',
          durationLabel: '2 min',
        ),
        ExerciseStep(
          id: 'fb-2',
          name: '2  Bodyweight Squats',
          instruction: 'Keep chest tall and knees aligned',
          durationLabel: '3 min',
        ),
        ExerciseStep(
          id: 'fb-3',
          name: '3  Push-Ups',
          instruction: 'Standard or knee-supported push-ups',
          durationLabel: '3 min',
        ),
        ExerciseStep(
          id: 'fb-4',
          name: '4  Reverse Lunges',
          instruction: 'Alternate legs with controlled balance',
          durationLabel: '3 min',
        ),
        ExerciseStep(
          id: 'fb-5',
          name: '5  Glute Bridges',
          instruction: 'Drive through heels and hold briefly',
          durationLabel: '3 min',
        ),
        ExerciseStep(
          id: 'fb-6',
          name: '6  Forearm Plank',
          instruction: 'Brace core and keep neutral spine',
          durationLabel: '2 min',
        ),
      ],
    ),
    const WorkoutModel(
      id: 'core-strength',
      title: 'Core Strength',
      category: WorkoutCategory.workout,
      durationMinutes: 15,
      isCompleted: true,
      exercises: [
        ExerciseStep(
          id: 'cs-1',
          name: '1  Dead Bug',
          instruction: 'Extend opposite arm and leg slowly',
          durationLabel: '3 min',
          isDone: true,
        ),
        ExerciseStep(
          id: 'cs-2',
          name: '2  Bird-Dog',
          instruction: 'Stabilize hips while extending limbs',
          durationLabel: '3 min',
          isDone: true,
        ),
        ExerciseStep(
          id: 'cs-3',
          name: '3  Side Plank',
          instruction: 'Hold each side with stacked shoulders',
          durationLabel: '3 min',
          isDone: true,
        ),
        ExerciseStep(
          id: 'cs-4',
          name: '4  Bicycle Crunches',
          instruction: 'Controlled rotation without pulling neck',
          durationLabel: '3 min',
          isDone: true,
        ),
        ExerciseStep(
          id: 'cs-5',
          name: '5  Child\'s Pose Recovery',
          instruction: 'Relax lower back and breathe evenly',
          durationLabel: '3 min',
          isDone: true,
        ),
      ],
    ),
    const WorkoutModel(
      id: 'evening-cool-down',
      title: 'Evening Cool Down',
      category: WorkoutCategory.stretch,
      durationMinutes: 8,
      exercises: [
        ExerciseStep(
          id: 'ec-1',
          name: '1  Seated Forward Fold',
          instruction: 'Hinge gently from hips',
          durationLabel: '90 sec',
        ),
        ExerciseStep(
          id: 'ec-2',
          name: '2  Supine Spinal Twist',
          instruction: 'Drop knees softly to each side',
          durationLabel: '2 min',
        ),
        ExerciseStep(
          id: 'ec-3',
          name: '3  Figure-Four Stretch',
          instruction: 'Release hips and glutes',
          durationLabel: '2 min',
        ),
        ExerciseStep(
          id: 'ec-4',
          name: '4  Chest Opener',
          instruction: 'Clasp hands behind back gently',
          durationLabel: '90 sec',
        ),
        ExerciseStep(
          id: 'ec-5',
          name: '5  Slow Exhale Rest',
          instruction: 'Unwind shoulders before bedtime',
          durationLabel: '1 min',
        ),
      ],
    ),
  ];

  static List<SleepRecordModel> initialSleepRecords() => [
    const SleepRecordModel(
      id: 'sleep-1',
      dateLabel: 'Mon, 16 Nov',
      bedtime: TimeOfDay(hour: 23, minute: 0),
      wakeTime: TimeOfDay(hour: 6, minute: 30),
      isSample: true,
    ),
    const SleepRecordModel(
      id: 'sleep-2',
      dateLabel: 'Sun, 15 Nov',
      bedtime: TimeOfDay(hour: 0, minute: 15),
      wakeTime: TimeOfDay(hour: 7, minute: 0),
      isSample: true,
    ),
    const SleepRecordModel(
      id: 'sleep-3',
      dateLabel: 'Sat, 14 Nov',
      bedtime: TimeOfDay(hour: 23, minute: 30),
      wakeTime: TimeOfDay(hour: 7, minute: 30),
      isSample: true,
    ),
    const SleepRecordModel(
      id: 'sleep-4',
      dateLabel: 'Fri, 13 Nov',
      bedtime: TimeOfDay(hour: 1, minute: 0),
      wakeTime: TimeOfDay(hour: 7, minute: 0),
      isSample: true,
    ),
  ];

  static const List<String> thinkingTraps = [
    'Catastrophizing',
    'Mind reading',
    'Overgeneralizing',
    'All-or-nothing',
    'Comparing',
  ];

  static List<ThoughtCardModel> initialThoughtCards() => [
    const ThoughtCardModel(
      id: 'thought-1',
      stressfulThought: 'I will fail this exam',
      thinkingTrap: 'Catastrophizing',
      counterStatement:
          'I have prepared and can handle each question one at a time.',
      savedDateLabel: 'Saved today',
    ),
    const ThoughtCardModel(
      id: 'thought-2',
      stressfulThought: 'Everyone is better than me',
      thinkingTrap: 'Comparing',
      counterStatement: 'Everyone learns at a different pace; I can measure my progress against last week.',
      savedDateLabel: 'Yesterday',
    ),
    const ThoughtCardModel(
      id: 'thought-3',
      stressfulThought: 'I never finish anything',
      thinkingTrap: 'Overgeneralizing',
      counterStatement: 'I completed several tasks this week and can break the next one into small steps.',
      savedDateLabel: 'Mon, 16 Nov',
    ),
  ];

  static List<AchievementModel> initialAchievements() => [
    const AchievementModel(
      id: 'healthy-sleeper',
      title: 'Healthy Sleeper',
      description: 'Slept 7 hours throughout the week',
      isUnlocked: true,
      progress: 1.0,
    ),
    const AchievementModel(
      id: 'all-rounder',
      title: 'All Rounder',
      description:
          'Reach goals across all four dimensions in a week (provisional)',
      isUnlocked: false,
      progress: 0.45,
      isProvisional: true,
    ),
    const AchievementModel(
      id: 'focus-master',
      title: 'Focus Master',
      description: 'Complete 4 Pomodoro sessions in a day',
      isUnlocked: false,
      progress: 0.25,
    ),
    const AchievementModel(
      id: 'hydration-hero',
      title: 'Hydration Hero',
      description: 'Hit the water goal 7 days in a row',
      isUnlocked: false,
      progress: 0.375,
    ),
  ];

  static ProgressModel initialProgress() => const ProgressModel(
    // Sum = 615 min/week (10.25 h -> displays as 10.3 h)
    academicFocusMinutesByDay: [
      DailyMetricPoint(label: 'M', value: 85),
      DailyMetricPoint(label: 'T', value: 110),
      DailyMetricPoint(label: 'W', value: 65),
      DailyMetricPoint(label: 'T', value: 125),
      DailyMetricPoint(label: 'F', value: 95),
      DailyMetricPoint(label: 'S', value: 60),
      DailyMetricPoint(label: 'S', value: 75),
    ],
    // Sum = 240 min/week (WHO adult guideline 150-300 min/week)
    moderateActivityMinutesByDay: [
      DailyMetricPoint(label: 'M', value: 35),
      DailyMetricPoint(label: 'T', value: 25),
      DailyMetricPoint(label: 'W', value: 40),
      DailyMetricPoint(label: 'T', value: 30),
      DailyMetricPoint(label: 'F', value: 45),
      DailyMetricPoint(label: 'S', value: 45),
      DailyMetricPoint(label: 'S', value: 20),
    ],
    // WHO-5 periodic 14-day assessments (52, 58, 64, 68)
    who5CheckInPoints: [
      DailyMetricPoint(label: 'O12', value: 52),
      DailyMetricPoint(label: 'O26', value: 58),
      DailyMetricPoint(label: 'N09', value: 64),
      DailyMetricPoint(label: 'N23', value: 68),
    ],
    // Avg = 7.2 h/night
    sleepHoursByDay: [
      DailyMetricPoint(label: 'M', value: 7.5),
      DailyMetricPoint(label: 'T', value: 6.8),
      DailyMetricPoint(label: 'W', value: 7.5),
      DailyMetricPoint(label: 'T', value: 6.9),
      DailyMetricPoint(label: 'F', value: 6.5),
      DailyMetricPoint(label: 'S', value: 7.4),
      DailyMetricPoint(label: 'S', value: 7.8),
    ],
    streakDays: 5,
    isSampleData: true,
  );
}
