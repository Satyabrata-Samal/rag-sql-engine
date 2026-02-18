-- 21
-- sales_agent_customer_count.sql
-- Provide a query that shows the count of customers assigned to each sales agent.

USE Chinook
SELECT COUNT(e.EmployeeId) as CustomerCount, e.FirstName + ' ' + e.LastName AS SalesRep
FROM Customer AS c
JOIN Employee AS e ON c.SupportRepId = e.EmployeeId
GROUP BY e.EmployeeId, e.FirstName, e.LastName