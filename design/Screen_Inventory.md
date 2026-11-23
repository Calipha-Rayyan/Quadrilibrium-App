# Quadrilibrium — Screen Inventory & Interaction Notes

> **Document purpose:** A structured inventory of the application screens and important interface states, based on the supplied hand-drawn sketches and the accompanying screen descriptions. Use this document as a reference when designing the Figma prototype and implementing the Flutter screens.
>
> **Design direction:** Midnight Aurora — a premium dark interface with a midnight navy foundation, electric-violet primary accents, and distinct accent colors for the four life dimensions.

## 1. Application overview

**Quadrilibrium** is a student-focused productivity and personal well-being application organized around four dimensions of life:

1. **Academics** — study planning and learning tools.
2. **Physical Fitness** — workouts, hydration, and nutrition.
3. **Mental Wellbeing** — meditation, breathing exercises, and thought reframing.
4. **Sleep** — bedtime and wake-up tracking with sleep history.

The Home Dashboard brings the four dimensions together through a circular, four-part Quadrilibrium visualization. Each dimension opens its own section and related features.

## 2. Complete screen inventory

The inventory below contains **31 screens**. The names preserve the terminology in the supplied sketches and screen notes. In particular, **Bluttering Sheet** is retained as written; confirm its final user-facing name before release.

| No. | Screen | Main contents | Parent / entry point |
|---:|---|---|---|
| 1 | Welcome | Logo, introduction, Get Started | App launch |
| 2 | Login | Email, password, validation | Welcome; Register |
| 3 | Register | Full name, email, password, confirm password | Welcome; Login |
| 4 | Home Dashboard | Quadrilibrium balance wheel and four dimensions | Login / Register |
| 5 | Progress | Progress charts and dimension statistics | Bottom navigation |
| 6 | Trophy Room | Unlocked and locked achievements | Bottom navigation |
| 7 | Settings / Profile | Profile picture, edit name, reset progress, sign out | Bottom navigation |
| 8 | Academics | Four academic feature cards | Home Dashboard |
| 9 | Schedule Generator | Current schedule and tasks | Academics |
| 10 | New Task | Task name, type, deadline, Save | Schedule Generator |
| 11 | Pomodoro Timer | Circular timer, play/pause, music | Academics |
| 12 | Bluttering Sheet | Timed writing editor | Academics |
| 13 | Saved Sheets | Saved writing entries | Bluttering Sheet |
| 14 | Study Flashcards | Subject selection | Academics |
| 15 | Add Subject | Create a subject | Study Flashcards |
| 16 | Subject Flashcards | Flashcards belonging to a subject | Study Flashcards |
| 17 | New Flashcard | Term and description | Subject Flashcards |
| 18 | Physical Fitness | Workouts & Stretches, Water Intake, Diet Intake | Home Dashboard |
| 19 | Workouts & Stretches | Workout selection | Physical Fitness |
| 20 | Workout Detail | Exercises and completion action | Workouts & Stretches |
| 21 | Water Intake | Daily water goal and glass tracking | Physical Fitness |
| 22 | Diet Intake | Carbohydrates, protein, and fats | Physical Fitness |
| 23 | Add Meal | Food selection and serving size | Diet Intake |
| 24 | Sleep | Bedtime, wake-up time, Save | Home Dashboard |
| 25 | Sleep History | Previous sleep records | Sleep |
| 26 | Mental Wellbeing | Meditation, Breathing Exercises, Thought Reframer | Home Dashboard |
| 27 | Meditation | Meditation timer and controls | Mental Wellbeing |
| 28 | Breathing Exercises | Animated breathing guidance | Mental Wellbeing |
| 29 | Thought Reframer | Saved thought cards | Mental Wellbeing |
| 30 | Add Thought Card | Stressful thought, thinking trap, realistic counter-statement | Thought Reframer |
| 31 | View Thought Card | Review or delete an existing card | Thought Reframer |

## 3. Screen requirements by section

### 3.1 Authentication and main navigation

#### Welcome
- Display the Quadrilibrium identity and a short introduction.
- Provide a clear **Get Started** action.
- Give users a path to Login and Register.

#### Login
- Email field.
- Password field with show/hide control.
- Login action.
- Validation and invalid-credentials feedback.
- Link to Register.

#### Register
- Full name.
- Email address.
- Password.
- Confirm password.
- Show/hide password controls.
- Create Account action.
- Validation for required fields and password mismatch.
- Link to Login.
- Successful registration confirmation.

> **Registration is an added screen:** It was missing from the original Login sketch and must be included in the prototype.

#### Home Dashboard
- Preserve the circular, four-part Quadrilibrium visualization.
- Represent Academics, Physical Fitness, Mental Wellbeing, and Sleep.
- Make each dimension selectable so it opens its corresponding section.
- Show an overall balance/progress indication only when sample values are clearly identified as illustrative.

#### Persistent bottom navigation
Use the same four destinations on the main application screens:

1. Home
2. Progress
3. Trophy Room / Achievements
4. Settings

Keep the active destination visually clear and maintain consistent placement and behavior.

### 3.2 Academics

The Academics dashboard contains four feature cards:

- Schedule Generator
- Pomodoro Timer
- Bluttering Sheet
- Study Flashcards

#### Schedule Generator
- Show the current schedule and its tasks.
- Provide a route to New Task.
- Display task name, task type, and deadline for each task.
- Include an add-task control.

#### New Task
- Task name.
- Task type selection (examples in the sketch include DSA Quiz, ADA Project, and Exam).
- Deadline selection.
- Save and Discard actions.
- After saving, return to the schedule and show the new task in the list.

#### Pomodoro Timer
- Use the circular timer concept from the sketch.
- Show the timer value and time markings.
- Provide Play, Pause, and Reset controls.
- Include the Randomizer Music Player control shown in the sketch.

#### Bluttering Sheet
- Editable title.
- Visible countdown timer.
- Large writing area.
- Save action.
- View Saved Sheets action.
- Before the timer expires, the writing area is editable.
- After the timer expires, the content becomes read-only.

#### Saved Sheets
- List saved writing entries.
- Allow the user to open an entry.
- Provide a delete action for an entry.
- Show an appropriate empty state when no sheets have been saved.

#### Study Flashcards
- Show subject choices, including DSA, ADA, SC, and TOA as written in the sketch.
- Provide an Add Subject action.
- Opening a subject leads to its own flashcard list.

#### Add Subject
- Provide the fields and action needed to create a subject.
- Return to the subject selection screen after saving and show the new subject.

#### Subject Flashcards
- Display only the flashcards belonging to the selected subject.
- Provide an Add Flashcard action.

#### New Flashcard
- Term field.
- Description field.
- Save action.
- After saving, return to the selected subject's flashcard list.

### 3.3 Physical Fitness

The Physical Fitness dashboard contains three feature cards:

1. Workouts & Stretches
2. Water Intake
3. Diet Intake

#### Workouts & Stretches
- Display available workouts or stretch routines.
- Allow the user to open a workout detail screen.

#### Workout Detail
- Display the selected workout and its exercises.
- Provide a completion action.
- Show a completed state after the user marks the workout complete.

#### Water Intake
- Display the daily water goal.
- Show the number of glasses consumed and the corresponding progress.
- Display the consumed amount in millilitres where supported by the chosen glass size.
- Provide an Add Glass action that updates the counter.
- Preserve the eight-glass example shown in the sketch (for example, 1/8 then 2/8).

#### Diet Intake
- Display nutrition tracking for carbohydrates, protein, and fats.
- Provide an Add Meal action.
- Update the displayed nutrition values after a meal is saved.

#### Add Meal
- Provide food selection.
- Provide serving-size choices: Small, Medium, and Large.
- Use the sample foods shown in the sketch: Brown Rice, White Rice with Dal, Fried Rice, and Zarda Rice.
- Include a Save action.

### 3.4 Sleep

#### Sleep
- Bedtime field.
- Wake-up time field.
- Save action.
- View Sleep History action.

#### Sleep History
- Show previous sleep records in a readable list or timeline.
- Each record should show its date, bedtime, and wake-up time.

### 3.5 Mental Wellbeing

The Mental Wellbeing dashboard contains three feature cards:

1. Meditation
2. Breathing Exercises
3. Thought Reframer

#### Meditation
- Large circular meditation visual.
- Timer (30 minutes appears as an example in the sketch, not a required fixed duration).
- Play and Pause controls.
- Save-progress behavior where applicable.
- Back navigation.

#### Breathing Exercises
- Timer.
- Animated expanding/contracting visual to guide breathing.
- Clear Inhale and Exhale instructions.
- Include a breath-hold phase only when the selected exercise requires it.

#### Thought Reframer
- Display saved thought cards.
- Provide an Add Thought Card action.
- Allow the user to open a saved card.

#### Add Thought Card
Preserve all three fields from the sketch:

1. Stressful Thought
2. Thinking Trap
3. Realistic Counter-Statement

Provide a Save action and return to the saved-card list after saving.

#### View Thought Card
- Display the saved thought and its associated thinking trap and realistic counter-statement.
- Provide a delete action.

### 3.6 Trophy Room

- Separate **Unlocked Achievements** and **Locked Achievements**.
- Include the achievement examples visible in the sketches:
  - **Healthy Sleeper** — the handwritten note appears to refer to sleeping seven hours throughout a week.
  - **All Rounder** — the handwritten condition is not fully legible; the interpretation that it relates to all four dimensions is provisional and must be confirmed.
- Use clear locked/unlocked visual states.
- Do not present provisional achievement conditions as confirmed product rules.

### 3.7 Settings / Profile

- Profile picture.
- Edit Profile Picture action.
- User name and Edit action.
- Reset All Progress action.
- Sign Out action.
- Reset and Sign Out must show confirmation dialogs before proceeding.

## 4. Additional interface states

These are states of existing screens or overlays; they do not need to be counted as additional full-page screens unless the prototype requires a separate frame.

| Area | Required state |
|---|---|
| Login | Invalid email/password feedback |
| Register | Required-field validation, invalid email, password mismatch, successful registration |
| Schedule | Empty schedule and task-saved confirmation |
| Pomodoro | Running, paused, reset, completed |
| Bluttering Sheet | Editable, timer expired/read-only, saved confirmation, empty saved list |
| Flashcards | Empty subject list, empty flashcard list, flashcard saved |
| Workouts | Workout completed |
| Water Intake | Updated glass count and goal progress |
| Diet Intake | Meal saved and updated nutrition values |
| Sleep | Sleep record saved and empty history |
| Meditation | Running, paused, completed |
| Breathing Exercises | Inhale, hold (if used), and exhale phases |
| Thought Reframer | Empty list, saved card, delete confirmation |
| Trophy Room | Locked and unlocked achievement states |
| Settings | Reset confirmation and sign-out confirmation |

## 5. Important design and behavior rules

1. **Preserve the original functionality.** Improve the visual design without removing features or changing the workflows shown in the sketches.
2. **Keep the Home balance wheel.** The four-part circular visualization is a defining element of Quadrilibrium.
3. **Keep subject-based flashcards.** Users must select a subject before viewing that subject's flashcards.
4. **Keep the timed writing behavior.** Bluttering Sheet changes from editable to read-only when its timer expires.
5. **Keep all Thought Reframer fields.** Stressful Thought, Thinking Trap, and Realistic Counter-Statement are all required.
6. **Separate locked and unlocked achievements.** Do not combine them into one undifferentiated list.
7. **Use consistent navigation.** Main navigation should remain consistent across the primary sections; provide clear back navigation for nested screens.
8. **Use sample data honestly.** Any values, names, progress percentages, or records added for visual demonstration must be treated as fictional sample data.
9. **Do not invent unclear requirements.** Mark illegible or ambiguous handwritten details for confirmation.

## 6. Suggested prototype navigation map

```text
Welcome
├── Login
│   └── Home Dashboard
└── Register
    └── Home Dashboard

Home Dashboard
├── Academics
│   ├── Schedule Generator
│   │   └── New Task
│   ├── Pomodoro Timer
│   ├── Bluttering Sheet
│   │   └── Saved Sheets
│   └── Study Flashcards
│       ├── Add Subject
│       └── Subject Flashcards
│           └── New Flashcard
├── Physical Fitness
│   ├── Workouts & Stretches
│   │   └── Workout Detail
│   ├── Water Intake
│   └── Diet Intake
│       └── Add Meal
├── Sleep
│   └── Sleep History
└── Mental Wellbeing
    ├── Meditation
    ├── Breathing Exercises
    └── Thought Reframer
        ├── Add Thought Card
        └── View Thought Card

Bottom Navigation
├── Home Dashboard
├── Progress
├── Trophy Room
└── Settings / Profile
```

## 7. Suggested first eight Flutter screens

For the first implementation milestone, prioritize a connected vertical slice that covers the lab's basic screen templates and establishes the main navigation:

1. Welcome
2. Login
3. Register
4. Home Dashboard
5. Academics
6. Schedule Generator (detail/list)
7. New Task (form)
8. Settings / Profile

This is a suggested implementation order, not a replacement for the full 31-screen inventory. The remaining screens can follow once the navigation, shared components, and basic screen structure are stable.

## 8. Source and clarification notes

- The 31-screen inventory and feature descriptions above are based on the supplied hand-drawn screen descriptions and the user's corrected inventory.
- The accompanying Mobile Application Development lab brief emphasizes connected screens, reusable widgets/templates, separate screen files, and fake/hard-coded data for this stage. Authentication, Firebase, camera, and database integration are planned for later work in the brief.
- **Bluttering Sheet** is retained as the supplied label. Its final public-facing wording should be confirmed.
- The **All Rounder** achievement condition is not fully legible in the sketch and remains provisional.
- The **Healthy Sleeper** condition is interpreted from the handwritten note as seven hours of sleep throughout a week; confirm the exact threshold and whether this means every night or a weekly average.
- The sample timer durations, meal names, task types, and subject abbreviations are examples from the sketches, not necessarily fixed application constraints.

---

**Document status:** Screen inventory and interaction reference for Figma design and subsequent Flutter implementation.
