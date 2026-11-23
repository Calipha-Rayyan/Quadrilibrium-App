# Quadrilibrium — Design Reference Directory

**Design direction:** Midnight Aurora — Balance in the Dark  
**Editable source of truth:** [Figma — Quadrilibrium](https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium)  

> [!IMPORTANT]
> Files in `design/` are **design references only**, not Flutter runtime assets. Do not register `design/` in `pubspec.yaml` or copy screenshots into `assets/`. Implement real responsive Flutter widgets following `project-docs/DESIGN.md`.

---

## Canonical Contents

| Path | Role | Notes |
|---|---|---|
| `screens/` | **Primary visual reference (latest 34 screens)** | 6 high-resolution PNG strips (`2526×900` px) containing all 34 screens with polished Lucide icons, corrected Home Dashboard (`4 DIMENSIONS TRACKED`), corrected Analytics screen (separate scales & units), and Reduced Motion toggle in Settings. |
| `exports/Quadrilibrium_Full_Design_Export_34_Pages.pdf` | **Full-page 34-screen PDF snapshot** | Single combined PDF (1 screen per page) for easy human review. **Note:** This snapshot predates the icon polish and Analytics/Home safeguard update (it still shows placeholder circles and `74 BALANCE SCORE`). Always defer to `screens/` and live Figma for Home, Analytics, and icons. |
| `contact_sheets/` | **Numbered screen index sheets** | `Screen_Contact_Sheet_01.jpg`–`03.jpg` (`531×1500` px) provide quick numbered labels (`01 Welcome`–`34 View Thought Card`) corresponding to the 34-page PDF. |
| `source/Original_Lab_Sketches.pdf` | **Original CS 442 Lab Brief** | 5-page course lab specification ("Lab: From Hand-Drawn Sketches to Working Screens"). |
| `SCREEN_MANIFEST.csv` | **Canonical 34-screen index** | Maps every screen number (`01`–`34`) to its feature, PNG strip slot, PDF page, contact sheet, Flutter screen file, and Figma link. |
| `Screen_Inventory.md` | **31-screen functional checklist** | Detailed functional and state requirements for the 31 core screens. |
| `FIGMA_TO_FLUTTER_HANDOFF.md` | **Figma frame IDs & handoff notes** | Direct node links (`3:766` Home, `3:813` Analytics) and implementation guidance. |
| `Figma_Completion_Brief.md` | **Design continuation brief** | Detailed design-system and screen-completion specification. |

---

## Screen Count Note: 31 Core Screens vs 34 Exported Frames

`Screen_Inventory.md` lists **31 core screens**. The 34 exported screens include **3 additional state/confirmation frames**:

- `04 Register Success` ("Account created")
- `09 Reset Confirmation Dialog` ("Reset all progress?")
- `10 Sign Out Confirmation Dialog` ("Sign out?")

All 34 screens/states are distinct and preserved.
