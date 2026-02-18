-- 14
-- country_invoices.sql
-- Provide a query that shows the # of invoices per country. HINT: GROUP BY

USE Chinook
SELECT COUNT(*) as CountOfCountry, i.BillingCountry
FROM Invoice AS i
GROUP BY i.BillingCountry