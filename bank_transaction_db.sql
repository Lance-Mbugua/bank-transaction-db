-- Create tables for a mock banking database
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    balance FLOAT
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    amount FLOAT,
    date DATE
);

-- Insert sample data
INSERT INTO accounts (account_id, customer_name, balance) VALUES (1, 'John Doe', 2000.0);
INSERT INTO accounts (account_id, customer_name, balance) VALUES (2, 'Jane Smith', 800.0);
INSERT INTO transactions (transaction_id, account_id, amount, date) VALUES (1, 1, -100.0, '2025-07-22');
INSERT INTO transactions (transaction_id, account_id, amount, date) VALUES (2, 1, 300.0, '2025-07-22');
INSERT INTO transactions (transaction_id, account_id, amount, date) VALUES (3, 2, -50.0, '2025-07-22');
INSERT INTO transactions (transaction_id, account_id, amount, date) VALUES (4, 2, 200.0, '2025-07-22');

-- Query to summarize transactions by account
SELECT a.customer_name, SUM(t.amount) AS total_transactions
FROM accounts a
JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.customer_name;

-- Query to calculate updated balances
SELECT a.customer_name, a.balance + SUM(t.amount) AS updated_balance
FROM accounts a
JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.customer_name, a.balance;
