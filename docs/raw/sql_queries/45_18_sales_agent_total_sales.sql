-- 18
-- sales_agent_total_sales.sql
-- Provide a query that shows total sales made by each sales agent.

USE Chinook
SELECT SUM(i.Total) AS TotalSales, e.FirstName + ' ' + e.LastName AS SalesRep
FROM Customer AS c
JOIN Invoice AS i ON c.CustomerId = i.CustomerId
JOIN Employee AS e ON c.SupportRepId = e.EmployeeId
GROUP BY i.Total, e.FirstName, e.LastName 