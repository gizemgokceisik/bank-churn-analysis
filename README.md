# Bank Customer Churn Analysis

## Business Problem
A European bank is losing customers. This project uses SQL to answer three questions:
1. Which customers are leaving the bank?
2. Which customer segments have the highest churn risk?
3. What can the bank do to keep them?

**Churn** = a customer closing their account and leaving the bank (`exited = 1`).

## Data
- Source: Bank Customer Churn Modelling dataset, Kaggle (public dataset)
- 10,000 customers, 14 columns: country, gender, age, tenure, balance, number of products, credit card ownership, active membership, estimated salary and churn status.

## Tools
- **PostgreSQL** – stored the data in a relational table and ran the analysis with SQL.
- **psql** – loaded the CSV file with `\copy`.

## Analysis
All queries are in [`sql/analysis_queries.sql`](sql/analysis_queries.sql). Each query compares the churn rate across one customer segment using `COUNT`, `SUM`, `AVG`, `GROUP BY` and `CASE`.

| # | Question |
|---|----------|
| 1 | What is the overall churn rate? |
| 2 | What is the churn rate by country? |
| 3 | Is there a difference between female and male customers? |
| 4 | How does churn change across age groups? |
| 5 | Does the number of products affect churn? |
| 6 | Do active members churn less than inactive members? |

## Key Findings
- **Overall churn rate is about 20%.** One in five customers has left the bank.
- **Germany is the highest-risk market.** Germany's churn rate (32.4%) is about twice that of France (16.2%) and Spain (16.7%). Germany has half as many customers as France, yet almost the same number of churned customers (814 vs. 810).
- **Two products is the sweet spot.** Customers with 2 products have the lowest churn rate (7.6%), compared with 27.7% for customers with only 1 product. Customers with 3–4 products churn at 83–100%, but these groups are small (266 and 60 customers), so this result should be interpreted with caution.
- **Inactive members are almost twice as likely to leave.** Churn is 26.9% for inactive members vs. 14.3% for active members.
- **Female customers churn more.** Churn is 25.1% for female customers vs. 16.5% for male customers.
- **Churn rises sharply after age 40.** Churn is 10.9% for customers aged 30–39, 30.8% for 40–49 and peaks at 56.0% for 50–59, where one in two customers has left. It drops back to 28.0% for customers aged 60+.

## Recommendations
- **Investigate the German market first.** Compare German customers' balance, age and product usage with other countries to understand why they leave.
- **Cross-sell a second product to single-product customers.** They are the largest group (5,084 customers) and churn about 3.7 times more than customers with 2 products.
- **Re-engage inactive members** with targeted campaigns before they leave.
- **Design retention offers for customers aged 40–59**, the age group with the highest churn.
- **Review the offer for customers with 3+ products** to understand why almost all of them leave.

## Next Steps
- Exploratory analysis and charts in Python (pandas, seaborn)
- Power BI dashboard for management
- A simple model to predict which customers are likely to churn
