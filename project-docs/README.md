# Quadrilibrium — Midnight Aurora

**Standards-informed project documentation pack**  
Version: 1.0  
Prepared: 23 November 2026  
Platform: Flutter / Dart  
Tagline: *Balance in the Dark*

## 1. What this project is

Quadrilibrium is a student productivity and personal-wellbeing application organized around four connected dimensions:

1. **Academics** — study scheduling, focus sessions, timed writing and subject-based flashcards.
2. **Physical Fitness** — workouts and stretches, hydration and diet tracking.
3. **Mental Wellbeing** — meditation, breathing exercises and thought reframing, with an optional WHO-5 wellbeing check-in proposed for the analytics feature.
4. **Sleep** — bedtime, wake-up time, sleep-duration tracking and sleep history.

The main navigation contains **Home, Progress, Trophies and Settings**. The Progress screen is titled **Analytics** in the current Figma design. Its bottom-navigation item remains **Progress** to preserve the original screen inventory and navigation terminology.

## 2. Documentation map

| File | Purpose |
|---|---|
| `PRD.md` | Product problem, users, scope and functional requirements |
| `ARCHITECTURE.md` | Flutter architecture, layers, routes and project structure |
| `DESIGN.md` | Midnight Aurora visual system and chart-display rules |
| `RULES.md` | Development rules for people and AI coding tools |
| `TASKS.md` | Phased implementation backlog and current status |
| `TEST_PLAN.md` | Acceptance, unit, widget, integration and UI checks |
| `SECURITY.md` | Privacy and security requirements |
| `DECISIONS.md` | Record of important design and technical decisions |
| `MEMORY.md` | Current project state and next actions |
| `.env.example` | Safe environment-variable template; no real secrets |
| `.gitignore` | Flutter/Dart and local-secret ignore rules |
| `docs/ANALYTICS_SCALE_SPEC.md` | Exact formulas, units, reference ranges and graph behavior |
| `docs/RESEARCH_REFERENCES.md` | Primary research and official sources |
| `docs/STANDARDS_ALIGNMENT.md` | How the documentation uses international standards as guidance |
| `docs/FIGMA_HANDOFF.md` | Direct Figma links, screen mapping and Flutter handoff notes |
| `docs/AI_CODING_CONTEXT.md` | Brief for Claude/other coding agents before implementation |
| `.claude/CLAUDE.md` | Claude Code project instructions |

## 3. Current technical baseline

The user-provided terminal output reported:

- Flutter **3.47.5** on Windows 10.
- `go_router`, `google_fonts`, `fl_chart`, `lucide_icons` and `lottie` were added through `flutter pub add`.
- `flutter analyze` returned **No issues found** at that time.
- `flutter doctor` reported that the **Android SDK was not configured**.
- Windows plugin setup reported that symlink support was unavailable and Developer Mode had not yet been enabled.

These are the last reported results, not a fresh environment check. Android SDK installation remains a required task before Android emulator/device builds. Initial UI implementation can continue in Chrome:

```powershell
flutter pub get
flutter analyze
flutter run -d chrome
```

## 4. Figma design

- [Open Home Dashboard](https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=3-766)
- [Open Analytics screen](https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=3-813)
- [Open the full Figma file](https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=1-10)
- [Open the prototype starting at Welcome](https://www.figma.com/proto/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=3-710&starting-point-node-id=3%3A710)

The current Home ring shows **four dimensions tracked**, not a fabricated composite health score. The Analytics graphs use separate metric units and ranges. All visible numbers are illustrative sample values until real tracking is implemented.

## 5. First implementation sequence

1. Verify the repository and preserve existing files.
2. Implement the app shell, Midnight Aurora theme and GoRouter routes.
3. Build shared widgets and navigation.
4. Implement Welcome, Login, Register, Home and Analytics/Progress.
5. Add sample-data models and calculation utilities.
6. Implement the four dimension modules one vertical slice at a time.
7. Add tests for metric calculations and navigation.
8. Configure Android SDK and Windows Developer Mode before Android/Windows plugin builds.

## 6. Standards note

This pack uses standards-informed documentation practices, including requirements traceability, product-quality criteria and mobile security guidance. It is **not an ISO certification, formal conformity assessment, clinical validation or approval by WHO, AASM, SRS, University of Pittsburgh or any other organization**. See `docs/STANDARDS_ALIGNMENT.md`.
