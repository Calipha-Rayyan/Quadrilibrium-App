# Security and Privacy Requirements

Quadrilibrium may eventually store personal productivity, sleep and mental-wellbeing information. Treat reflection text and questionnaire responses as sensitive personal data even when the project is currently a student prototype.

## 1. Current prototype phase

- Use fictional sample data only.
- Do not put real wellbeing responses, private reflections, passwords or personal identifiers in source control.
- Do not add cloud analytics or remote storage without an approved requirement and privacy review.
- Do not claim that local mock Login is secure authentication.

## 2. Data minimization

- Collect only fields needed for a feature.
- Explain why each sensitive field is collected.
- Make optional wellbeing check-ins optional.
- Keep free-text reflections separate from analytics summaries.
- Do not send thought-card text or WHO-5 answers to third-party analytics/logging.
- Provide a future data export and deletion path if persistence is added.

## 3. Authentication and authorization (future backend)

- Store password hashes only through a trusted authentication provider; never store raw passwords.
- Protect every user-owned record on the server/data layer.
- Do not trust client-supplied user IDs or authorization claims.
- Use least-privilege access and short-lived sessions where applicable.

## 4. Storage and transport (future persistence)

- Use platform-secure storage for tokens/secrets.
- Encrypt sensitive data at rest and in transit where applicable.
- Do not hard-code API keys, signing keys, database passwords or private tokens.
- Exclude `.env`, keystores and signing material from Git.
- Define retention, deletion, backup and recovery before launch.

## 5. Wellbeing and health-related content

- The app is not a medical device and does not diagnose, treat or prevent disease.
- WHO-5 results are wellbeing self-report scores, not a diagnosis.
- A WHO-5 score below 50 must be expressed as a possible reason to consider further assessment, not as a clinical conclusion.
- Do not infer depression, anxiety, insomnia or fitness status from timer/activity logs.
- Do not provide medication, treatment or emergency advice.
- If a user expresses urgent distress in a future free-text feature, do not imply that the app monitors or guarantees a response. Define appropriate help-seeking information with qualified local review before launch.

## 6. Mobile security reference

Use the current OWASP Mobile Application Security Verification Standard (MASVS) and Mobile Application Security Testing Guide as a risk-based reference when implementing storage, cryptography, authentication, network communication, platform interaction, code integrity and privacy controls. The standard is living and should be checked at implementation/release time.

Reference: https://mas.owasp.org/MASVS/

## 7. Review checklist

- [ ] No secrets committed.
- [ ] No sensitive values in debug logs/crash reports.
- [ ] Consent and privacy notice exist before collecting wellbeing answers.
- [ ] Sensitive data collection is minimized.
- [ ] Data access and deletion rules are defined.
- [ ] Platform storage/network controls reviewed against OWASP MASVS.
- [ ] Release permissions and backup behavior are reviewed.
