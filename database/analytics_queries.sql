-- ==========================================
-- Executive SaaS Revenue & Retention Dashboard
-- PostgreSQL Analytics Queries
-- ==========================================


-- ==========================================
-- 1. Monthly Recurring Revenue (MRR)
-- ==========================================

SELECT
    DATE_TRUNC('month', transaction_date) AS month,
    SUM(amount) AS monthly_recurring_revenue
FROM transactions
WHERE status = 'Active'
GROUP BY 1
ORDER BY 1;


-- ==========================================
-- 2. Annual Recurring Revenue (ARR)
-- ==========================================

SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    SUM(amount) * 12 AS annual_recurring_revenue
FROM transactions
WHERE status = 'Active'
GROUP BY 1
ORDER BY 1;


-- ==========================================
-- 3. Churn Rate
-- ==========================================

SELECT
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE status = 'Canceled')
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM transactions;


-- ==========================================
-- 4. Active vs Cancelled Subscriptions
-- ==========================================

SELECT
    status,
    COUNT(*) AS total_subscriptions
FROM transactions
GROUP BY status;


-- ==========================================
-- 5. Cohort Retention Analysis
-- ==========================================

WITH customer_cohorts AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(transaction_date)) AS cohort_month
    FROM transactions
    GROUP BY customer_id
),

customer_activity AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', transaction_date) AS activity_month
    FROM transactions
),

cohort_data AS (
    SELECT
        cc.cohort_month,
        ca.activity_month,
        (
            EXTRACT(YEAR FROM age(ca.activity_month, cc.cohort_month)) * 12
            +
            EXTRACT(MONTH FROM age(ca.activity_month, cc.cohort_month))
        ) AS months_since_signup,
        ca.customer_id
    FROM customer_cohorts cc
    JOIN customer_activity ca
        ON cc.customer_id = ca.customer_id
)

SELECT
    cohort_month,
    months_since_signup,
    COUNT(DISTINCT customer_id) AS retained_customers
FROM cohort_data
GROUP BY 1, 2
ORDER BY 1, 2;


-- ==========================================
-- 6. Monthly Active Customers
-- ==========================================

SELECT
    DATE_TRUNC('month', transaction_date) AS month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM transactions
WHERE status = 'Active'
GROUP BY 1
ORDER BY 1;


-- ==========================================
-- 7. Revenue by Subscription Plan
-- ==========================================

SELECT
    plan_name,
    COUNT(*) AS subscriptions,
    SUM(amount) AS total_revenue
FROM transactions
WHERE status = 'Active'
GROUP BY plan_name
ORDER BY total_revenue DESC;


-- ==========================================
-- 8. Subscription Status Distribution
-- ==========================================

SELECT
    status,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM transactions
GROUP BY status;


-- ==========================================
-- 9. Top Revenue Generating Customers
-- ==========================================

SELECT
    customer_id,
    SUM(amount) AS lifetime_value
FROM transactions
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;