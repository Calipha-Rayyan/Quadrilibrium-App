# Standards Alignment and Scope

This project pack is **standards-informed**, not formally certified or assessed against an international standard.

## 1. Requirements engineering — ISO/IEC/IEEE 29148

Reference: ISO/IEC/IEEE 29148:2018, *Systems and software engineering — Life cycle processes — Requirements engineering*. ISO lists the 2018 edition as published and last reviewed/confirmed in 2024, while an Edition 3 DIS draft is under enquiry as of November 2026.

How this pack uses the standard as guidance:

- Product problem, users, scope and non-goals are separated in `PRD.md`.
- Functional requirements are numbered/grouped by product area.
- Acceptance criteria and testable outcomes are stated.
- Important assumptions and decisions are recorded in `DECISIONS.md`.
- Tasks link requirements to implementation/test steps.

This is a student-project documentation structure, not a claim of formal ISO/IEC/IEEE 29148 compliance.

## 2. Product quality — ISO/IEC 25010:2023

Reference: ISO/IEC 25010:2023, *Systems and software engineering — SQuaRE — Product quality model*. Edition 2 (November 2023) defines a product quality model with nine characteristics and supporting subcharacteristics.

Quadrilibrium uses the model as a quality-planning reference:

- Functional suitability — every screen and flow should satisfy its stated requirement.
- Performance efficiency — charts, animations and lists should remain responsive.
- Compatibility — responsive behavior and platform-specific checks.
- Interaction capability/usability — understandable navigation, labels and forms.
- Reliability — timers, date calculations and state changes must be predictable.
- Security — protect account and wellbeing data.
- Maintainability — modular features and reusable widgets.
- Flexibility — future persistence/backend integration without rewriting UI.
- Safety-related considerations — no misleading medical/health claims.

The detailed ISO text is not reproduced here. This mapping is a project checklist, not a full conformance assessment.

## 3. Mobile security — OWASP MASVS

Reference: OWASP Mobile Application Security Verification Standard (MASVS), https://mas.owasp.org/MASVS/

Use the current MASVS and Mobile Application Security Testing Guide when adding real authentication, local persistence, network communication or sensitive wellbeing data. Relevant areas include secure storage, cryptography, authentication/authorization, network security, platform interaction, code quality/resilience and privacy.

Because MASVS is a living project, check its current controls at implementation and release time rather than copying an outdated checklist into code.

## 4. Measurement standards and health references

- WHO-5 is a published self-report instrument; follow its exact scoring and licensing terms.
- WHO physical-activity recommendations are guideline reference points; do not mislabel a custom logger as GPAQ.
- AASM/SRS sleep-duration guidance is age-scoped; do not label sleep duration as a sleep-quality scale.
- Academic metrics are app-derived behavioural indicators, not standardized psychometric scores.

## 5. What this alignment does not mean

This document does not mean Quadrilibrium is ISO-certified, OWASP-verified, clinically validated, approved by WHO or endorsed by any named medical/research organization. Such claims would require separate evidence, formal review and, where relevant, licensing/permission.
