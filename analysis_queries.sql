-- Bank Customer Churn Analysis
-- Database: PostgreSQL
-- Table: customers (10,000 rows)
-- exited = 1 -> customer left the bank, exited = 0 -> customer stayed

-- Table setup
CREATE TABLE customers (
    row_number INT,
    customer_id INT PRIMARY KEY,
    surname TEXT,
    credit_score INT,
    geography TEXT,
    gender TEXT,
    age INT,
    tenure INT,
    balance NUMERIC,
    num_of_products INT,
    has_cr_card INT,
    is_active_member INT,
    estimated_salary NUMERIC,
    exited INT
);

-- Load data (run in psql)
-- \copy customers FROM 'Churn_Modelling.csv' WITH (FORMAT csv, HEADER true);


-- 1. What is the overall churn rate?
SELECT COUNT(*) AS total_customers,
       SUM(exited) AS churned_customers,
       ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM customers;


-- 2. What is the churn rate by country?
SELECT geography,
       COUNT(*) AS total_customers,
       SUM(exited) AS churned_customers,
       ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM customers
GROUP BY geography
ORDER BY churn_rate_pct DESC;


-- 3. Is there a difference between female and male customers?
SELECT gender,
       COUNT(*) AS total_customers,
       SUM(exited) AS churned_customers,
       ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM customers
GROUP BY gender;


-- 4. How does churn change across age groups?
SELECT CASE
           WHEN age < 30 THEN '18-29'
           WHEN age < 40 THEN '30-39'
           WHEN age < 50 THEN '40-49'
           WHEN age < 60 THEN '50-59'
           ELSE '60+'
       END AS age_group,
       COUNT(*) AS total_customers,
       SUM(exited) AS churned_customers,
       ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM customers
GROUP BY age_group
ORDER BY age_group;


-- 5. Does the number of products affect churn?
SELECT num_of_products,
       COUNT(*) AS total_customers,
       SUM(exited) AS churned_customers,
       ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM customers
GROUP BY num_of_products
ORDER BY num_of_products;


-- 6. Do active members churn less than inactive members?
SELECT is_active_member,
       COUNT(*) AS total_customers,
       SUM(exited) AS churned_customers,
       ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM customers
GROUP BY is_active_member;
