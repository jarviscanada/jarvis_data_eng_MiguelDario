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
SELECT MAX(invoice_date) AS max, MIN(invoice_date) AS min
FROM retail;

-- Q5: number of SKU/merchants (e.g. unique stock code)
SELECT COUNT(DISTINCT stock_code)
FROM retail;

-- Q6: Calculate average invoice amount excluding invoices with a negative amount (e.g. canceled orders have negative amount)
SELECT COUNT(DISTINCT invoice_no)
FROM retail;

SELECT invoice_no, SUM(unit_price)
FROM retail
GROUP BY invoice_no;

