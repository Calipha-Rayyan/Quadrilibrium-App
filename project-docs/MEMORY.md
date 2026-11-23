# Project Memory

**Last updated:** 23 November 2026

## Current state

- Product: **Quadrilibrium — Midnight Aurora**, a complete Flutter/Dart student productivity and personal-wellbeing application.
- All 31 core screens plus 3 state/dialog screens (34 total in `design/SCREEN_MANIFEST.csv`) are implemented in `lib/presentation/screens/` with `GoRouter`, Midnight Aurora theme tokens, Lucide icons (`lucide_icons_flutter`), and Flutter built-in `ChangeNotifier` view models (`AppStateScope`).
- Home Dashboard displays `4 DIMENSIONS TRACKED` (no arbitrary composite balance score).
- Analytics (`Progress` bottom tab) displays four separate `fl_chart` metric cards with distinct units, ranges, and reference lines (Academics 0–180 min/day, Physical Fitness 0–60 min/day + WHO adult 150–300 min/week, Mental Wellbeing WHO-5 0–100 with 50 follow-up line, Sleep 0–10 h/night with 7 h adult reference).
- All 86 Dart files in `lib/` and `test/` are implemented and formatted (0 placeholder 0-byte files remain).

## Verified checks

- `dart format lib test`: 0 formatting issues.
- `flutter analyze`: **No issues found!**
- `flutter test`: **14 tests passed** (8 unit tests for `AnalyticsCalculator`, `DateTimeUtils`, `InputValidators`; 6 phone-viewport widget tests covering Welcome/Login/Home, Bottom Navigation/Analytics/Trophies/Settings/Reset, Water Intake, Schedule Generator, Pomodoro Timer countdown, and Bluttering Sheet read-only expiry).
- Android SDK is not installed in this environment (verified via `flutter doctor`); Chrome (web) and Visual Studio 2022 (Windows) are available.

## Known limitations / next steps

- Local in-memory repositories are used for the prototype phase (no remote auth/database yet, per `ARCHITECTURE.md` Milestone 1).
- Future phases: add persistent local storage (e.g., `shared_preferences` / Drift), full official WHO-5 check-in flow with attribution, and Android SDK setup for Android APK builds.
