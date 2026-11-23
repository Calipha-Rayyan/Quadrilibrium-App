# Analytics Scale and Calculation Specification

**Version:** 1.0  
**Prepared:** 23 November 2026  
**Purpose:** Define the valid metric, unit, period, reference and caveat for each Analytics graph.

## 1. Core design rule

There is no single validated score that combines academic productivity, physical activity, mental wellbeing and sleep duration into one 0–100 value for this application. These dimensions measure different constructs and use different units and recall windows. **Keep them separate.** Do not average them or compare bar heights across cards.

This is why the Home ring now communicates **four dimensions tracked** instead of showing a made-up balance score.

## 2. Metric summary

| Dimension | Display metric | Unit / scale | Time window | Reference |
|---|---|---|---|---|
| Academics | Tracked focus time | Minutes/day; 0–180 chart scale | Daily bars + weekly sum | User-defined goal; no universal “healthy student” threshold |
| Physical Fitness | Moderate activity time | Minutes/day; 0–60 chart scale; weekly sum | Daily bars + week total | WHO adult recommendation: 150–300 moderate minutes/week, or equivalent vigorous activity |
| Mental Wellbeing | WHO-5 Well-Being Index | Raw 0–25 and derived 0–100 | Previous two weeks; periodic assessment | A score below 50 may indicate poor wellbeing and need for further assessment; not a diagnosis |
| Sleep | Sleep duration | Hours/night; 0–10 chart scale | Each night + seven-night average | Adults aged 18–60: 7 or more hours per night on a regular basis |

Prototype values are illustrative sample data, not measurements from the user.

## 3. Academics — operational metrics, not a psychometric scale

There is no universal validated 0–100 academic productivity scale defined by the supplied screen specification. Use transparent app-recorded measures instead.

### Focus time

- Source: completed Pomodoro/focus sessions.
- Daily value: sum of valid completed focus-session minutes on that calendar day.
- Weekly value: sum of valid completed focus-session minutes in the selected week.
- Figma sample: 615 minutes in the week, which is 10.25 hours and displays as 10.3 hours after rounding.
- Chart scale: 0–180 minutes/day. This is a visualization range, not a recommended academic threshold.

### Task completion

```text
completion_rate = completed_tasks_due_in_period / total_tasks_due_in_period × 100
```

- The denominator includes only tasks due within the selected period.
- A task not yet due is not a failed task and must not enter the denominator.
- If no tasks are due, display `No tasks due` or `N/A`; do not display 0%.
- Completion rate is an operational app metric, not a validated measure of learning or academic ability.

### Interpretation warning

Learning-analytics research shows that clicks, login time and recorded task duration are imperfect proxies for learning quality. Show focus time as recorded time, not as proof of attention, comprehension or academic performance. Allow the user to compare their current period with their own history rather than with unsupported population norms.

## 4. Physical Fitness — WHO guideline reference, not GPAQ score

### Metric

Record minutes of moderate and vigorous aerobic activity. The initial Analytics chart can show daily moderate-intensity minutes and a weekly total. The design sample shows 240 moderate minutes for the week.

### WHO adult reference

For adults, WHO recommends 150–300 minutes of moderate-intensity aerobic activity per week, or 75–150 minutes of vigorous-intensity activity, or an equivalent combination. WHO also recommends muscle-strengthening activities involving major muscle groups on 2 or more days/week.

### Optional moderate-equivalent calculation

The WHO GPAQ analysis guide assigns 4 METs to moderate activity and 8 METs to vigorous activity. For an app that records intensity and duration, a clear moderate-equivalent display can be calculated as:

```text
moderate_equivalent_minutes = moderate_minutes + (2 × vigorous_minutes)
```

This formula is derived from the 4:8 MET relationship. It is not a “GPAQ score”. The full WHO GPAQ is a 16-question surveillance instrument developed for face-to-face administration by trained interviewers and includes work, transport, recreation and sedentary-behaviour domains. Do not label a short in-app activity logger as GPAQ.

### Data required

- Activity date.
- Duration in minutes.
- Intensity: moderate or vigorous.
- Optional category: work/study, transport, recreation/workout.
- Strength-training session flag, tracked separately.

A completed workout flag alone is not enough to calculate minutes. If duration/intensity are unavailable, display workouts completed rather than inventing activity minutes.

### Age handling

The adult weekly target must not be presented as universal for minors. If the product later supports younger users, select age-appropriate WHO recommendations. WHO’s 5–17-year guidance is different from adult guidance.

## 5. Mental Wellbeing — WHO-5

### Instrument

The WHO-5 is a five-item self-report index measuring positive mental wellbeing. Each item refers to the preceding two weeks and is answered on a six-point scale from 0 to 5, with higher numbers indicating better wellbeing.

### Scoring

```text
raw_score = sum(item_1, item_2, item_3, item_4, item_5)  // 0..25
percentage_score = raw_score × 4                         // 0..100
```

Response coding:

| Response | Score |
|---|---:|
| At no time | 0 |
| Some of the time | 1 |
| Less than half of the time | 2 |
| More than half of the time | 3 |
| Most of the time | 4 |
| All of the time | 5 |

**Missing-answer rule:** if any of the five items is unanswered, do not calculate the total score. Do not impute a value or treat a skipped item as zero.

### Interpretation

The WHO publication states that a percentage score below 50 (raw score below 13) has been suggested as a cut-off for poor mental wellbeing and an indication for further assessment for the possible presence of a mental-health condition. It is a prompt for further assessment, not a diagnosis and not a stand-alone clinical conclusion.

### Graphing

- Plot assessment results, not daily mood estimates.
- Each point represents a completed assessment whose recall period is the preceding two weeks.
- A fortnightly schedule is a product choice that avoids unnecessarily overlapping assessment windows; it is not stated as a mandatory WHO administration frequency.
- Y-axis: 0–100.
- Show a labelled reference line at 50.
- Use “Consider further assessment” or “Below reference” language; never “You have depression” or equivalent.
- If no valid assessment exists, show `Not assessed` rather than 0.

### Licensing and attribution

The WHO-5 2024 publication is released under CC BY-NC-SA 3.0 IGO. For non-commercial use, provide proper attribution and license adaptations under the same or an equivalent license. Do not use the WHO logo or imply WHO endorsement. Commercial use requires reviewing WHO permissions/licensing. Preserve the official item wording and response coding; do not casually rewrite or shorten the instrument.

## 6. Sleep — duration is not sleep quality

### Metric

Derive sleep duration from the recorded bedtime and wake-up time. Handle crossing midnight correctly. Show daily hours and a seven-night average where valid records exist.

### Adult reference

The joint consensus statement from the American Academy of Sleep Medicine and Sleep Research Society recommends adults aged 18–60 sleep 7 or more hours per night on a regular basis. This is a duration recommendation, not a full sleep-quality score.

- Figma line: 7 hours.
- Label the line as an adult 18–60 reference.
- If age is not known, do not imply that the recommendation applies to everyone.
- Do not infer sleep quality, sleep stages, insomnia or a disorder from bedtime/wake-up data alone.

### PSQI decision

The Pittsburgh Sleep Quality Index is a widely used 19-item sleep-quality instrument with seven component scores and a global range of 0–21, but it is owned by the University of Pittsburgh. The instrument may be reprinted without charge only for non-commercial research and educational purposes; it must not be modified without prior written permission, and commercial use requires licensing. Do not reproduce or modify PSQI inside Quadrilibrium until the applicable permission has been obtained.

## 7. Why the chart ranges differ

| Chart | Scale shown | Why |
|---|---|---|
| Academics | 0–180 min/day | Convenient visualization range for recorded study focus time; user goal can be configured |
| Physical Fitness | 0–60 min/day plus weekly target | WHO adult guidance is weekly; daily bars show contribution to the weekly total |
| WHO-5 | 0–100 | Official WHO-5 transformed score; 50 reference line |
| Sleep | 0–10 h/night | Duration unit; 7-hour adult reference line |

**Important:** The ranges are not interchangeable. A taller bar in one card does not mean that dimension is “healthier” or more important than another.

## 8. Figma sample values

The current visual prototype uses illustrative values:

- Academics: 615 focus minutes/week.
- Physical Fitness: 240 moderate activity minutes/week.
- Mental Wellbeing: WHO-5 sample assessment scores 52, 58, 64 and 68 at four two-week intervals.
- Sleep: sample nightly durations around the adult seven-hour reference, with a sample average of 7.2 h/night.

Do not treat these as real user measurements. In the runtime app, sample/demo mode should be visually distinguished from genuine user data.
