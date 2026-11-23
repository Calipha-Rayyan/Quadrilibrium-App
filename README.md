# Quadrilibrium

**MIDNIGHT AURORA — Balance in the Dark**

A Flutter-based student productivity and wellbeing app that brings academics, physical fitness, sleep, and mental wellbeing tracking into one focused experience.

---

## Problem Addressed

Students often juggle separate apps for study planning, focus timers, flashcards, workouts, hydration, nutrition, sleep schedules, and reflective exercises. Switching across disconnected tools makes it difficult to spot weekly habits without feeling overwhelmed. **Quadrilibrium** unifies these four life dimensions into one calm, dark-mode interface while keeping each dimension's metrics, units, and reference ranges transparently separate.

> **Wellbeing safeguards:** Quadrilibrium does not calculate or display an arbitrary composite health score. Each dimension uses its own unit and scale. WHO-5 (0–100, 14-day recall) is a screening check-in instrument, not a clinical diagnosis. Prototype values are clearly labeled as illustrative sample data.

---

## Application Dimensions & Features

1. **Authentication & App Shell**
   - Welcome, Login, Register, and Register Success flows with input validation, show/hide password controls, and inline error feedback (local development mode; no remote server).
   - Persistent 4-tab bottom navigation (`Home`, `Progress`, `Trophies`, `Settings`).
2. **Home Dashboard & Analytics (`Progress`)**
   - Home displays a four-segment Quadrilibrium ring (`4 DIMENSIONS TRACKED`), 2×2 dimension cards with explicit weekly units, and a streak / average sleep / trophies summary bar.
   - Analytics renders four separate `fl_chart` metric cards on independent axes: Academics focus minutes (`0–180 min/day`), Physical Fitness moderate activity (`0–60 min/day`, WHO adult `150–300 min/week` reference), Mental Wellbeing (`WHO-5 0–100`, `<50` follow-up reference line), and Sleep duration (`0–10 h/night`, adult `≥7 h` reference line).
3. **Academics**
   - Schedule Generator & New Task (task types, deadline picker, duration, completion toggle, delete).
   - Pomodoro Timer (real countdown, Play/Pause/Reset, session logging, Randomizer Music Player).
   - Bluttering Sheet (timed recall writing editor that locks read-only on expiry) & Saved Sheets.
   - Study Flashcards (subject decks, Add Subject, interactive flip-card viewer, New Flashcard).
4. **Physical Fitness**
   - Workouts & Stretches (category filter chips) and Workout Detail (interactive exercise checklist & completion tracking).
   - Water Intake (circular progress ring, glass count, millilitre total, 8-glass visual indicator, `+ Add Glass (250 ml)`).
   - Diet Intake (Carbohydrates, Protein, Fats progress bars & meal log) and Add Meal (food selection + Small/Medium/Large serving sizes).
5. **Sleep**
   - Sleep Tracker (bedtime & wake-up pickers with accurate midnight-crossing duration calculation) and Sleep History timeline.
6. **Mental Wellbeing**
   - Meditation timer (concentric glowing rings, Play/Pause/Reset/Stop).
   - Breathing Exercises (`Inhale 4s · Hold 4s · Exhale 4s · Rest 2s` animated orb respecting Reduced Motion).
   - Thought Reframer, Add Thought Card (Stressful Thought, Thinking Trap, Realistic Counter-Statement), and View Thought Card with delete confirmation.
7. **Trophy Room & Settings**
   - Trophy Room separating Unlocked and Locked achievements with live progress.
   - Settings with profile icon picker, name editor, Reduced Motion toggle, Reset All Progress confirmation dialog, Sign Out confirmation dialog, and UI states reference sheet.

---

## Technology Stack

- **Framework:** Flutter `3.47.5` (stable) / Dart `3.13.4`
- **Routing:** `go_router`
- **Typography & Icons:** `google_fonts` (Manrope), `lucide_icons_flutter`
- **Charts & Animation:** `fl_chart`, `lottie`
- **State Management:** Flutter built-in `ChangeNotifier` + `InheritedWidget` (`AppStateScope`)

---

## Project Folder Structure

```text
quadrilibrium/
├── AGENTS.md                   # Google Antigravity workspace instructions
├── README.md                   # Project overview & setup
├── pubspec.yaml                # Dependencies & Flutter configuration
├── pubspec.lock                # Locked dependency versions
├── analysis_options.yaml       # Dart/Flutter lint configuration
├── lib/                        # Flutter source code (all 31+ screens implemented)
│   ├── main.dart               # App entry point
│   ├── app/                    # App shell, Midnight Aurora theme tokens, GoRouter
│   ├── core/                   # Constants, validators, date/time & analytics calculators
│   ├── data/                   # Typed immutable models, repositories, sample data
│   └── presentation/           # Screens, ChangeNotifier view models, shared widgets
├── assets/                     # Runtime app assets only (images, icons, fonts, animations)
├── design/                     # Canonical Figma design references (not bundled at runtime)
│   ├── README.md               # Guide to canonical design assets
│   ├── SCREEN_MANIFEST.csv     # 34-screen index mapped to Flutter files & Figma
│   ├── screens/                # Latest 6 PNG reference strips (all 34 screens)
│   ├── contact_sheets/         # Numbered contact sheets (01–34)
│   ├── exports/                # Combined 34-page PDF snapshot
│   └── source/                 # Original CS 442 lab brief PDF
├── project-docs/               # Canonical documentation (PRD, ARCHITECTURE, DESIGN, RULES, audits, implementation)
├── test/                       # Unit tests & 393×852 phone-viewport widget tests
└── integration_test/           # Integration test directory
```

---

## Setup & Running Locally

### Prerequisites

- Flutter SDK `3.47.5` (or compatible Dart `^3.13.4`)
- Google Chrome (for web testing) or Android Studio / Android SDK (for Android builds)

### Install Dependencies

```powershell
flutter pub get
```

### Run the Application

```powershell
flutter run -d chrome
```

### Run Quality Checks & Tests

```powershell
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
flutter build web --release
```

---

## Design References

- **Figma (Editable Source of Truth):** [Quadrilibrium — Midnight Aurora](https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium)
- **Canonical Local Exports:** [design/README.md](design/README.md) and [design/SCREEN_MANIFEST.csv](design/SCREEN_MANIFEST.csv)

---

## Development Status

- **Implemented & Verified:** All 31 core screens + 3 confirmation/state screens (34 manifest entries), full `GoRouter` navigation, centralized Midnight Aurora design system, interactive timers/forms/charts, 14 passing unit & widget tests, `0` analyzer issues, and verified `flutter build web --release`.
- **Current Scope Limitations:** Uses local in-memory repositories with clearly labeled sample data for the Milestone 1 prototype (no live backend authentication or remote database yet). Android APK builds require installing the Android SDK locally.
- See [project-docs/implementation/IMPLEMENTATION_REPORT.md](project-docs/implementation/IMPLEMENTATION_REPORT.md) for full details.

---

## Contribution Workflow

1. Read `AGENTS.md`, `project-docs/ARCHITECTURE.md`, `project-docs/DESIGN.md`, and `project-docs/RULES.md`.
2. Make focused changes following Conventional Commits (`feat:`, `fix:`, `docs:`, `design:`, `test:`, `chore:`).
3. Run `dart format lib test`, `flutter analyze`, and `flutter test` before pushing.
4. Preserve wellbeing safeguards and never commit secrets, `.env` files, or keystores.
