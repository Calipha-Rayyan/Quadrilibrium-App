# Development Rules

These rules apply to developers and AI coding agents working on Quadrilibrium.

## 1. Before changing code

1. Read `README.md`, `PRD.md`, `ARCHITECTURE.md`, `DESIGN.md`, `TASKS.md` and `MEMORY.md`.
2. Inspect the existing files and `pubspec.yaml`; do not assume the suggested structure has already been created.
3. Identify the smallest files and feature scope required.
4. State a short plan before large changes.
5. Preserve existing working code. Do not overwrite files merely to match a template.

## 2. Architecture

- One screen per file.
- Keep GoRouter configuration in `lib/app/router.dart`.
- Keep route names in one place.
- Keep UI separate from calculations and data access.
- Reuse shared widgets; do not copy/paste button, card or navigation implementations.
- Keep sample data in `lib/data/sample_data.dart` or feature-specific fixtures.
- Use typed models and explicit units.
- Do not add a backend, database, authentication provider or paid service unless approved in a task/decision record.

## 3. Flutter/Dart code quality

- Follow `dart format` and the repository's lints.
- Prefer `const` constructors where possible.
- Avoid `dynamic` unless the boundary genuinely requires it.
- Avoid oversized widget `build` methods; extract readable components.
- Do not use hard-coded screen widths/heights for responsive page layouts.
- Use `ListView`/`CustomScrollView` for long content.
- Dispose controllers, timers and animation controllers.
- Timer logic must use elapsed-time calculations; do not treat repeated animation frames as a reliable clock.

## 4. Design rules

- Follow `DESIGN.md`.
- Keep Midnight Aurora tokens and four dimension accents stable.
- Never introduce a global wellbeing/health score without a validated, approved method.
- Chart titles must identify the metric, unit and time window.
- Clearly label mock values.
- Do not use the WHO-5 as a daily mood score; use its two-week recall period.
- Do not use “diagnosis”, “healthy/unhealthy”, “at risk” or medical advice wording for app-generated behavioural metrics.

## 5. Analytics rules

- Put all formulas in testable pure Dart functions.
- Preserve numerator, denominator, period and unit in the metric model.
- Do not silently impute missing WHO-5 answers.
- Do not call a custom activity-minute display “GPAQ score” unless the full GPAQ is implemented and administered according to its guide.
- Use age-appropriate sleep/activity references.
- Display “Not assessed” where an instrument has not been completed.

## 6. Privacy and security

- Never put secrets or real credentials in source code, screenshots or Git.
- Do not log passwords, reflection text or wellbeing responses.
- Minimize collection and retention of wellbeing information.
- Obtain informed consent before adding sensitive questionnaires or any cloud synchronization.
- Follow `SECURITY.md` and use OWASP MASVS as future mobile security guidance.

## 7. Testing and delivery

For each task:

1. Implement the smallest coherent feature.
2. Run `dart format` on changed Dart files.
3. Run `flutter analyze`.
4. Run relevant unit/widget tests.
5. Test the actual interaction in Chrome or on a connected device.
6. Update `TASKS.md` and `MEMORY.md`.
7. Report exact files changed, commands run and any remaining issue.

Never say a test passed if it was not run. Never say an Android build is verified while the Android SDK is missing.

## 8. Git

- Use small descriptive commits.
- Do not commit `.env`, signing keys, keystores, certificates or private user data.
- Review `git diff` before commit.
- Do not force-push or reset user work without explicit instruction.
