# Quadrilibrium — Project Structure Guide

Use this quick guide so every teammate knows where to place source code, runtime assets, design references, and documentation.

---

## Folder Responsibilities

| Folder / File | What Belongs Here | What Does NOT Belong Here |
|---|---|---|
| `lib/` | Flutter/Dart application source code (`main.dart`, `app/`, `core/`, `data/`, `presentation/`). | Design exports, PDFs, documentation, temporary scratch files. |
| `assets/` | **Runtime app assets only** (`images/`, `icons/`, `fonts/`, `animations/`) that are declared in `pubspec.yaml` and bundled into the app. | Figma screen screenshots, contact sheets, PDF exports. |
| `design/` | **Design reference material only** (not bundled into the app):<br>- `screens/` — latest 34-screen PNG reference strips<br>- `contact_sheets/` — numbered index sheets (`01`–`34`)<br>- `exports/` — combined 34-page PDF snapshot<br>- `source/` — original CS 442 lab brief PDF<br>- `SCREEN_MANIFEST.csv`, `Screen_Inventory.md`, `README.md`, `FIGMA_TO_FLUTTER_HANDOFF.md`, `Figma_Completion_Brief.md` | Runtime app assets, duplicate ZIP extracts, `.fig` exports mixed into `assets/`. |
| `project-docs/` | **Single canonical documentation root**: product (`PRD.md`), architecture (`ARCHITECTURE.md`), design tokens (`DESIGN.md`), engineering rules (`RULES.md`), backlog (`TASKS.md`), testing (`TEST_PLAN.md`), security (`SECURITY.md`), decisions (`DECISIONS.md`), memory (`MEMORY.md`), `docs/` specs, and `audits/` reports. | Competing top-level `docs/` folders or duplicate doc copies. |
| `test/` & `integration_test/` | Unit, widget, and integration tests. | Production app code or design assets. |
| `AGENTS.md` & `README.md` | Root Google Antigravity workspace instructions and project quick-start README. | Secrets or personal local paths. |
| `pubspec.yaml`, `pubspec.lock`, `analysis_options.yaml` | Package manifest, locked dependency versions (keep committed), and Dart lint config. | Unused dependencies or references to `design/`. |
| `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` | Flutter platform runners and native configuration. | Manual untracked build clutter or signing keys committed to Git. |

---

## Golden Rules for Teammates

1. **Live Figma is the editable source of truth.** Local files in `design/` are read-only snapshots.
2. **Never commit secrets** (`.env`, API keys, keystores). Only commit placeholder templates like `project-docs/.env.example`.
3. **Never bundle `design/` in `pubspec.yaml`.** Keep design screenshots out of `assets/`.
4. **Update `design/SCREEN_MANIFEST.csv`** whenever a screen is added, renamed, or re-exported.
5. **Preserve wellbeing safeguards:** Keep Academics, Physical Fitness, Mental Wellbeing, and Sleep as separate dimensions with distinct units—no arbitrary composite health score, no clinical claims from WHO-5, and label sample values clearly.
