-- Instructions

-- Recommended: Draw an ERD of the Chinook database. Make sure to label primary keys, foreign keys, and indicate the type of relationship (one to one, one to many, many to many, etc) for each relationship. (used lucidchart)

-- For each of the following exercises, provide the appropriate query. Yes, even the ones that are expressed in the form of questions. Everything from class and the Sqlite Documentation is fair game.


-- #1: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT CustomerId, FirstName, LastName, Country
FROM Customer
WHERE Country != 'USA'

-- #2: Provide a query only showing the Customers from Brazil.
SELECT CustomerId, FirstName, LastName, Country
FROM Customer
WHERE Country = 'Brazil'

-- #3: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT i.InvoiceId, i.InvoiceDate
FROM Invoice i
INNER JOIN Customers c ON i.CustomerId=c.CustomerId

-- #4: Provide a query showing only the Employees who are Sales Agents.
SELECT c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Invoice i
INNER JOIN Customer c ON i.CustomerId=c.CustomerId
WHERE c.Country = 'Brazil'

-- #5: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
--  (ordered alphabetically)
SELECT DISTINCT i.BillingCountry
FROM Invoice i
ORDER BY BillingCountry

-- #6: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
-- (added customer name and used 'AS' to rename table columns)
SELECT i.InvoiceId, e.FirstName AS AgentFirstName, e.LastName AS AgentLastName, c.FirstName AS CustomerFirstName, c.LastName AS CustomerLastName
FROM Invoice i
JOIN Customer c ON i.CustomerId=c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId

-- #7: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
-- (ordered by Customer Last Name)
SELECT i.Total, c.FirstName AS CustomerName, c.LastName AS CustomerLastName, c.Country, e.FirstName AS AgentFirstName, e.LastName AS AgentLastName
FROM Invoice i
JOIN Customer c ON i.CustomerId=c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
ORDER BY CustomerLastName

-- #8: How many Invoices were there in 2009 and 2011?
SELECT COUNT(i.InvoiceId)
FROM Invoice i
WHERE (i.InvoiceDate LIKE '2009%'
OR i.invoiceDate LIKE  '2011%')

-- #9: What are the respective total sales for each of those years?
-- (named columns 2009 and 2011 respectively)
SELECT SUM(CASE WHEN i.InvoiceDate LIKE '2009%' THEN i.Total END) as '2009',
       SUM(CASE WHEN i.InvoiceDate LIKE '2011%' THEN i.Total END) as '2011'
FROM Invoice i

-- #10: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT()
FROM InvoiceLine i
WHERE i.InvoiceId=37

-- #11: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT COUNT() AS LineCount
FROM InvoiceLine l
JOIN Invoice i
WHERE l.InvoiceId=i.InvoiceId
GROUP BY i.InvoiceId

-- #12: Provide a query that includes the purchased track name with each invoice line item.
SELECT t.Name
FROM InvoiceLine i
JOIN Track t on i.TrackId=t.TrackId

-- #13: Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT t.Name, r.Name
FROM InvoiceLine i
JOIN Track t on i.TrackId=t.TrackId
JOIN Album a on t.AlbumId=a.AlbumId
JOIN Artist r on a.ArtistId=r.ArtistId

-- #14: Provide a query that shows the # of invoices per country. HINT: GROUP BY

-- #15: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

-- #16: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

-- invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

-- sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

-- top_2009_agent.sql: Which sales agent made the most in sales in 2009?

-- Hint: Use the MAX function on a subquery.

-- top_agent.sql: Which sales agent made the most in sales over all?

-- sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

-- sales_per_country.sql: Provide a query that shows the total sales per country.

-- top_country.sql: Which country's customers spent the most?

-- top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

-- top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.

-- top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

-- top_media_type.sql: Provide a query that shows the most purchased Media Type.