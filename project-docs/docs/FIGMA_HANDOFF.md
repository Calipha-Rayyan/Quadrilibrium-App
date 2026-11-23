# Figma Handoff — Midnight Aurora

## 1. Correct direct links

These links select the exact Figma frames rather than opening the cover page:

- **Home Dashboard — Interactive Prototype:** https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=3-766
- **Analytics — Interactive Prototype:** https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=3-813
- **Home Dashboard — source frame:** https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=1-89
- **Analytics — source frame:** https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=1-760
- **Full file / Interactive Prototype page:** https://www.figma.com/design/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=1-10
- **Prototype presentation starting at Welcome:** https://www.figma.com/proto/QkraTB0LealCtQFcPzlaNt/Quadrilibrium-%E2%80%94-Midnight-Aurora?node-id=3-710&starting-point-node-id=3%3A710

If Figma opens the file but not the selected frame, sign in to the Figma account with access and paste the direct frame link into the browser address bar. In Figma, select the **Present** button to launch the prototype.

## 2. Main screen behavior and naming

- The source inventory calls the main bottom tab **Progress**.
- The visible page heading is now **Analytics**.
- The bottom navigation tab remains **Progress** to preserve the original inventory and navigation.
- The Home and Analytics prototype copies are on the Interactive Prototype page.
- Home prototype frame ID: `3:766`.
- Analytics prototype frame ID: `3:813`.
- Home source frame ID: `1:89`.
- Analytics source frame ID: `1:760`.

## 3. Home changes

- Removed the arbitrary `74 BALANCE SCORE`.
- Centre now displays `4 DIMENSIONS TRACKED`.
- Replaced generic percentages with explicit, illustrative dimension metrics.
- Header labels the period as a sample week.

## 4. Analytics changes

The four cards have separate labels, units and reference semantics:

1. Academics — focus minutes/day and weekly total.
2. Physical Fitness — moderate activity minutes/day and WHO adult weekly guideline reference.
3. Mental Wellbeing — WHO-5 0–100 with two-week assessment points and 50 follow-up reference.
4. Sleep — hours/night and seven-hour adult reference line.

The Analytics cards use demo values. They are not a real user record.

## 5. Navigation

- Home → Progress/Analytics through the `Progress` bottom tab.
- Main tabs remain Home, Progress, Trophies and Settings.
- The app starts at Welcome in the prototype flow.

## 6. Flutter implementation notes

| Figma treatment | Flutter approach |
|---|---|
| Four-segment ring | `CustomPainter` arcs or `fl_chart` radial visualization |
| Weekly bar charts | `fl_chart` BarChart with each chart's own max/min and unit label |
| WHO-5 threshold | Horizontal reference line/annotation on a 0–100 chart |
| Sleep 7-hour reference | Horizontal target line on hours/night chart |
| Bottom-nav variants | `NavigationBar` or custom `BottomNavigationBar` with selected index |
| Aurora background | `RadialGradient` / stacked low-opacity gradients |
| Card depth | Material elevation or subtle `BoxShadow`, not heavy 3D transforms |

## 7. QA boundary

Screenshots were inspected for Home and Analytics after the updates. This is not a full click-through of every prototype reaction. Continue manual end-to-end prototype QA before calling every interaction complete.
