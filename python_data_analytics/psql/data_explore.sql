-- Show Database Schema
\d+ retail;

-- Q1: Show first 10 rows
SELECT *
FROM retail
LIMIT 10;

-- Q2: Check # of records
SELECT COUNT(*)
FROM retail;

-- Q3: number of clients (e.g unique client ID)
SELECT COUNT(DISTINCT customer_id)
FROM retail;

-- Q4: invoice date range (e.g. max/min dates)
SELECT
    MAX(invoice_date) AS max,
    MIN(invoice_date) AS min
FROM retail;

-- Q5: number of SKU/merchants (e.g. unique stock code)
SELECT COUNT(DISTINCT stock_code)
FROM retail;

-- Q6: Calculate average invoice amount excluding invoices with a negative amount (e.g. canceled orders have negative amount)
SELECT AVG(total_amount)
FROM(
    SELECT SUM(unit_price * quantity) as total_amount
    FROM retail
    GROUP BY invoice_no
    HAVING SUM(unit_price * quantity) > 0
    ) AS sub;

-- Q7: Calculate total revenue (e.g. sum of unit_price * quantity)
SELECT SUM(unit_price * quantity)
FROM retail;

-- Q8: Calculate total revenue by YYYYMM
SELECT
    CAST(EXTRACT(YEAR FROM invoice_date) AS INTEGER) * 100 + CAST(EXTRACT(MONTH FROM invoice_date) AS INTEGER) AS yyyymm,
    SUM(unit_price * quantity)
FROM retail
GROUP BY yyyymm
ORDER BY yyyymm;


