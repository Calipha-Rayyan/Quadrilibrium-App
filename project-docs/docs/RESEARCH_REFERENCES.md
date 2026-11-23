# Research and Official References for Quadrilibrium Analytics

**Research cut-off:** 23 November 2026.  
**Use:** Product design guidance and metric implementation. This is not a clinical evidence review or a medical endorsement.

## 1. Mental wellbeing — WHO-5

### Official instrument

**World Health Organization (2024).** *The World Health Organization-Five Well-Being Index (WHO-5).* WHO/UCN/MSD/MHE/2024.1.  
Official publication: https://www.who.int/publications/m/item/WHO-UCN-MSD-MHE-2024.01  
Official instrument PDF: https://cdn.who.int/media/docs/default-source/mental-health/who-5_english-original4da539d6ed4b49389e3afe47cda2326a.pdf

Key properties stated by WHO:

- Five statements about the preceding two weeks.
- Six response points per item (0–5).
- Higher values indicate better wellbeing.
- Raw score 0–25; multiply by four for percentage 0–100.
- A score below 50 has been suggested as a signal for further assessment of possible mental-health conditions; it is not itself a diagnosis.
- Available official language versions include Urdu.
- License: CC BY-NC-SA 3.0 IGO. Non-commercial use/adaptation must follow attribution and share-alike conditions; do not use the WHO logo or imply WHO endorsement; review permissions for commercial use.

### Systematic review

Topp, C. W., Østergaard, S. D., Søndergaard, S., & Bech, P. (2015). The WHO-5 Well-Being Index: A systematic review of the literature. *Psychotherapy and Psychosomatics, 84*(3), 167–176. https://doi.org/10.1159/000376585

The review included 213 articles and reported high clinimetric validity and broad applicability. This supports WHO-5 as a brief self-report wellbeing measure, but it does not justify treating it as a diagnosis or as a daily mood meter.

## 2. Physical activity — WHO guidelines and GPAQ analysis guide

### WHO physical activity guidelines

World Health Organization (2020). *WHO Guidelines on Physical Activity and Sedentary Behaviour.* https://www.who.int/publications/i/item/9789240015128

For adults, the guideline recommends 150–300 minutes of moderate-intensity aerobic activity per week, or 75–150 minutes of vigorous-intensity activity, or an equivalent combination. Muscle-strengthening activity involving major muscle groups is recommended on at least two days per week.

### GPAQ analysis guide

World Health Organization. *Global Physical Activity Questionnaire (GPAQ) Analysis Guide.* https://www.who.int/docs/default-source/ncds/ncd-surveillance/gpaq-analysis-guide.pdf

The guide explains that GPAQ covers work, transport and recreation activity plus sedentary behaviour; it comprises 16 questions. It was developed for face-to-face interviews by trained interviewers. For analysis, the guide assigns 4 METs to moderate activity and 8 METs to vigorous activity. The GPAQ-derived adult threshold includes at least 600 MET-minutes/week.

**Design implication:** Quadrilibrium can show user-recorded moderate/vigorous minutes against WHO guideline ranges. Do not claim a GPAQ score unless the full instrument, administration and analysis requirements are followed.

## 3. Sleep duration — sleep-medicine consensus

Watson, N. F., Badr, M. S., Belenky, G., et al. (2015). Recommended amount of sleep for a healthy adult: A joint consensus statement of the American Academy of Sleep Medicine and Sleep Research Society. *Journal of Clinical Sleep Medicine, 11*(6), 591–592. https://doi.org/10.5664/jcsm.4758

The consensus statement recommends seven or more hours per night on a regular basis for adults aged 18–60. It also notes that more than nine hours may be appropriate for young adults, individuals recovering from sleep debt or those with illness. Sleep duration is only one aspect of healthy sleep; timing, regularity, quality and disturbances also matter.

CDC age-based sleep overview: https://www.cdc.gov/sleep/about/

### Sleep instrument rights

University of Pittsburgh Center for Sleep and Circadian Science. *Pittsburgh Sleep Quality Index (PSQI).* https://www.sleep.pitt.edu/psqi

The University states that the PSQI instrument is owned by the University of Pittsburgh, may be reprinted without charge only for non-commercial research and educational purposes, and may not be modified without prior written permission. Commercial use requires licensing. Quadrilibrium therefore uses duration tracking only unless permission for a formal instrument is obtained.

## 4. Academic analytics — learning analytics research

### Student-facing dashboard systematic review

Paulsen, L., & Lindsay, E. (2024). Learning analytics dashboards are increasingly becoming about learning and not just analytics — A systematic review. *Education and Information Technologies, 29*, 14279–14308. https://doi.org/10.1007/s10639-023-12401-4

The review examines student-facing learning-analytics dashboards and the movement toward more learning-informed designs. Design implication: present metrics in ways that help the learner make a useful next decision, rather than showing charts for chart decoration.

### Engagement indicator systematic review

Bergdahl, N., Bond, M., Sjöberg, J., Dougherty, M., et al. (2024). Unpacking student engagement in higher education learning analytics: A systematic review. *International Journal of Educational Technology in Higher Education, 21*, 63. https://doi.org/10.1186/s41239-024-00493-y

The review included 159 studies and found that higher-education learning analytics often relies on observable behavioural indicators. Engagement is multifaceted; clicks, time and activity logs do not capture every cognitive, emotional or social dimension.

### Self-regulated learning indicators review

(2024). Using learning analytics to measure self-regulated learning: A systematic review of empirical studies in higher education. *Journal of Computer Assisted Learning, 40*(4), 1658–1674. https://doi.org/10.1111/jcal.12982

The review identifies time-management indicators such as engagement regularity and procrastination patterns, while cautioning that time-on-task and platform activity alone may not adequately represent learning quality.

**Design implication:** focus minutes, planned-versus-completed tasks and task completion rate are useful app telemetry, not validated measures of intelligence, academic ability or learning quality. Label them as app-derived metrics and compare users primarily with their own goals/history.

## 5. International standards used as documentation references

- **ISO/IEC/IEEE 29148:2018** — requirements engineering and requirements information items. ISO lists a 2026 draft revision as under development; do not cite the draft as a published standard. https://www.iso.org/standard/72089.html and https://www.iso.org/standard/94091.html
- **ISO/IEC 25010:2023** — product quality model for ICT/software products, published edition 2. https://www.iso.org/standard/78176.html
- **OWASP MASVS** — mobile application security verification guidance; living standard to re-check at implementation/release time. https://mas.owasp.org/MASVS/

## 6. Evidence limits

- WHO physical-activity guidelines are population-level recommendations, not a personalized exercise prescription.
- WHO-5 is a self-report wellbeing instrument and does not diagnose a condition.
- A seven-hour adult sleep reference is not universal for all ages or all individuals.
- Academic activity metrics can describe what the app recorded, not prove the quality or outcomes of learning.
- The sample values currently shown in Figma are illustrative only.
