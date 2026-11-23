# AI Coding Context — Read Before Editing

You are working on **Quadrilibrium — Midnight Aurora**, a Flutter/Dart mobile application.

## Required reading order

1. `README.md`
2. `PRD.md`
3. `ARCHITECTURE.md`
4. `DESIGN.md`
5. `RULES.md`
6. `TASKS.md`
7. `MEMORY.md`
8. `docs/ANALYTICS_SCALE_SPEC.md` when working on Analytics, Home or wellbeing/fitness/sleep features.

## Operating instructions

- First inspect the existing repository; do not assume a suggested folder/file exists.
- Do not overwrite existing user code or documentation without inspecting it.
- Do not create another app architecture or duplicate GoRouter configuration.
- Work on one vertical slice at a time: understand → plan → implement → test → review → update docs.
- Keep the initial implementation on local/sample data unless a task explicitly approves persistence/backend services.
- Use the design system, stable dimension colors and shared widgets.
- Preserve the 31-screen inventory and original workflows.
- Do not produce a combined “balance score”.
- Keep Analytics metrics separate, correctly labelled and age/time-window scoped.
- Do not call app-derived focus/task metrics validated academic scales.
- Do not call a custom activity tracker the WHO GPAQ.
- Do not calculate WHO-5 unless all five official items are answered and licensing/attribution rules are followed.
- Do not call sleep duration “sleep quality”.
- Do not silently introduce PSQI; the instrument has licensing restrictions.

## Task prompt template

```text
CONTEXT
Read README.md, PRD.md, ARCHITECTURE.md, DESIGN.md, RULES.md and the relevant feature/analytics specifications.

TASK
[One specific feature or fix.]

FILES
Inspect the actual relevant files before editing. List the files you expect to change.

CONSTRAINTS
- Preserve existing project code and the 31-screen inventory.
- Follow Midnight Aurora tokens and shared widgets.
- Do not add unrelated dependencies or backend services.
- Do not create unsupported scientific/medical scores.

ACCEPTANCE CRITERIA
[Observable user behaviors and data rules.]

TESTING
Run dart format, flutter analyze and relevant flutter tests. Report exact commands and results.

REPORT
List changed files, what works, tests run and remaining issues. Do not claim unrun tests passed.
```
