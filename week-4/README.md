# Week 4: SQL Aggregation – Customer Segmentation (Role B)

## What I Did

- Used a CTE (`WITH`), `LEFT JOIN`, and `COALESCE()` to calculate each customer's total spending with `SUM()`, including customers without purchases.
- Applied `CASE WHEN` to classify customers as VIP (≥ €10,000), Regular (≥ €500 and < €10,000), or Basic (< €500).
- Used `GROUP BY`, `COUNT()`, `AVG()`, `SUM()`, and `ROUND()` to analyze customer counts, average spending, and total revenue by segment and city.
- Identified TOP 10 customers using `COUNT(DISTINCT ...)`, `HAVING` (at least two orders), `ORDER BY ... DESC`, and `LIMIT 10`.
- Practiced the window function `RANK() OVER (PARTITION BY ... ORDER BY ... DESC)` to rank customers by spending within each city.
- Summarized SQL results and prepared marketing recommendations for the team presentation.

## Key Findings

- **VIP:** 15 customers; **€318,985** total revenue.
- **Regular:** 1,707 customers; **€2,089,947** total revenue (about **80%** of the total).
- **Basic:** 1,428 customers; **€213,800** total revenue, including customers without purchases.
- Tallinn and Pärnu have the most VIP customers (**5 each**); Tallinn leads in Regular and Basic customers.

## Recommendations

- Focus on retaining Regular customers and rewarding high-value VIP customers.
- Use targeted campaigns to encourage Basic customers to make more purchases, distinguishing inactive customers from low spenders.

## Key Learnings

- Practiced CTEs, `CASE WHEN`, `LEFT JOIN`, `COALESCE()`, and aggregate functions.
- Improved my use of `GROUP BY`, `HAVING`, `RANK()`, and `PARTITION BY` for customer analysis.
- Learned to turn SQL results into marketing recommendations.

## Files
- `week4_role B_customer_segmentation.sql` -- my SQL queries
- `SQL_result_W4.png` -- screenshots of the results

## Teamwork
- [SQL Aggregation -- team analysis and weekly presentation](https://docs.google.com/presentation/d/1Nc3CT6BlMXiPIJu1KvxRVRQWzAEdJ32FoD-Oh7y5uyo/edit?usp=sharing)
