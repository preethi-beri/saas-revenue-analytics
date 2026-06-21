CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    subscription_id VARCHAR(20) NOT NULL,
    plan_name VARCHAR(50) NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    transaction_date DATE NOT NULL
);