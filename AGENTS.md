# Quadrilibrium — Antigravity Workspace Instructions

You are working on the existing Quadrilibrium Flutter application. The design identity is **Midnight Aurora — Balance in the Dark**.

## First: inspect, do not assume
1. Inspect the existing repository and identify its actual Flutter/Dart structure, entry points, routing, state management, assets, and current implementation.
2. Read `project-docs/README.md`, `project-docs/PRD.md`, `project-docs/ARCHITECTURE.md`, `project-docs/DESIGN.md`, `project-docs/RULES.md`, `project-docs/TASKS.md`, `project-docs/TEST_PLAN.md`, and `project-docs/docs/FIGMA_HANDOFF.md`.
3. Read `design/README.md`, `design/SCREEN_MANIFEST.csv`, and `design/Screen_Inventory.md`, and inspect the canonical Figma reference files in `design/screens/` (latest 34-screen PNG strips) and `design/exports/`.
4. Compare requirements with the actual repository. Report mismatches, missing screens, broken navigation, and incomplete behavior before editing.
5. Do not replace the project, change its framework, or invent an architecture without evidence from the repository.

## Repository conventions
- **Flutter root:** `D:\Student Productivity Tracker\quadrilibrium` (`pubspec.yaml` uses `go_router`, `google_fonts`, `fl_chart`, `lottie`, `lucide_icons_flutter`).
- **Source code:** `lib/` follows `app/`, `core/`, `data/`, and `presentation/` (`screens/`, `view_models/`, `widgets/`).
- **Runtime assets:** `assets/` (`images/`, `icons/`, `fonts/`, `animations/`) — keep strictly separate from `design/`.
- **Design references:** `design/` (`screens/`, `contact_sheets/`, `exports/`, `source/`). Never bundle `design/` into `pubspec.yaml`.
- **Documentation:** `project-docs/` is the single canonical documentation root (including `project-docs/docs/` and `project-docs/audits/`).

## Design fidelity
- Treat the live Figma Midnight Aurora file, `design/screens/` PNG strips, and `project-docs/DESIGN.md` as the visual source of truth.
- Note that `design/exports/Quadrilibrium_Full_Design_Export_34_Pages.pdf` and `design/contact_sheets/` predate the icon polish and Analytics/Home safeguard update (`4 DIMENSIONS TRACKED` and separate metric scales).
- Preserve the midnight navy foundation, violet primary accent, dimension-specific accent colors, typography hierarchy, card language, spacing, and bottom navigation.
- Build responsive Flutter layouts; do not simply paste screenshots as app backgrounds.
- Use the exported design images/PDFs only as references. Implement real Flutter widgets and interactions.
- Use `design/SCREEN_MANIFEST.csv` and the 31-screen inventory as the screen-completion checklist. Distinguish implemented, partially implemented, and missing screens.

## Analytics and wellbeing safeguards
- Keep Academics, Physical Activity, Mental Wellbeing, and Sleep as separate dimensions with their own units and scales.
- Do not invent a universal clinical or scientifically validated combined wellbeing score.
- Mark all prototype values as illustrative sample data until real user data exists.
- WHO-5 is a five-item wellbeing measure with a two-week recall period and a converted 0–100 score. It is a screening/check-in instrument, not a diagnosis. Preserve validated wording, scoring, and usage/permission requirements if implemented.
- Physical activity and sleep recommendations are population guidance, not personal diagnoses.
- Study minutes are operational app metrics, not a validated measure of learning quality.

## Engineering rules
- Keep UI, state, domain logic, persistence, and platform integrations separated according to the architecture actually present.
- Reuse existing components and dependencies before adding new ones.
- Never add secrets to source control. Keep real credentials out of `.env.example`.
- Validate user input and handle loading, empty, error, and success states.
- Support accessibility: semantic labels, readable contrast, scalable text, and sensible tap targets.
- Avoid unrelated refactors. Make small, reviewable changes.
- Do not claim a feature is complete until it is implemented and tested.

## Required workflow for every task
1. Read the relevant documentation and existing implementation.
2. State a concise plan and identify files likely to change.
3. Implement one vertical user flow at a time.
4. Run `flutter analyze`, relevant tests (`flutter test`), and a build check where practical.
5. Inspect the changed screens at phone-sized dimensions.
6. Report files changed, behavior implemented, commands run, test results, and remaining issues.
7. Update `project-docs/TASKS.md` and `project-docs/MEMORY.md` when project status changes.
