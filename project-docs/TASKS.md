# Tasks and Delivery Plan

Legend: `[x]` verified complete, `[ ]` not complete, `[~]` in progress/partially verified, `[?]` status not confirmed.

## Phase 0 — Documentation and product baseline

- [x] Define the 31-screen inventory from the supplied screen notes.
- [x] Establish Midnight Aurora color and typography rules.
- [x] Prepare PRD, architecture, design, rules and QA documentation.
- [x] Record evidence-informed Analytics scale specification.
- [x] Record WHO-5 licensing and non-diagnostic limitations.
- [x] Add direct Figma handoff references.

## Phase 1 — Figma prototype

- [x] Home Dashboard and four dimension entry points exist.
- [x] Main Progress/Analytics prototype frame exists.
- [x] Rename visible Progress page title to Analytics while retaining Progress tab label.
- [x] Remove the unsupported combined 74 balance score; centre now shows four dimensions tracked.
- [x] Replace Home percentage tiles with explicit sample metric labels.
- [x] Add distinct Analytics units and ranges for the four dimensions.
- [x] Add WHO-5 fortnightly sample trend and 50 reference line.
- [x] Add adult sleep-duration 7-hour reference line.
- [x] Preserve the WHO physical-activity weekly reference.
- [x] Verify prototype screenshots for Home and Analytics.
- [~] Test every prototype interaction manually from Welcome; not all interactions have been click-tested in this pass.

## Phase 2 — Flutter foundation

- [ ] Inspect the actual repository structure and current `pubspec.yaml`.
- [ ] Create/verify `main.dart`, `app.dart`, `theme.dart` and `router.dart`.
- [ ] Implement Midnight Aurora theme tokens.
- [ ] Implement reusable buttons, cards, fields, headers and bottom navigation.
- [ ] Implement stable GoRouter route names.
- [ ] Ensure Welcome, Login, Register, Home and Analytics run in Chrome.
- [ ] Run `dart format`, `flutter analyze` and baseline widget tests.

## Phase 3 — Main vertical slice

- [ ] Authentication screen mock flow and validation.
- [ ] Home Dashboard with four dimension routes.
- [ ] Analytics screen with separate chart units and sample data.
- [ ] Progress chart calculation models and tests.
- [ ] Trophy Room and Settings routes/dialogs.

## Phase 4 — Academics

- [ ] Schedule Generator and New Task.
- [ ] Pomodoro running, paused, reset and completed states.
- [ ] Bluttering Sheet editable, paused/expired read-only and save states.
- [ ] Saved Sheets list and empty state.
- [ ] Subject list, Add Subject, Subject Flashcards and New Flashcard.

## Phase 5 — Physical Fitness

- [ ] Workouts & Stretches list and Workout Detail.
- [ ] Add duration and intensity fields to completed workout sessions before calculating activity minutes.
- [ ] Water Intake tracking and updated state.
- [ ] Diet Intake and Add Meal.
- [ ] Unit tests for moderate-equivalent activity calculations.

## Phase 6 — Sleep and Mental Wellbeing

- [ ] Sleep Tracker and Sleep History.
- [ ] Cross-midnight sleep duration calculation tests.
- [ ] Meditation and breathing activity states.
- [ ] Thought Reframer add/view/delete flow.
- [ ] Decide whether WHO-5 is in MVP or a later optional check-in.
- [ ] If WHO-5 is added, reproduce the official instrument unchanged, include attribution and meet license conditions.
- [ ] Unit tests for WHO-5 scoring and missing-item behavior.

## Phase 7 — Quality, privacy and platform readiness

- [ ] Test no overflow at 360×800, 393×852 and 430×932 logical-pixel viewports.
- [ ] Test keyboard, screen-reader labels, large text and color contrast.
- [ ] Complete security/privacy review using `SECURITY.md` and OWASP MASVS guidance.
- [ ] Install/configure Android SDK.
- [ ] Accept Android SDK licenses and verify `flutter doctor`.
- [ ] Configure Windows Developer Mode if Windows plugin targets require symlink support.
- [ ] Test Android emulator or physical device.
- [ ] Create final screenshots and README feature map.
- [ ] Review release build only after all checks pass.

## Current blockers / dependencies

- Android SDK was missing in the user's last `flutter doctor` output. Chrome can be used for initial UI development meanwhile.
- Windows Developer Mode/symlink support was not confirmed as fixed.
- Actual Flutter repository contents have not been inspected in this task; do not assume the scaffold exists.
