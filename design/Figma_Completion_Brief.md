# Quadrilibrium — Figma Completion & Midnight Aurora Enhancement Brief

> **Purpose:** Continue and complete the existing Quadrilibrium Figma project. Do not redesign the application from scratch. Preserve the existing Midnight Aurora identity, finish all screens in the corrected 31-screen inventory, improve visual quality, add polished motion and restrained 3D depth, and deliver a fully connected prototype.
>
> **Existing Figma file:** https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt
>
> **Design identity:** Midnight Aurora — *Balance in the Dark.*

---

## 1. Role and execution instructions

Act as a senior mobile product designer, UI/UX architect, motion designer and Figma prototyping specialist.

You have an existing Figma project that already contains approximately 18 prototype frames and a partially completed Midnight Aurora design. Continue working in that existing file.

### Non-negotiable instructions

1. **Do not create a replacement project or start from a blank file.** Continue the existing Figma file and preserve its useful work.
2. Read the attached `DESIGN.md` and `Quadrilibrium_Screen_Inventory.md` before editing.
3. Inspect the current Figma pages and existing components before creating new ones.
4. Compare the current designs against the original hand-drawn notebook sketches. The sketches define the intended functionality and screen relationships.
5. Use the corrected 31-screen inventory in this document as the completion checklist.
6. Build every outstanding screen listed below. Do not stop after the first module or ask for approval between modules.
7. Keep the existing Midnight Aurora visual identity. Improve it; do not switch to a pastel theme or a different brand direction.
8. Use realistic fictional sample data. Do not add Firebase, databases, APIs or backend behavior in this Figma task.
9. Make every primary action clickable in the prototype. Represent logic that Figma cannot execute using clear prototype states and overlays; do not pretend a visual prototype is a functioning application backend.
10. Do not report completion until the screen inventory, navigation, interactions and visual QA checklists have been checked.

If a source sketch or requirement is unavailable or ambiguous, record the uncertainty in a short assumptions section. Do not silently invent a requirement.

---

## 2. Current project review

The current design has established a consistent visual foundation:

- Midnight/dark navy backgrounds.
- Electric violet brand accent.
- Separate accent colors for the four life dimensions.
- Dark cards and outlined controls.
- Four-part circular balance visualization on Home.
- Progress overview, Trophy Room and Settings.
- Initial authentication flow.
- Academics and Physical Fitness dashboards.
- Pomodoro Timer and Water Intake.
- Sleep Tracker and Sleep History.
- Mental Wellbeing dashboard and Breathing screen.
- Main bottom navigation and several confirmation dialogs.

### Improvements required in existing screens

| Area | Current concern | Required improvement |
|---|---|---|
| Header lighting | Large, strong blurred color patches can dominate the screen | Use controlled aurora/radial lighting behind headings; keep most content surfaces dark and calm |
| Text readability | Secondary labels appear very small in the overview image | Use readable mobile text sizes, clearer hierarchy and stronger secondary-text contrast |
| Home balance ring | Visually attractive but should communicate all four dimensions clearly | Label the four segments, make each dimension tappable, animate the score and segment progress |
| Cards | Some cards look flat and similar | Add restrained layered depth, subtle borders, soft shadows and clear pressed states |
| Trophy Room | Achievement treatment is mostly flat | Use dimensional medal/badge treatments, progress toward locked rewards and a short unlock celebration |
| Timer screens | Controls are shown but interaction states are incomplete | Add running, paused, reset and completed states with clear visual differences |
| Password visibility | Show/Hide appears as text | Use an eye/eye-off icon button with distinct visible and hidden states |
| Navigation | Some focused screens and dashboards use different navigation patterns | Use consistent back navigation; keep the main bottom navigation on top-level destinations and hide it on focused timer/editor flows where it distracts |
| Prototype copies | Module-page screens and prototype-page copies can drift apart | Establish one canonical source for each screen and a repeatable synchronization process for prototype copies |

The two-page `Quadrilibrium — Midnight Aurora.pdf` export contains the Sleep Tracker and Sleep History designs. Keep those layouts and improve them in place; do not replace them with unrelated sleep screens.

---

## 3. Corrected 31-screen inventory

The following is the source-of-truth screen checklist. Existing screens should be reviewed and refined; outstanding screens must be created.

### A. Authentication and main navigation

| # | Screen | Completion status | Required contents |
|---:|---|---|---|
| 1 | Welcome | Existing — refine | Quadrilibrium logo, tagline, Log In, Create Account |
| 2 | Login | Existing — refine | Email, password, real show/hide state, validation and error message |
| 3 | Register | Existing — refine | Full name, email, password, confirm password, validation, show/hide controls |
| 4 | Home Dashboard | Existing — refine | Four-part balance visualization, overall score, four dimension cards, summary stats |
| 5 | Progress | Existing — refine | Progress charts and statistics for all four dimensions, labels and date/range context |
| 6 | Trophy Room | Existing — refine | Unlocked and locked achievement sections, progress toward locked rewards |
| 7 | Settings/Profile | Existing — refine | Profile image, editable name, reset progress, sign out |

### B. Academics

| # | Screen | Completion status | Required contents |
|---:|---|---|---|
| 8 | Academics | Existing — refine | Four feature cards: Schedule Generator, Pomodoro Timer, Bluttering Sheet, Study Flashcards |
| 9 | Schedule Generator | **Build** | Current schedule, task rows, empty state, add-task action |
| 10 | New Task | **Build** | Task name, task type, deadline/date, Save and Discard |
| 11 | Pomodoro Timer | Existing — refine | Circular timer, play, pause, reset, music/randomizer control and all timer states |
| 12 | Bluttering Sheet | **Build** | Editable title, countdown, writing area, Save and View Saved Sheets |
| 13 | Saved Sheets | **Build** | Saved entries, title/date preview, open and delete actions, empty state |
| 14 | Study Flashcards | **Build** | Subject selection cards, add-subject action |
| 15 | Add Subject | **Build** | Subject name, optional short description, Save/Cancel |
| 16 | Subject Flashcards | **Build** | Selected subject title, flashcard list/deck, add-card action, empty state |
| 17 | New Flashcard | **Build** | Term/front and description/back fields, Save and Cancel |

### C. Physical Fitness

| # | Screen | Completion status | Required contents |
|---:|---|---|---|
| 18 | Physical Fitness | Existing — refine | Workouts & Stretches, Water Intake, Diet Intake |
| 19 | Workouts & Stretches | **Build** | Workout categories/list, exercise previews, progress/completion status |
| 20 | Workout Detail | **Build** | Workout title, exercise list, simple instructions, completion action |
| 21 | Water Intake | Existing — refine | Daily goal, glass count, millilitres, Add Glass action and updated state |
| 22 | Diet Intake | **Build** | Carbohydrates, protein and fats; meal summary; Add Meal action |
| 23 | Add Meal | **Build** | Food selection, serving size (Small/Medium/Large), Save action |

### D. Sleep

| # | Screen | Completion status | Required contents |
|---:|---|---|---|
| 24 | Sleep | Existing — refine | Bedtime, wake-up time, Save, View Sleep History |
| 25 | Sleep History | Existing — refine | Dated sleep records with bedtime, wake-up and duration |

### E. Mental Wellbeing

| # | Screen | Completion status | Required contents |
|---:|---|---|---|
| 26 | Mental Wellbeing | Existing — refine | Meditation, Breathing Exercises, Thought Reframer |
| 27 | Meditation | **Build** | Ambient visual, duration, play/pause, reset/end and progress state |
| 28 | Breathing Exercises | Existing — refine | Animated inhale, optional hold, exhale, countdown and pause state |
| 29 | Thought Reframer | **Build** | Saved thought cards, add action, empty state, open and delete |
| 30 | Add Thought Card | **Build** | Stressful Thought, Thinking Trap, Realistic Counter-Statement, Save |
| 31 | View Thought Card | **Build** | Full thought, selected thinking trap, counter-statement, delete action |

**Count:** 31 main screens. Based on the previous completion report, 15 inventory screens were represented. The remaining 16 screens are explicitly marked **Build** above. Success and confirmation overlays are additional UI states, not substitutes for inventory screens.

---

## 4. Required workflows for all outstanding screens

### 4.1 Schedule Generator

Create the current-schedule list with believable sample tasks such as:

- DSA Quiz — 30 minutes.
- ADA Project — 2 hours.
- DSA Quiz 2 — 1 hour.
- SC Homework — 30 minutes.

Include a clear Add Task button. Tapping it opens New Task. Saving a task returns to the schedule and shows the new row. Discard returns without adding a task. Include an empty-schedule state and a save confirmation state.

### 4.2 New Task

Fields:

- Task name.
- Task type/category selector (for example Assignment, Quiz, Project, Exam).
- Deadline/date selector.
- Optional duration if it fits the existing sketch and layout.
- Save and Discard actions.

Show field validation and a clear selected-task-type state. Keep the form compact and mobile-friendly.

### 4.3 Bluttering Sheet

Preserve the original label **Bluttering Sheet**. Do not rename it without explicit approval.

Create these states:

1. New/editable sheet before the timer expires.
2. Timer running.
3. Timer paused if pausing is supported by the intended behavior.
4. Timer expired: the writing area becomes read-only and the UI clearly communicates that it can no longer be edited.
5. Saved confirmation.
6. Saved Sheets list.
7. Open saved sheet in read-only mode.
8. Delete confirmation.
9. Empty saved-sheets state.

The editor must contain a title, timer, large writing area, Save and View Saved Sheets actions. Do not make the writing area look like a tiny comment box.

### 4.4 Study Flashcards

Create the complete hierarchy:

`Study Flashcards → Subject selection → Subject Flashcards → New Flashcard`.

Also create `Add Subject` from the subject-selection page.

Use the subject examples from the sketches: DSA, ADA, SC and TOA. Each subject card should show a small helpful summary such as card count. Subject Flashcards must show the selected subject and its own cards, not a generic unrelated list.

New Flashcard contains:

- Term/front.
- Description/back.
- Save and Cancel.

Include empty states for no subjects and no cards. Show a front/back flip state for an existing card.

### 4.5 Workouts & Stretches

Create a browse/list screen with workout or stretch cards. Include a Workout Detail screen with:

- Workout title.
- Exercise list.
- Short, readable exercise instructions.
- Completion action.
- Completed visual state and return path to the workout list.

Do not invent medical claims, calorie-burn guarantees or performance outcomes. Use neutral, illustrative sample content.

### 4.6 Diet Intake and Add Meal

Diet Intake must show the three nutrition categories from the sketch:

- Carbohydrates.
- Protein.
- Fats.

Include a clear daily summary and an Add Meal action. Add Meal must support food selection and serving-size selection: Small, Medium and Large. Use the sample food names visible in the sketch: Brown Rice, White Rice with Dal, Fried Rice and Zarda Rice.

After Save, return to Diet Intake and show a believable updated sample summary plus a saved confirmation. Clearly distinguish sample/mock nutrition values from verified nutrition data; do not imply that illustrative numbers are authoritative.

### 4.7 Meditation

Create a focused, distraction-free meditation screen with:

- Ambient animated orb or halo.
- Session duration (30 minutes may be used as a sample preset, matching the sketch).
- Play, Pause and End/Reset controls.
- Remaining-time display.
- A calm completed-session state.

Hide the main bottom navigation while the user is in the active session; provide a clear back/exit action and an end-session confirmation if needed.

### 4.8 Thought Reframer

Create this flow:

`Thought Reframer → Add Thought Card → Saved Thought Card → View Thought Card`.

The form must preserve all three original fields:

1. Stressful Thought.
2. Thinking Trap.
3. Realistic Counter-Statement.

Provide a thinking-trap selector with clear example choices, but do not label a user's thought as a clinical diagnosis. Use supportive, neutral language. Saved cards should show a short preview; View Thought Card should show the full content and a delete action. Include empty and delete-confirmation states.

---

## 5. Midnight Aurora visual system

Keep the existing Midnight Aurora identity and align new screens with the current design system.

### 5.1 Color tokens

Use the existing `DESIGN.md` values as the canonical source. The core visual direction is:

| Role | Color |
|---|---|
| Main background | `#090B16` |
| Secondary background | `#111629` |
| Card background | `#171B30` |
| Elevated surface | `#20253D` |
| Brand electric violet | `#8265F5` |
| Academics | `#64A5FF` |
| Physical Fitness | `#FF8B83` |
| Mental Wellbeing | `#B18AFF` |
| Sleep | `#63D5D0` |
| Achievement gold | `#F5C76B` |
| Success mint | `#5BE0B2` |
| Primary text | `#F4F0FF` |
| Secondary text | `#A9A5C5` |
| Borders | `#303651` |

Do not introduce unrelated accent colors for individual screens. The same dimension must retain the same accent color throughout the product.

### 5.2 Visual rules

- Use deep navy/near-black backgrounds, not pure black on every surface.
- Use controlled aurora gradients behind selected headers and hero areas. Do not place a huge bright blur behind every screen title.
- Use dark cards with subtle borders, soft shadows and selected accent highlights.
- Use violet for the brand and active navigation state.
- Keep neon glow selective: hero progress rings, active timer states, selected dimension accents and achievements.
- Prefer Manrope or Inter consistently. Use a clear hierarchy for page titles, section headings, labels and body text.
- Keep body text comfortably readable. Target 14–16 px for primary body content and avoid critical labels below 12 px.
- Keep button touch targets comfortable and consistent.
- Use one coherent outline/filled icon family. Do not mix hand-drawn placeholder icons with polished icons in the final design.
- Preserve the 393 × 852 px mobile frame as the primary reference unless the existing file already uses a consistent, documented mobile frame size.
- Use Auto Layout, constraints, reusable components and component variants.

---

## 6. Motion and animation system

Add polished motion to make the application feel alive, but never let animation interfere with readability, accessibility or task completion.

### 6.1 Motion tokens

| Token | Suggested duration | Use |
|---|---:|---|
| `motion.fast` | 120–160 ms | Button press, icon state, small feedback |
| `motion.standard` | 220–280 ms | Card selection, modal, screen transition |
| `motion.emphasis` | 450–700 ms | Progress ring, flashcard flip, achievement reveal |
| `motion.ambient` | 2.5–4 s | Ambient orb, moon drift, subtle logo glow |

Use smooth ease-out for entrances and gentle ease-in-out for ambient loops. Avoid constant fast pulsing, flashing, shaking or excessive bouncing.

### 6.2 Required motion by screen

| Screen/element | Motion requirement |
|---|---|
| Welcome logo | Slow, subtle gradient/orbit glow; no distracting continuous spin |
| Login/Register buttons | Brief pressed-state scale/brightness feedback; field focus border transition |
| Home balance ring | Animate arcs from zero to current values on entry; reveal the score after the arcs settle |
| Home dimension cards | Subtle lift/brightness on tap, then navigate |
| Progress charts | Bars grow to their values when the page opens; avoid repeating the animation every second |
| Trophy Room | Unlocked badge receives a gentle one-time reveal; new unlock can use a short medal turn and restrained particle/sparkle burst |
| Schedule Generator | New task row appears with a short fade/slide; completion state transitions cleanly |
| Pomodoro | Circular stroke progresses smoothly; distinguish running, paused and completed states; play/pause icon transitions |
| Bluttering Sheet | Timer digits update in the prototype states; at expiration, transition to a read-only visual state with a clear lock/expired indicator |
| Flashcards | 3D-style Y-axis flip between front and back, around 350–450 ms; preserve readable text on both faces |
| Workout Detail | Completion check animates once; progress indicator updates in the completed variant |
| Water Intake | Water/glass indicators fill in sequence when Add Glass is tapped; counter and amount update together |
| Diet Intake | Macro bars animate to updated sample values after a meal is saved |
| Sleep | Moon element drifts very slightly; glow changes gently, not a fast pulsing loop |
| Meditation | Ambient orb expands/contracts slowly; pause visibly freezes the session visual |
| Breathing Exercises | Circle expands on inhale, holds for the hold phase, and contracts on exhale; phase label and countdown must match the animation |
| Thought Reframer | Saved card fades/slides into the list; selected card opens to its detail view |
| Confirmation dialogs | Fade/scale in subtly; no dramatic movement |
| Bottom navigation | Active icon/label transitions smoothly and remains easy to identify |

### 6.3 Breathing cycle

The original sketch asks for an expanding/contracting visual and mentions a possible three-second breath hold. Use this as the initial illustrative cycle unless the source sketch or user requirements specify otherwise:

- Inhale: 4 seconds — circle gradually expands.
- Hold: 3 seconds — circle stays expanded; show a countdown.
- Exhale: 4 seconds — circle gradually contracts.
- Repeat the cycle with a visible Pause/Resume control.

Label each phase and ensure the countdown and animation are synchronized. Avoid presenting the timing as medical advice; allow the timing to be described as a configurable exercise preset in a later implementation.

### 6.4 Figma prototype implementation

Use Smart Animate and interactive component variants where appropriate. Create enough representative states to demonstrate the motion, including start, middle, paused and completed states for timers where practical.

Figma is a visual prototype, not the real timer engine. Do not claim that a prototype countdown, data persistence, authentication or macro calculation is truly functional unless it has actually been implemented in a working app.

---

## 7. Restrained pseudo-3D and depth treatment

The requested 3D style should feel premium and atmospheric, not like a game interface overloaded with effects.

### Recommended effects

- Layered circular rings with subtle highlights and shadow depth.
- Soft radial gradients behind hero objects.
- Small floating orb/planet treatment for Meditation and Sleep.
- Layered medal/badge shapes for Trophy Room.
- Translucent water/glass illustration for Water Intake.
- Perspective-style card flip for Flashcards.
- Slightly elevated cards with a restrained shadow and a thin illuminated edge.
- Very small parallax movement only on decorative background layers, if it remains comfortable and does not reduce legibility.

### Do not

- Add heavy 3D objects to every card.
- Use strong tilt effects on forms or text-heavy screens.
- Put glow around every border.
- Use large decorative objects behind input fields.
- add motion that makes the interface difficult to scan.
- Depend on complex external 3D assets that cannot be recreated or implemented practically in the student Flutter project.

Prefer editable vector/layer effects in Figma. If an external Lottie/Rive/3D asset is genuinely useful, keep it optional, document its purpose and provide a simple fallback design that can be implemented with Flutter shapes and gradients.

---

## 8. Prototype navigation and interaction requirements

Connect all 31 screens into coherent journeys. Every screen must have a clear way back or a clear next action.

### Authentication

`Welcome → Login → Home`

`Welcome → Register → Account Created → Home`

`Login ↔ Register`

Include invalid-login and invalid-registration states. The password eye icon must switch between hidden and visible states.

### Main navigation

`Home ↔ Progress ↔ Trophy Room ↔ Settings`

Each main tab must have a visible active state. Each dimension card on Home must open its matching dashboard.

### Academics

- Academics → Schedule Generator → New Task → updated Schedule Generator.
- Academics → Pomodoro Timer → running / paused / completed states.
- Academics → Bluttering Sheet → Saved Sheets → open saved sheet.
- Bluttering Sheet → expired/read-only state.
- Academics → Study Flashcards → Add Subject → updated subject list.
- Study Flashcards → Subject Flashcards → New Flashcard → updated deck.
- Subject Flashcards → front/back flip.

### Physical Fitness

- Physical Fitness → Workouts & Stretches → Workout Detail → completed workout.
- Physical Fitness → Water Intake → Add Glass → updated count and amount.
- Physical Fitness → Diet Intake → Add Meal → updated macro summary.

### Sleep

- Sleep → Save → confirmation/updated state.
- Sleep → Sleep History → back to Sleep.

### Mental Wellbeing

- Mental Wellbeing → Meditation → running / paused / completed states.
- Mental Wellbeing → Breathing Exercises → inhale / hold / exhale / paused states.
- Mental Wellbeing → Thought Reframer → Add Thought Card → View Thought Card → delete confirmation.

### Settings and achievements

- Trophy Room → achievement detail/locked condition states.
- Settings → Edit Profile state.
- Settings → Reset Progress confirmation → reset-success state or return to Settings.
- Settings → Sign Out confirmation → Welcome/Login.

### Prototype architecture and page synchronization

The previous build report notes that prototype copies on a dedicated page do not automatically update when module-page source frames are edited.

Avoid uncontrolled duplication. Choose and document one of these approaches:

1. Keep canonical interactive frames together on the prototype page and use named components/instances from the design-system library; or
2. If duplicate frames are necessary, maintain a clear source-to-prototype mapping and update both copies during every final revision.

Do not leave the prototype page pointing to stale screens. Before delivery, test the entire prototype from its actual starting frame.

---

## 9. UI states to add or verify

The following are component variants, overlay states or representative frames. They do not replace the 31 main screens.

### Authentication

- Invalid email/password.
- Missing required fields.
- Invalid email format.
- Password too short.
- Password mismatch.
- Password visible/hidden.
- Registration success.

### Schedule and writing

- Empty schedule.
- Schedule with tasks.
- New task validation.
- Task saved.
- Empty saved sheets.
- Sheet editable.
- Timer running/paused/expired.
- Sheet read-only.
- Sheet saved.
- Delete confirmation.

### Flashcards

- Empty subjects.
- Subject list.
- Empty deck.
- Card front/back.
- New flashcard validation.
- Card saved.

### Fitness

- Workout list and empty state if applicable.
- Workout active/completed.
- Water goal not started/in progress/complete.
- Add glass updated state.
- Empty meal list.
- Food selected.
- Serving size selected.
- Meal saved and updated macro summary.

### Sleep and wellbeing

- Sleep record saved.
- Empty sleep history.
- Meditation running/paused/completed.
- Breathing inhale/hold/exhale/paused.
- Empty thought list.
- Thought saved.
- Thought detail.
- Delete confirmation.

### Trophy Room and Settings

- Locked achievement.
- Unlocked achievement.
- Achievement unlock celebration.
- Edit profile.
- Reset confirmation and result.
- Sign-out confirmation.

---

## 10. Layout, accessibility and implementation readiness

- Design mobile-first at the current established frame size (target 393 × 852 px if consistent with the existing file).
- Use Auto Layout for all forms, cards, lists and navigation elements.
- Ensure long lists scroll rather than overflow.
- Keep safe areas clear and avoid controls at the screen edge.
- Use minimum readable sizes: body text usually 14–16 px; supporting text should not fall below 12 px for critical information.
- Maintain accessible contrast for primary and secondary text against dark surfaces.
- Do not communicate status by color alone; pair color with labels or icons.
- Give controls clear default, pressed, selected, disabled and error states where applicable.
- Keep labels and button names consistent across the app.
- Avoid clipped text, overlapping components, tiny hit targets and fixed-height content that cannot adapt.
- Design with future Flutter implementation in mind. Prefer standard layout patterns, vector shapes and reusable components over effects that are impossible to reproduce in Flutter.

---

## 11. Figma file organization

Preserve the existing 10-page organization where it is useful:

1. Cover and Project Overview
2. Design System
3. Authentication
4. Home and Main Navigation
5. Academics
6. Physical Fitness
7. Sleep
8. Mental Wellbeing
9. Trophy Room and Settings
10. Interactive Prototype and User Flows

Add missing screens to their correct module pages. Use clear names such as `09 — Schedule Generator`, `10 — New Task`, etc. Maintain the inventory numbers to make auditing straightforward.

Create or update reusable components for:

- Primary/secondary/destructive buttons.
- Text inputs and password inputs.
- Selection controls and dropdowns.
- Main bottom navigation.
- Back button/header.
- Feature cards and list rows.
- Dimension badges.
- Progress rings and progress bars.
- Timer controls.
- Achievement cards.
- Confirmation dialogs.
- Empty states and success feedback.

Use component variants instead of detached visual copies wherever possible.

---

## 12. Quality assurance checklist

Before finishing, check every item below.

### Inventory completeness

- [ ] All 31 numbered main screens exist.
- [ ] All 16 previously missing screens have been added.
- [ ] No feature from the original corrected inventory has been omitted.
- [ ] Every screen has a consistent frame name and module location.

### Visual consistency

- [ ] Midnight Aurora palette is consistent.
- [ ] Four dimensions retain their semantic accent colors.
- [ ] Typography is readable at mobile size.
- [ ] Header glow is restrained.
- [ ] Card depth and pseudo-3D effects are consistent, not excessive.
- [ ] All controls use the shared component system.

### Interactions and motion

- [ ] Every primary action has a prototype interaction.
- [ ] Timer states are represented.
- [ ] Bluttering Sheet becomes read-only after expiry.
- [ ] Water Intake updates its visual counter state.
- [ ] Flashcards flip front/back.
- [ ] Breathing phases and countdown labels match.
- [ ] Thought Reframer preserves all three required fields.
- [ ] Reset and Sign Out confirmations work in the prototype.
- [ ] Back navigation works from all detail/form screens.
- [ ] Main navigation works from the designated main screens.

### Layout quality

- [ ] No clipped or overlapping content.
- [ ] No horizontal overflow on mobile frames.
- [ ] Long content scrolls correctly.
- [ ] Text contrast is adequate.
- [ ] Touch targets are comfortably sized.
- [ ] Focused activities do not have distracting navigation.

### Prototype integrity

- [ ] Prototype has a clear starting frame.
- [ ] All 31 main screens are reachable through the intended flows or documented prototype entry points.
- [ ] Duplicate prototype copies match their source designs.
- [ ] No broken links or dead-end buttons remain.

---

## 13. Deliverables and final report

Complete the actual Figma edits and provide:

1. The updated Figma file link.
2. All 31 completed screen frames.
3. Updated Midnight Aurora design system and reusable components.
4. Connected clickable prototype.
5. Motion and pseudo-3D treatments described above.
6. All important UI state variants/overlays.
7. Updated screen inventory showing completed status.
8. A list of any unresolved assumptions.
9. A QA summary that distinguishes checks actually performed from checks not performed.
10. A short Flutter implementation note identifying which effects can be built with standard Flutter widgets/animations and which optional effects would need Rive/Lottie or additional assets.

### Final instruction

Continue the existing Quadrilibrium Figma file. Finish the 16 outstanding screens first, then refine the existing 15 screens, add motion and restrained pseudo-3D effects, complete every prototype path and perform the QA checklist. Do not stop at a written plan, static mockups, or another partial build. Do not claim that a screen, animation or interaction is complete unless it exists and has been tested in the Figma file.
