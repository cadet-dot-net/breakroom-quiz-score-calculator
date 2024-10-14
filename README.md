# QuizScoreCalculator

## Task breakdown
Context:
> The way we score the Breakroom quiz is by adding and withholding points for answers that we think are either good or bad. A response scores one point for having a positive answer, and does not gain that point for a negative answer. Missing answers do not contribute to the overall score.

Task Breakdown:
- [x] parse given JSON file to get each data point as a response_name: value pair
- [x] store fixed data for minimum wages by date
- [ ] increment total points based on each found data point pair
  - [ ] `enjoys_job: "yes"`
  - [ ] `respected_by_managers: "yes"`
  - [ ] `good_for_carers: "yes`
  - [ ] `hours_actually_worked < contracted_hours + 8`
  - [ ] `unpaid_extra_work: "no"`
  - [ ] `hourly_rate >= minimum_wage`

## Tests
- [ ] all values are assigned points correctly
- [ ] missing values in file are not assigned points