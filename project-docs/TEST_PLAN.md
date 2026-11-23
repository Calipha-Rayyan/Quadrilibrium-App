# Test Plan

**Purpose:** Define what “working” means before marking features complete.

## 1. Test strategy

- Unit tests: formulas, date/time conversions, validation and model transformations.
- Widget tests: screen rendering, form validation, selected/disabled states and callbacks.
- Integration tests: navigation and multi-step workflows.
- Manual UI QA: viewport sizes, keyboard, scrolling, text scaling and screen reader semantics.
- Platform QA: Chrome during the initial development phase; Android after SDK setup.

## 2. Core screen and navigation tests

### Authentication

- Welcome opens Login and Register.
- Login rejects empty/invalid fields with clear feedback.
- Register validates required fields, email and password confirmation.
- Successful mock registration routes to success then Home.
- Password visibility toggles without losing text.

### Main navigation

- Home tab opens Home Dashboard.
- Progress tab opens Analytics/Progress.
- Trophies tab opens Trophy Room.
- Settings tab opens Settings.
- The active state matches the screen.
- Each Home dimension card opens its correct module.

### Academics

- New Task saves a task and returns it to the schedule.
- Pomodoro start/pause/reset/completed states update correctly.
- Timer does not drift materially during pause/resume.
- Bluttering Sheet becomes read-only at expiry.
- Saved Sheets open and delete the correct entry.
- Flashcards remain associated with the selected subject.
- Front/back reveal works and remains accessible.

### Physical fitness

- Workout completion updates its status.
- Activity minutes are not calculated until duration and intensity exist.
- Add Glass updates count and millilitres consistently.
- Add Meal updates the intended nutrition summaries only.

### Sleep

- Bedtime 23:00 and wake-up 06:30 yields 7 h 30 m.
- A same-day bedtime/wake time yields a valid duration only when the UI explicitly supports it.
- Invalid or missing times show validation, not a fabricated duration.
- Average sleep uses available records only and labels its period.

### Mental wellbeing

- Thought card requires all three fields.
- Meditation and breathing controls transition correctly.
- If WHO-5 is implemented, missing answers do not produce a score.
- WHO-5 is not shown as a daily score and is never labelled a diagnosis.

## 3. Analytics formula tests

### Academic focus time

- Sum only completed/valid focus sessions in the selected time range.
- Convert minutes to hours using `minutes / 60`.
- If no sessions exist, show “No data yet”.

### Task completion rate

```text
completion_rate = completed_tasks_due_in_period / all_tasks_due_in_period × 100
```

- Exclude tasks not yet due from the denominator.
- If denominator is zero, show `N/A` or `No tasks due`, not `0%`.

### Moderate-equivalent activity

```text
moderate_equivalent_minutes = moderate_minutes + (2 × vigorous_minutes)
```

- Use only when the user has entered valid duration and intensity.
- Test moderate-only, vigorous-only, mixed and missing-data cases.
- Do not call the result a GPAQ score unless the complete GPAQ has been implemented and administered according to its guide.

### WHO-5

- Exactly five answered items are required for a score.
- Each item is 0–5.
- `raw_score = sum(five_item_scores)`; valid range 0–25.
- `percentage_score = raw_score × 4`; valid range 0–100.
- Any missing item means no total score; do not impute.
- The chart timestamp represents the assessment date, and each assessment reflects the preceding two weeks.
- A score below 50 is a prompt to consider further assessment, not an automatic diagnosis.

### Sleep duration

- Derive duration across midnight correctly.
- Validate impossible durations and timezone/date boundaries.
- Seven-night average uses only nights with valid records.
- Adult reference is shown only for the intended adult age group.

## 4. Layout and accessibility

Test at minimum:

- 360 × 800
- 393 × 852
- 430 × 932

Check:

- No yellow/black overflow stripes.
- Long text wraps or scrolls.
- Fixed navigation does not cover scrollable content.
- Forms remain usable with the keyboard open.
- Interactive touch areas are comfortably sized.
- Text and controls remain visible in larger text settings.
- Charts have text summaries and labelled units; colors are not the only data cue.

## 5. Quality gates

Run:

```powershell
dart format lib test
flutter analyze
flutter test
flutter run -d chrome
```

Run `flutter test` and `flutter analyze` after every coherent milestone. Add integration tests when major flows are implemented. Android checks are blocked until Android SDK setup is complete.

## 6. Completion rule

A task is complete only when acceptance criteria are met and the corresponding test evidence is recorded. A Figma link or successful static analysis alone does not prove a feature works at runtime.
