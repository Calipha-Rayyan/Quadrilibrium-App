# Product Requirements Document (PRD)

**Product:** Quadrilibrium — Midnight Aurora  
**Version:** 1.0  
**Date:** 23 November 2026  
**Status:** Baseline for Flutter implementation

## 1. Product summary

Quadrilibrium is a mobile-first student productivity and personal-wellbeing tracker. It brings academic planning, physical activity, mental-wellbeing activities and sleep routines into one application. Home presents the four dimensions; Analytics/Progress shows separate, understandable trends for each dimension.

## 2. Problem statement

Students often use separate tools for study plans, focus timers, workouts, hydration, sleep routines and reflective activities. Switching between tools makes it difficult to see patterns across the week. Quadrilibrium provides one place to record these activities and review their trends without presenting the app as a medical diagnostic tool.

## 3. Target users

- Primary: higher-education students who want a single place to plan study activity and record basic wellbeing routines.
- Secondary: learners who prefer a simple, visual weekly overview.
- Health-reference assumptions: adult activity and sleep recommendations must be labelled for the applicable age group. Do not apply adult references to a minor without selecting age-appropriate guidance.

## 4. Product goals

1. Provide a consistent home for the four dimensions.
2. Let users navigate through the complete 31-screen feature set.
3. Make common student workflows simple: plan, focus, review, record and reflect.
4. Show trends with explicit units and scientifically defensible reference points where available.
5. Avoid arbitrary global health scores, shame-based messaging and clinical diagnosis claims.
6. Keep the first build affordable and suitable for a student project using local/sample data.

## 5. Non-goals for the first visual MVP

- Clinical diagnosis, treatment recommendations or emergency/medical triage.
- A validated overall health or life-balance score combining unrelated domains.
- AI mental-health counselling.
- Wearable integrations or automatic sensor-based fitness/sleep measurements.
- Payments, social feeds, public leaderboards or cloud synchronization.
- Production authentication or a remote database until those are separately scoped.

## 6. Main navigation and screen inventory

The design scope contains these 31 screens:

| # | Screen | Primary responsibility |
|---:|---|---|
| 1 | Welcome | Entry point and account actions |
| 2 | Login | Email/password form and validation state |
| 3 | Register | Account-creation form and validation |
| 4 | Home Dashboard | Four-part Quadrilibrium overview and dimension entry points |
| 5 | Progress / Analytics | Separate weekly and periodic metrics for four dimensions |
| 6 | Trophy Room | Unlocked and locked achievements |
| 7 | Settings / Profile | Profile, reset and sign-out actions |
| 8 | Academics | Academic feature menu |
| 9 | Schedule Generator | View and manage study tasks |
| 10 | New Task | Add a task with type and deadline |
| 11 | Pomodoro Timer | Focus/break timer and controls |
| 12 | Bluttering Sheet | Timed writing editor |
| 13 | Saved Sheets | Browse, open and delete saved sheets |
| 14 | Study Flashcards | Choose a subject |
| 15 | Add Subject | Create a subject |
| 16 | Subject Flashcards | View cards for the selected subject |
| 17 | New Flashcard | Create term/front and description/back |
| 18 | Physical Fitness | Fitness feature menu |
| 19 | Workouts & Stretches | Browse workout routines |
| 20 | Workout Detail | Review exercises and mark completion |
| 21 | Water Intake | Record glasses and daily amount |
| 22 | Diet Intake | Review carbs, protein and fat summary |
| 23 | Add Meal | Select food and serving size |
| 24 | Sleep | Record bedtime and wake-up time |
| 25 | Sleep History | Review previous sleep records |
| 26 | Mental Wellbeing | Mental-wellbeing feature menu |
| 27 | Meditation | Focused meditation session |
| 28 | Breathing Exercises | Guided inhale/hold/exhale animation |
| 29 | Thought Reframer | Browse saved reflection cards |
| 30 | Add Thought Card | Record stressful thought, thinking trap and counter-statement |
| 31 | View Thought Card | Review and optionally delete a saved card |

**Terminology:** Keep “Bluttering Sheet” as it appears in the supplied sketches until the product owner explicitly approves a user-facing rename.

## 7. Functional requirements

### 7.1 Authentication and profile

- Provide Login and Register routes from Welcome.
- Register collects full name, email, password and confirmation.
- Show required-field, invalid-email and password-mismatch feedback.
- Provide visible/hidden password states.
- Settings provides profile editing, reset confirmation and sign-out confirmation.
- In the first prototype, use mock flows only; do not represent Figma prototype links as real authentication.

### 7.2 Home and navigation

- Home must display the four-part Quadrilibrium ring and four dimension cards.
- Each dimension card opens the correct module dashboard.
- Main tabs remain Home, Progress, Trophies and Settings.
- The centre of the ring must not display an unvalidated composite “balance score”. It may show the count of tracked dimensions or a neutral label.

### 7.3 Academics

- Schedule Generator shows tasks, type and deadlines, with an add-task route.
- New Task supports save/discard and returns the created task to the schedule.
- Pomodoro supports start, pause, reset and completed states.
- Bluttering Sheet supports an editable timed state, expiry/read-only state, save confirmation and saved list.
- Flashcards are grouped by subject; the user selects a subject before seeing its deck.
- New Flashcard contains term/front and description/back.

### 7.4 Physical Fitness

- Workout list opens a workout detail and completed state.
- Water Intake records a glass size/amount and updates count and total.
- Diet Intake shows carbohydrates, protein and fats; Add Meal supports Small/Medium/Large serving sizes.
- If activity minutes are used in Analytics, the user must enter or select a duration and intensity. A completed-workout flag alone is not sufficient to calculate activity minutes.

### 7.5 Sleep

- Record bedtime and wake-up time.
- Derive duration correctly across midnight and handle invalid or missing times.
- Show history with date, bedtime, wake-up time and derived duration.
- Label the seven-hour reference as an adult 18–60 baseline, not a universal target.

### 7.6 Mental Wellbeing

- Provide Meditation, Breathing Exercises and Thought Reframer.
- Thought Reframer must retain all three fields: Stressful Thought, Thinking Trap and Realistic Counter-Statement.
- Optional future WHO-5 check-in: if included, use the unmodified official instrument, required attribution/licensing and exact scoring rules in `docs/ANALYTICS_SCALE_SPEC.md`.
- Do not display a WHO-5 score unless the user has completed the full instrument.

### 7.7 Analytics / Progress

- Show Academics, Physical Fitness, Mental Wellbeing and Sleep separately.
- Display each metric’s unit, time window and denominator/reference.
- Use different axis ranges per metric; do not imply that bar heights are comparable across cards.
- Label prototype values as sample data.
- Do not aggregate the four dimensions into a clinical or scientific “overall wellbeing” score.

## 8. Data and evidence principles

- App-generated academic metrics are operational indicators, not validated measures of academic ability.
- WHO physical-activity recommendations are guideline references, not a psychometric fitness scale.
- WHO-5 is a five-item self-report wellbeing instrument with a two-week recall period; it is not a diagnosis.
- Sleep duration is a behavioural measurement. It is not a validated sleep-quality score.
- PSQI must not be copied or modified without observing its licensing conditions.

## 9. Acceptance criteria

- All 31 inventory screens have a corresponding design/implementation route.
- Every main screen has a usable way forward/back.
- Main bottom navigation is consistent and its active state is correct.
- No unsupported aggregate wellbeing score is shown.
- Analytics labels units and time ranges clearly.
- Missing metric data displays “No data yet” or “Not assessed”, not zero.
- Sample metrics are visibly identified as sample values.
- Core calculations have unit tests.
- The project builds and passes `flutter analyze` for the target platform before a phase is marked complete.
