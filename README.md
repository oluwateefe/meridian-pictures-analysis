# Meridian Pictures: Where Should a $500M Film Budget Go?

An end-to-end data analytics project using **Excel, SQL (PostgreSQL) and Power BI**, structured with the D.R.I.V.E. framework (Define, Retrieve, Insight, Visualise, Execute).

## The business problem

Meridian Pictures wants to invest $500M in its next films and needs to know, based on what has worked in the past, which kinds of films are likely to be profitable without reducing the quality the studio is known for.

The decision: which genres, budget tiers, film lengths and directors the executive team should back.

## The data

- Movie dataset of **10,865 films (1960-2015)**
- **3,854 films** had usable budget and revenue data. Rows with a $0 budget or revenue were treated as missing (not "free") and excluded from all money questions
- Inflation-adjusted columns (`budget_adj`, `revenue_adj`) used throughout so decades compare fairly
- One duplicate record removed during cleaning

## Key findings

| Question | Finding |
|---|---|
| Genre | Adventure, Animation and Family lead on average profit (about $218M, $211M, $205M) while holding ratings of 6.1-6.4 |
| Budget | Bigger budgets mean bigger average profit, but the budget-revenue correlation is a moderate 0.57, so results vary widely |
| Decade | The 1960s-70s look most profitable, but the samples are small (71-133 films), so a few blockbusters skew the average |
| Runtime | Films over 150 minutes lead on both average profit and rating |
| Directors | Spielberg leads on total profit; Cameron earns more per film |
| Hype vs quality | Popularity is only loosely linked to rating; top-rated films rarely overlap with top-profit films |

## Recommendations

1. Prioritise Adventure, Animation and Family films.
2. Favour larger budgets, but match size to genre and director track record rather than by default.
3. Back directors with a proven track record.

**Limitation:** the data ends in 2015 and does not reflect the streaming era.

## What's in this repo

| File | Description |
|---|---|
| `"C:\Users\NEW USER\Downloads\Data Analytics Class\Project\Project answer\excel_dataset.xlsx"` | Cleaned data, one pivot table and chart per question, summary sheet, Excel dashboard |
| `"C:\Users\NEW USER\Downloads\Data Analytics Class\Project\Project answer\sql_project.sql"` | One commented query per insight question |
| `"C:\Users\NEW USER\Downloads\Data Analytics Class\Project\Project answer\powerbi_project.pbix"` | Power BI dashboard (open in Power BI Desktop) |
| `"C:\Users\NEW USER\Downloads\Data Analytics Class\Project\Project answer\Recommendation Memo.docx"` | One-page recommendation memo for the CEO |
| `"C:\Users\NEW USER\Downloads\Data Analytics Class\Project\Project answer\Project Presentation- Boluwatife Bankole.pptx"` | 10-minute walkthrough of the project |

## Dashboard preview

<img width="1184" height="667" alt="image" src="https://github.com/user-attachments/assets/48b093b5-2b5a-4e7d-9857-739d9d6a0cf0" />


## Tools and techniques

- **Excel:** pivot tables, pivot charts, slicers, IF/IFS logic, AVERAGEIFS, CORREL
- **SQL:** GROUP BY, HAVING, CASE WHEN, aggregate functions
- **Power BI:** DAX measures, Power Query custom columns, slicers, Top N filters

## Author

[Boluwatife Bankole] | [www.linkedin.com/in/boluwatife-bankole-458999215] | [bankoleboluwatife28@gmail.com]
