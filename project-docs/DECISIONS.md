# Architecture and Product Decisions

Record accepted decisions here. Add a new ADR instead of silently changing a foundational choice.

## ADR-001 — Flutter/Dart for the mobile client

**Status:** Accepted  
**Decision:** Implement the mobile app using Flutter and Dart.  
**Reason:** The user's project and course work are already based on Flutter; shared widgets and one codebase fit the student project.

## ADR-002 — GoRouter for navigation

**Status:** Accepted  
**Decision:** Keep one GoRouter setup in `lib/app/router.dart`.  
**Reason:** The package was installed in the supplied terminal output and the course handout uses GoRouter.  
**Constraint:** Verify the installed API/version before using new features.

## ADR-003 — Sample-data-first MVP

**Status:** Accepted for the first visual milestone  
**Decision:** Start with hard-coded/sample data and in-memory interactions. Do not add Firebase, remote APIs or a database until separately scoped.  
**Reason:** The provided lab brief says the immediate objective is visually correct, connected screens; backend features come later.

## ADR-004 — No composite wellbeing score

**Status:** Accepted  
**Decision:** Do not average Academics, Physical Fitness, Mental Wellbeing and Sleep into one universal score.  
**Reason:** The metrics have different constructs, units, recall periods and validation status. A weighted 0–100 “balance score” would be arbitrary without a validated model and validation study.  
**UI:** The Home ring centre shows “4 dimensions tracked”.

## ADR-005 — WHO-5 for optional mental-wellbeing check-ins

**Status:** Proposed, subject to product approval/licensing implementation  
**Decision:** If a standardized self-report wellbeing measure is added, use the official WHO-5 unchanged and follow its CC BY-NC-SA 3.0 IGO conditions.  
**Rules:** Five items; 0–5 each; raw 0–25; percentage = raw × 4; recall period two weeks; missing item means no total score. Below 50 is a prompt to consider further assessment, not a diagnosis.  
**Cadence:** A 14-day cadence is a product choice to avoid overlapping weekly assessments; the WHO instrument itself defines a two-week recall period.

## ADR-006 — Physical activity uses real duration/intensity, not workout count

**Status:** Accepted  
**Decision:** Analytics requires duration and intensity. For adult aerobic activity, use WHO guidance as a reference; do not label a simple workout counter as GPAQ.  
**Formula where intensity is captured:** moderate-equivalent minutes = moderate minutes + 2 × vigorous minutes (consistent with the 4/8 MET values in the WHO GPAQ analysis guide). Track muscle-strengthening days separately.

## ADR-007 — Sleep display is duration, not sleep quality

**Status:** Accepted  
**Decision:** Derive hours from bedtime and wake-up time and show duration trends. Do not call the result a sleep-quality score. Use the ≥7 hours/night reference only for adults aged 18–60.  
**Excluded for now:** PSQI, because University of Pittsburgh owns the instrument and its reproduction/modification/commercial-use terms require permission/licensing.

## ADR-008 — Each Analytics card uses its own unit/range

**Status:** Accepted  
**Decision:** Use min/day or min/week for activity, WHO-5 0–100 every 14 days, sleep hours/night and app-recorded focus minutes. Never normalize all four as if the scales were interchangeable.

## ADR-009 — Figma Progress tab has visible title “Analytics”

**Status:** Accepted  
**Decision:** Retain “Progress” in the main bottom navigation for source/flow continuity, but use “Analytics” as the page heading.  
**Reason:** The user asked for an Analytics view while the original screen inventory labels the tab Progress.

## ADR-010 — Standards are guidance, not certification

**Status:** Accepted  
**Decision:** Structure requirements, quality and security documentation using ISO/IEC/IEEE 29148:2018, ISO/IEC 25010:2023 and OWASP MASVS as references.  
**Constraint:** Do not claim formal ISO/OWASP compliance or certification without a formal assessment.
