-- 22
-- sales_per_country.sql
-- Provide a query that shows the total sales per country.

USE Chinook
SELECT SUM(i.Total) AS TotalSales, i.BillingCountry
FROM Invoice AS i
GROUP BY i.BillingCountry