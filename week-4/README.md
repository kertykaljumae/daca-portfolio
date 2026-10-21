# Week 4: SQL Aggregation – Customer Segmentation (Role B)

## What I Did

- Used a CTE, `LEFT JOIN`, and `COALESCE()` to calculate customer spending, including customers without purchases.
- Segmented customers with `CASE WHEN`: VIP (≥ €10,000), Regular (≥ €500 and < €10,000), and Basic (< €500).
- Analyzed segment sizes, average spending, total revenue, TOP 10 customers, and customer distribution by city.
- Used `HAVING` to filter customers with at least two orders and `RANK()` to rank customers within cities.

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

- SQL queries and screenshots/charts of the results.

## Teamwork

- Shared findings and recommendations for the team's Week 4 presentation.
