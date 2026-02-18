-- 17
-- invoices_line_item_count.sql
-- Provide a query that shows all Invoices but includes the # of invoice line items.

USE Chinook
SELECT COUNT(i.InvoiceId) AS CountLineItems, i.*
FROM Invoice as i
JOIN InvoiceLine as il ON i.InvoiceId = il.InvoiceId
GROUP BY    i.InvoiceId, 
            i.CustomerId, 
            i.BillingAddress, 
            i.BillingCity, 
            i.BillingCountry, 
            i.BillingPostalCode,
            i.BillingState,
            i.InvoiceDate,
            i.Total 
