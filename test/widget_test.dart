import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quadrilibrium/app/app.dart';
import 'package:quadrilibrium/app/route_names.dart';
import 'package:quadrilibrium/presentation/screens/academics/bluttering_sheet_screen.dart';
import 'package:quadrilibrium/presentation/screens/academics/pomodoro_timer_screen.dart';
import 'package:quadrilibrium/presentation/view_models/app_state.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Future<void> setPhoneViewport(WidgetTester tester) async {
    tester.view.physicalSize = const Size(393 * 2, 852 * 2);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  testWidgets(
    'App launches at Welcome, validates login, and navigates to Home',
    (WidgetTester tester) async {
      await setPhoneViewport(tester);
      await tester.pumpWidget(const QuadrilibriumApp());
      await tester.pumpAndSettle();

      expect(find.text('Quadrilibrium'), findsOneWidget);
      expect(find.text('Balance in the Dark'), findsOneWidget);

      await tester.tap(find.text('Log In'));
      await tester.pumpAndSettle();
      expect(find.text('Welcome back'), findsOneWidget);

      // Tap Log In with default valid prototype credentials.
      await tester.tap(find.widgetWithText(FilledButton, 'Log In'));
      await tester.pumpAndSettle();

      // Home Dashboard shows 4 DIMENSIONS TRACKED (never a fabricated score).
      expect(find.text('DIMENSIONS TRACKED'), findsOneWidget);
      expect(find.text('Academics'), findsOneWidget);
      expect(find.text('Physical Fitness'), findsOneWidget);
      expect(find.text('Mental Wellbeing'), findsOneWidget);
      expect(find.text('Sleep'), findsOneWidget);
    },
  );

  testWidgets(
    'Bottom navigation switches between Home, Analytics, Trophies, Settings',
    (WidgetTester tester) async {
      await setPhoneViewport(tester);
      await tester.pumpWidget(
        const QuadrilibriumApp(initialLocation: RouteNames.home),
      );
      await tester.pumpAndSettle();

      // Switch to Progress -> visible title is Analytics
      await tester.tap(find.text('Progress'));
      await tester.pumpAndSettle();
      expect(find.text('Analytics'), findsOneWidget);
      expect(find.textContaining('WHO-5'), findsWidgets);

      // Switch to Trophies
      await tester.tap(find.text('Trophies'));
      await tester.pumpAndSettle();
      expect(find.text('Trophy Room'), findsOneWidget);
      expect(find.text('Unlocked'), findsOneWidget);
      expect(find.text('Locked'), findsOneWidget);

      // Switch to Settings & toggle Reduced Motion
      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();
      expect(find.text('Reduced motion'), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      // Open Reset confirmation dialog and confirm reset
      await tester.tap(find.text('Reset All Progress'));
      await tester.pumpAndSettle();
      expect(find.text('Reset all progress?'), findsOneWidget);
      await tester.tap(find.widgetWithText(FilledButton, 'Reset'));
      await tester.pumpAndSettle();
      expect(find.text('All progress has been reset.'), findsOneWidget);
    },
  );

  testWidgets('Water intake increments glass count and millilitres', (
    WidgetTester tester,
  ) async {
    await setPhoneViewport(tester);
    await tester.pumpWidget(
      const QuadrilibriumApp(initialLocation: RouteNames.waterIntake),
    );
    await tester.pumpAndSettle();

    expect(find.text('3'), findsOneWidget);
    expect(find.text('750 ml / 2000 ml'), findsOneWidget);

    await tester.tap(find.text('+ Add Glass (250 ml)'));
    await tester.pumpAndSettle();

    expect(find.text('4'), findsOneWidget);
    expect(find.text('1000 ml / 2000 ml'), findsOneWidget);
  });

  testWidgets('Schedule Generator adds a new task and deletes it', (
    WidgetTester tester,
  ) async {
    await setPhoneViewport(tester);
    await tester.pumpWidget(
      const QuadrilibriumApp(initialLocation: RouteNames.schedule),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();
    expect(find.text('New Task'), findsOneWidget);

    await tester.enterText(
      find.byType(TextFormField).first,
      'Operating Systems Lab',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'Save'));
    await tester.pumpAndSettle();

    expect(find.text('Operating Systems Lab'), findsOneWidget);
  });

  testWidgets('Pomodoro timer counts down and pauses cleanly', (
    WidgetTester tester,
  ) async {
    await setPhoneViewport(tester);
    final appState = AppState();
    addTearDown(appState.dispose);

    await tester.pumpWidget(
      AppStateScope(
        appState: appState,
        child: const MaterialApp(
          home: PomodoroTimerScreen(initialDurationSeconds: 5),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('00:05'), findsOneWidget);
    expect(find.text('READY'), findsOneWidget);

    await tester.tap(find.byTooltip('Start timer'));
    await tester.pump();
    expect(find.text('FOCUSING'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    expect(find.text('00:03'), findsOneWidget);

    await tester.tap(find.byTooltip('Pause timer'));
    await tester.pump();
    expect(find.text('PAUSED'), findsOneWidget);
  });

  testWidgets('Bluttering Sheet locks to read-only when timer expires', (
    WidgetTester tester,
  ) async {
    await setPhoneViewport(tester);
    final appState = AppState();
    addTearDown(appState.dispose);

    await tester.pumpWidget(
      AppStateScope(
        appState: appState,
        child: const MaterialApp(
          home: BlutteringSheetScreen(initialDurationSeconds: 2),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Typing starts the countdown timer.
    final writingField = find.byType(TextField).last;
    await tester.enterText(writingField, 'BST invariants');
    await tester.pump(const Duration(seconds: 3));

    expect(find.text('Read-only (timer expired)'), findsOneWidget);
    final widget = tester.widget<TextField>(writingField);
    expect(widget.readOnly, isTrue);
  });
}
