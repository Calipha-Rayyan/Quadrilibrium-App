# Design System — Quadrilibrium / Midnight Aurora

**Version:** 1.0  
**Primary frame:** 393 × 852 px mobile reference  
**Font direction:** Manrope (primary); avoid mixing font families except in legacy elements being explicitly migrated.

## 1. Brand and experience

**Quadrilibrium — Balance in the Dark** is a calm, premium student productivity and personal-wellbeing app. The interface should feel focused, atmospheric and encouraging—not clinical, not a neon game UI and not a generic finance dashboard.

Principles:

- Balance before scores.
- Distinct measurements remain distinct; do not compare unrelated units as if equivalent.
- Progress without pressure.
- Every dimension keeps a stable color identity.
- Honest data: demo values are labelled sample data.
- Calm motion and restrained depth support scanning rather than distract from it.

## 2. Color tokens

| Token | Hex | Use |
|---|---|---|
| `background` | `#090B16` | Main screen background |
| `surface` | `#111629` | Secondary surfaces |
| `surface-card` | `#171B30` | Cards and panels |
| `surface-elevated` | `#20253D` | Elevated controls/dialogs |
| `brand-violet` | `#8265F5` | Primary action and selected navigation |
| `academics` | `#64A5FF` | Academic charts and features |
| `physical-fitness` | `#FF8B83` | Activity, workout and nutrition features |
| `mental-wellbeing` | `#B18AFF` | Meditation and WHO-5 chart |
| `sleep` | `#63D5D0` | Sleep tracking |
| `achievement-gold` | `#F5C76B` | Achievement and threshold accent only |
| `success` | `#5BE0B2` | Success states |
| `text-primary` | `#F4F0FF` | Primary text |
| `text-secondary` | `#A9A5C5` | Supporting text |
| `border` | `#303651` | Card borders/dividers |

Do not introduce unrelated accent colors. Use dimension colors consistently across cards, charts, icons and detail headers.

## 3. Typography

- Primary typeface: Manrope.
- Page title: 26–28 px, Bold.
- Section title: 15–17 px, SemiBold.
- Primary body: 14–16 px.
- Supporting labels: 12–14 px.
- Data labels/chart captions: preferably 10–12 px; critical instructions must not be tiny.
- Use tabular numerals for times, counts and chart values where supported.

## 4. Layout and surfaces

- Use 8-point spacing rhythm where practical: 8, 16, 24, 32.
- Standard horizontal screen padding: 24 px.
- Cards: 16–24 px corner radius, subtle 1 px border and restrained shadow.
- Buttons: comfortable touch area; avoid important actions below 44 × 44 logical pixels.
- Respect SafeArea and ensure scrollable content never sits behind fixed navigation.
- Prefer `Expanded`, `Flexible`, `ListView`, `CustomScrollView` and constraints over fixed screen-height assumptions.
- Use aurora/radial lighting sparingly behind hero/header areas; keep cards and form surfaces dark and readable.

## 5. Reusable components

- Primary, secondary and destructive button.
- App text field and password field.
- App header/back control.
- Bottom navigation with four selected variants.
- Dimension card and dimension badge.
- Analytics metric card with a title, unit/range caption, plotted value and sample/reference note.
- Progress ring and progress bar.
- Timer controls.
- Achievement card and confirmation dialog.
- Empty, loading, validation-error and saved states.

## 6. Motion

| Motion | Suggested duration | Rule |
|---|---:|---|
| Press/focus feedback | 120–160 ms | Subtle scale/brightness; no bounce |
| Standard card/modal/navigation | 220–280 ms | Ease-in-out/ease-out |
| Progress/achievement reveal | 450–700 ms | Play once on entry; do not repeatedly pulse |
| Ambient breathing/orb | 2.5–4 s | Slow, calm, pauseable |
| Flashcard flip | 350–450 ms | Preserve readable front/back orientation |

Respect reduced-motion settings. Do not use fast flashing, repeated shaking or animations that delay access to controls.

## 7. Analytics chart design rules

**Never force every dimension into a shared 0–100 axis.** Use the appropriate unit and period for each metric.

| Dimension | Metric shown | Axis/window | Reference |
|---|---|---|---|
| Academics | Tracked focus minutes | 0–180 min/day; weekly total | User's planned focus goal; no universal academic cutoff |
| Physical Fitness | Moderate activity minutes | 0–60 min/day; weekly total | WHO adult recommendation: 150–300 moderate min/week (or vigorous equivalent); age-specific |
| Mental Wellbeing | WHO-5 score | 0–100; every 2 weeks | Score below 50 is a prompt to consider further assessment, not a diagnosis |
| Sleep | Sleep duration | 0–10 h/night; seven-night trend | Adults 18–60: 7+ h/night reference |

Chart rules:

- Show unit, time window and reference range in text.
- Keep sample/demo values explicitly labelled.
- A missing assessment is **Not assessed**, not 0.
- WHO-5 is a fortnightly recall instrument; do not display it as a daily mood line.
- Use a 50-point WHO-5 reference line with a neutral explanatory label.
- Use a 7-hour sleep reference line only when the user is in the adult 18–60 age group.
- Do not infer sleep quality from sleep duration alone.
- Do not calculate or display one composite “balance” health score.

## 8. Current Home and Analytics presentation

Home uses a four-segment ring, with `4 DIMENSIONS TRACKED` in the centre instead of an arbitrary combined score. The Analytics page contains four separate metric cards. The bottom navigation remains `Progress` for continuity with the sketch and 31-screen inventory, even though the visible page title is `Analytics`.

## 9. Accessibility

- Pair colors with labels/icons; never rely on color alone.
- Maintain readable contrast on midnight surfaces.
- Use semantics labels for charts and controls.
- Provide textual summaries for chart values and reference lines.
- Support large text and screen readers.
- Keep touch targets at least 44 logical pixels where feasible.
