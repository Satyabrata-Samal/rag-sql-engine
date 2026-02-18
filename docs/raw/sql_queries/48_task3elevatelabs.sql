-- Task 3 SQL Queries for Chinook Database

-- Use the Chinook database (if needed)
-- USE chinook;

-- 1. Select first 10 customers
SELECT * FROM customers
LIMIT 10;

-- 2. Count total invoices per customer
SELECT customerid, COUNT(*) AS total_invoices
FROM invoices
GROUP BY customerid
ORDER BY total_invoices DESC
LIMIT 10;

-- 3. Total sales per customer (sum of invoice totals)
SELECT customerid, SUM(total) AS total_spent
FROM invoices
GROUP BY customerid
ORDER BY total_spent DESC
LIMIT 10;

-- 4. List invoices along with customer names using INNER JOIN
SELECT c.firstname, c.lastname, i.invoicedate, i.total
FROM customers c
INNER JOIN invoices i ON c.customerid = i.customerid
ORDER BY i.invoicedate DESC
LIMIT 10;

-- 5. Customers who spent more than $50 (using subquery)
SELECT firstname, lastname
FROM customers
WHERE customerid IN (
    SELECT customerid FROM invoices
    GROUP BY customerid
    HAVING SUM(total) > 50
);

-- 6. Average invoice total amount (average revenue per invoice)
SELECT AVG(total) AS avg_invoice_total
FROM invoices;

-- 7. Create a view of top 5 customers by total spending
CREATE OR REPLACE VIEW top_customers AS
SELECT customerid, SUM(total) AS total_spent
FROM invoices
GROUP BY customerid
ORDER BY total_spent DESC
LIMIT 5;

-- 8. Query from the view
SELECT tc.customerid, c.firstname, c.lastname, tc.total_spent
FROM top_customers tc
JOIN customers c ON tc.customerid = c.customerid;

-- 9. Optimize queries by creating an index on invoices.customerid
CREATE INDEX idx_invoices_customerid ON invoices(customerid);

-- 10. Handle NULLs example: Find customers with missing fax number
SELECT firstname, lastname, fax
FROM customers
WHERE fax IS NULL;

-- 11. Use HAVING clause to find customers with more than 3 invoices
SELECT customerid, COUNT(*) AS invoice_count
FROM invoices
GROUP BY customerid
HAVING COUNT(*) > 3
ORDER BY invoice_count DESC;

