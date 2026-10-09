# Week 2: SQL Data Cleaning -- Cross-Validation and Data Quality Checks

## What I Did
- Performed cross-validation between the sales, customers, and products tables using SQL queries.

- Checked whether all customer and product IDs referenced in the sales table exist in their respective tables.

- Found 0 orphan customer references and 0 orphan product references.

- Identified 592 customers with no recorded purchases.

- Identified 12 products with no recorded sales.

- Discovered that all 12 unsold products have names that appear more than once in the products table, indicating potential duplicates.

- Contributed findings and recommendations to the team's data quality report.

## Recommendations

- Investigate why 592 customers have no recorded purchases and consider opportunities for first-purchase marketing campaigns (if not duplicates).

- Review the 12 unsold product records for potential duplicates and verify their details before making any changes.

## Key Learnings
- Learned how to validate relationships between multiple database tables.

- Practiced using NOT IN and subqueries to identify missing references and unmatched records.

- Learned how to use IS NOT NULL to exclude missing values from subqueries.

- Improved my understanding of data integrity and orphan records.

- Learned how to identify customers without purchases and products without sales.

- Used GROUP BY and HAVING COUNT(*) > 1 to investigate duplicate product names.

- Gained a better understanding of how data quality issues can affect business analysis and decision-making.

## Files
- `week2_cross_validation.sql` -- my SQL queries
- `SQL_result_1.png`, `SQL_result_2.png` -- screenshots of the results

## Teamwork
- [SQL Data Quality and Cleaning Preparation](https://docs.google.com/presentation/d/1eH0oy5EjVSSXujXePEVqBoE1ndanLZXcpGtI95Zl9yA/edit?slide=id.h74c76558572e6666_1_10#slide=id.h74c76558572e6666_1_10)
