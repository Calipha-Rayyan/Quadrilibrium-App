# Quadrilibrium — Project Audit (Before Cleanup)

**Audit date:** 2026-11-23  
**Project root:** `D:\Student Productivity Tracker\quadrilibrium`  
**Design direction:** Midnight Aurora — Balance in the Dark  
**Figma source:** https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium  

---

## 1. Repository & Environment Summary

| Property | Value |
|---|---|
| Flutter project root | `D:\Student Productivity Tracker\quadrilibrium` (`pubspec.yaml` confirmed) |
| Git status | **Not a Git repository** (`fatal: not a git repository`). External timestamped backup is mandatory before any change. |
| Flutter version | `3.47.5` (channel stable, revision `6a19cca564`, 2026-09-17) |
| Dart SDK version | `3.13.4` (stable, `windows_x64`) |
| Package name | `quadrilibrium` (`version: 1.0.0+1`, `publish_to: 'none'`) |
| SDK constraint | `sdk: ^3.13.4` |
| Dependencies | `flutter`, `cupertino_icons: ^1.0.8`, `go_router: ^18.1.4`, `google_fonts: ^9.0.0`, `fl_chart: ^1.3.1`, `lottie: ^3.8.2`, `lucide_icons_flutter: ^4.0.3` |
| Dev dependencies | `flutter_test`, `flutter_lints: ^6.0.0` |
| Asset declarations (`pubspec.yaml`) | `uses-material-design: true`; no `assets:` or `fonts:` entries declared yet |
| Actual app entry point | `lib/main.dart` (4,927 bytes — currently the default Flutter counter template `MyApp` / `MyHomePage`) |
| Navigation / routing | `go_router` is installed in `pubspec.yaml`; `lib/app/router.dart` and `lib/app/route_names.dart` are scaffolded 0-byte placeholders |
| State management | None wired yet (planned: Flutter built-ins `ChangeNotifier` / `ValueNotifier` / `setState` per `ARCHITECTURE.md`) |
| Persistence / backend | None (planned milestone 1: local/sample data only in `lib/data/sample_data.dart`) |
| Baseline `flutter analyze` | **No issues found** |
| Baseline `flutter test` | **1 passed** (`test/widget_test.dart` — `Counter increments smoke test`) |

---

## 2. Existing Folder Structure & Classification

### 2.1 Platform & Generated Directories (Excluded from Main Inventory)

| Directory | Files | Total Size | Classification |
|---|---:|---:|---|
| `.dart_tool/` | 4 | 24,517 bytes | Generated cache (gitignored) |
| `.idea/` | 5 | 3,918 bytes | IDE metadata (gitignored) |
| `android/` | 25 | 77,871 bytes | Platform configuration (preserve) |
| `ios/` | 50 | 70,624 bytes | Platform configuration (preserve) |
| `linux/` | 10 | 16,295 bytes | Platform configuration (preserve) |
| `macos/` | 34 | 229,231 bytes | Platform configuration (preserve) |
| `web/` | 7 | 43,587 bytes | Platform configuration (preserve) |
| `windows/` | 18 | 69,323 bytes | Platform configuration (preserve) |

### 2.2 Active & Cluttered Top-Level Contents (Before Cleanup)

| Path | Contents / Size | Classification | Findings |
|---|---|---|---|
| `lib/` | 79 `.dart` files (1 non-empty: `lib/main.dart`, 4,927 bytes; 78 scaffolded 0-byte files across `app/`, `core/`, `data/`, `presentation/`) | App source | **Preserve untouched.** Architecture matches `ARCHITECTURE.md`. |
| `test/` | `widget_test.dart` (1,094 bytes) | Tests | **Preserve untouched.** Passes. |
| `integration_test/` | Empty directory | Tests | Empty scaffolded dir (keep or note). |
| `assets/` | 4 empty subdirs: `animations/`, `fonts/`, `icons/`, `images/` | Runtime assets | Keep empty runtime asset folders ready for app assets; never place design screenshots here. |
| `design/` | Empty directory | Design references | Target canonical design reference root (currently empty). |
| `docs/` | Empty directory | Documentation | Competing empty docs root; canonical docs belong in `project-docs/`. |
| `handoff-temp/Quadrilibrium_Antigravity_Handoff/` | 28 files (~22.2 MB) | Duplicate handoff staging folder | **100% byte-for-byte identical** to `Quadrilibrium_Antigravity_Handoff/`. |
| `Quadrilibrium_Antigravity_Handoff/` | 28 files (~22.2 MB) | Uninstalled handoff package | Contains canonical `AGENTS.md`, `design/*`, and `project-docs/*` that were never moved into root. |
| `Quadrilibrium_Project_Docs/` | 18 files (~78 KB) | Duplicate documentation folder | **100% byte-for-byte identical** to `Quadrilibrium_Antigravity_Handoff/project-docs/`. |
| `Quadrilibrium_Full_Design_Export_34_Pages.pdf` | 20,467,758 bytes (34 pages) | Design export (loose at root) | **100% byte-for-byte identical** to `Quadrilibrium_Full_Design_Export.pdf` in both handoff folders (3 copies total!). |
| `0403b6ee-ca2f-49ed-994a-b6bdb1d0cceb.png` | 442,334 bytes (2526×900) | Design reference (loose at root) | Latest updated 6-screen strip (screens 01–06: Auth, Home `4 DIMENSIONS TRACKED`, Analytics with distinct scales). |
| `612b3ffc-ee53-4639-9d9d-ae1ff0a49f69.png` | 347,861 bytes (2526×900) | Design reference (loose at root) | Latest updated 6-screen strip (screens 07–12: Trophy Room, Settings + Reduced Motion, Dialogs, Academics, Schedule). |
| `7d4a0fa4-b351-4199-91b0-567ab5a31cbd.png` | 279,713 bytes (2526×900) | Design reference (loose at root) | Latest updated 6-screen strip (screens 13–18: New Task, Pomodoro, Bluttering Sheet, Saved Sheets, Study Flashcards, Add Subject). |
| `6388aef7-253c-473b-8890-4bbedda63faf.png` | 342,056 bytes (2526×900) | Design reference (loose at root) | Latest updated 6-screen strip (screens 19–24: Subject Flashcards, New Flashcard, Physical Fitness, Workouts, Workout Detail, Water Intake). |
| `b0ccc4d5-d4f1-47c9-89f8-61efa952540b.png` | 391,528 bytes (2526×900) | Design reference (loose at root) | Latest updated 6-screen strip (screens 25–30: Diet Intake, Add Meal, Sleep Tracker, Sleep History, Mental Wellbeing, Meditation). |
| `730c0981-4789-4d02-bab1-c68e02e37cdb.png` | 277,622 bytes (2526×900) | Design reference (loose at root) | Latest updated 4-screen strip (screens 31–34: Breathing Exercises, Thought Reframer, Add Thought Card, View Thought Card). |
| `Screen_Contact_Sheet_01.jpg` | 137,040 bytes (531×1500) | Contact sheet (loose at root) | Numbered index sheet (screens 01–12), matches earlier 34-page PDF snapshot. |
| `Screen_Contact_Sheet_02.jpg` | 146,727 bytes (531×1500) | Contact sheet (loose at root) | Numbered index sheet (screens 13–24), matches earlier 34-page PDF snapshot. |
| `Screen_Contact_Sheet_03.jpg` | 131,044 bytes (531×1500) | Contact sheet (loose at root) | Numbered index sheet (screens 25–34), matches earlier 34-page PDF snapshot. |
| `pubspec.yaml`, `pubspec.lock`, `analysis_options.yaml`, `.gitignore`, `.metadata`, `README.md`, `quadrilibrium.iml`, `.flutter-plugins-dependencies` | Root config/meta files | Configuration | Preserve (`README.md` will be updated with accurate project structure & setup). |

---

## 3. Exact Duplicate Findings (SHA-256 Verified)

1. **`Quadrilibrium_Full_Design_Export_34_Pages.pdf` — 3 exact copies (20,467,758 bytes each)**
   - SHA-256: `4260EE3735067F2E6D99C44573FAB974009E86D2099FBECEAD2EC260BCD755D9`
   - Copies:
     - `Quadrilibrium_Full_Design_Export_34_Pages.pdf`
     - `Quadrilibrium_Antigravity_Handoff/design/Quadrilibrium_Full_Design_Export.pdf`
     - `handoff-temp/Quadrilibrium_Antigravity_Handoff/design/Quadrilibrium_Full_Design_Export.pdf`
   - Action: Keep 1 canonical copy at `design/exports/Quadrilibrium_Full_Design_Export_34_Pages.pdf`; remove 2 redundant copies (~40.9 MB saved).

2. **`handoff-temp/Quadrilibrium_Antigravity_Handoff/` vs `Quadrilibrium_Antigravity_Handoff/` — 28 exact duplicate files**
   - Every single file in `handoff-temp/Quadrilibrium_Antigravity_Handoff/` has an identical SHA-256 hash in `Quadrilibrium_Antigravity_Handoff/`.
   - Action: Install canonical copies into root (`AGENTS.md`, `design/`, `project-docs/`), then remove `handoff-temp/` and `Quadrilibrium_Antigravity_Handoff/` after backup.

3. **`Quadrilibrium_Project_Docs/` vs `Quadrilibrium_Antigravity_Handoff/project-docs/` — 18 exact duplicate files**
   - Every single file in `Quadrilibrium_Project_Docs/` is byte-identical to `Quadrilibrium_Antigravity_Handoff/project-docs/`.
   - Action: Consolidate into canonical `project-docs/` at repository root; remove `Quadrilibrium_Project_Docs/` after backup.

---

## 4. Visual Screen Comparison Findings

1. **`Quadrilibrium_Midnight_Aurora_Export.pdf` (2 pages, 1,365,403 bytes, 2 copies)**
   - SHA-256: `61EEA947C42B43964FCFADB89AB6E17C27BBAF412EC898B9CBA25BE97B6929D8`
   - Visual inspection confirmed Page 1 (`Sleep Tracker`) and Page 2 (`Sleep History`) are **visually identical** to Pages 27 and 28 of `Quadrilibrium_Full_Design_Export_34_Pages.pdf` (same earlier version with empty placeholder circles in bottom navigation).
   - Action: Remove both redundant copies after backup; retain the 34-page combined PDF as the canonical PDF snapshot.

2. **6 Root UUID PNG Strips vs `Quadrilibrium_Full_Design_Export_34_Pages.pdf` & `Screen_Contact_Sheet_01..03.jpg`**
   - Visual side-by-side inspection revealed a **critical version difference**:
     - The **6 UUID PNG strips** (2526×900 px each, covering all 34 screens) represent the **latest updated Figma state**: real Lucide vector icons, corrected Home Dashboard (`4 DIMENSIONS TRACKED` instead of `74 BALANCE SCORE`), corrected Analytics screen (`Weekly metrics · distinct units · sample values` with separate scales/units and WHO-5 / WHO activity / sleep reference notes), password visibility eye icons, Reduced Motion toggle in Settings, and "Explore UI/form states" links.
     - `Quadrilibrium_Full_Design_Export_34_Pages.pdf` and `Screen_Contact_Sheet_01..03.jpg` represent an **earlier snapshot** (placeholder circle icons, older `74 BALANCE SCORE` Home Dashboard, unlabeled Progress bars), though the 34-page PDF provides individual full-page high-resolution frames and the 3 contact sheets provide numbered captions (`01 Welcome`–`34 View Thought Card`).
   - Action:
     - Move and descriptively rename the **6 latest PNG strips** into `design/screens/` as the primary up-to-date visual reference.
     - Move `Screen_Contact_Sheet_01..03.jpg` into `design/contact_sheets/` (documented as numbered index sheets matching the 34-page PDF).
     - Move 1 copy of `Quadrilibrium_Full_Design_Export_34_Pages.pdf` into `design/exports/` (documented as the full 34-page PDF snapshot, noting that Home/Analytics/icons were later updated in the PNG strips and live Figma).
     - Move 1 copy of `Original_Lab_Sketches.pdf` (5-page CS 442 Lab Brief) into `design/source/Original_Lab_Sketches.pdf`.

3. **31 Core Screens vs 34 Exported Frames**
   - `Screen_Inventory.md` lists **31 core screens**.
   - The 34 exported screens add 3 confirmation/state frames:
     - `04 Register Success` ("Account created")
     - `09 Reset Confirmation Dialog` ("Reset all progress?")
     - `10 Sign Out Confirmation Dialog` ("Sign out?")
   - All 34 are distinct screens/states and are preserved.

---

## 5. Planned Cleanup & Backup Strategy

1. Create external backup at `D:\Student Productivity Tracker\_quadrilibrium_cleanup_backup_YYYYMMDD_HHMMSS` with a complete `BACKUP_MANIFEST.csv` (original relative path, size, SHA-256 hash) for every file to be removed, moved, or overwritten.
2. Install canonical documentation and design structure:
   - Root `AGENTS.md` (installed from handoff, updated with actual repo conventions).
   - Root `project-docs/` (canonical single documentation root, including `audits/`).
   - Root `design/` with `screens/`, `contact_sheets/`, `exports/`, `source/`, `SCREEN_MANIFEST.csv`, `README.md`, `Screen_Inventory.md`, `FIGMA_TO_FLUTTER_HANDOFF.md`, and `Figma_Completion_Brief.md`.
3. Remove verified duplicate folders (`handoff-temp/`, `Quadrilibrium_Antigravity_Handoff/`, `Quadrilibrium_Project_Docs/`), redundant sleep-only PDF, and empty competing `docs/` folder.
4. Keep `quadrilibrium.iml`, `.flutter-plugins-dependencies`, `lib/`, `test/`, `integration_test/`, `assets/`, `pubspec.yaml`, `pubspec.lock`, `analysis_options.yaml`, and all platform directories intact.
5. Re-run Flutter checks (`dart format --output=none --set-exit-if-changed .`, `flutter analyze`, `flutter test`, and Android build check if SDK is available).
