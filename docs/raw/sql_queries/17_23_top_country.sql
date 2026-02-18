--  23
-- top_country.sql
-- Which country's customers spent the most?

USE Chinook
SELECT TOP 1 SUM(i.Total) AS TotalSales, i.BillingCountry
FROM Invoice AS i
GROUP BY i.BillingCountry
ORDER BY TotalSales DESC