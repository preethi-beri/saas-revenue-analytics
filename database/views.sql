CREATE OR REPLACE VIEW vw_mrr AS
SELECT
    DATE_TRUNC('month', transaction_date) AS month,
    SUM(amount) AS monthly_recurring_revenue
FROM transactions
WHERE status='Active'
GROUP BY 1;

CREATE OR REPLACE VIEW vw_arr AS
SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    SUM(amount) * 12 AS annual_recurring_revenue
FROM transactions
WHERE status='Active'
GROUP BY 1;

CREATE OR REPLACE VIEW vw_subscription_status AS
SELECT
    status,
    COUNT(*) AS total_subscriptions
FROM transactions
GROUP BY status;

CREATE OR REPLACE VIEW vw_churn AS
SELECT
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE status='Canceled')
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM transactions;
