#Performed analytics on the imported data using SQL. 

#1. Show Customers (their full names, customer ID, and country) who are not in the US.
    SELECT Firstname, LastName, CustomerId, Country
    FROM chinook.customers 
    WHERE Country <> 'USA';

#2. Show only the Customers from Brazil.
    SELECT * FROM chinook.customers
    WHERE country = 'Brazil';

#3. Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country.
    SELECT c.firstname, c.lastname, i.invoiceid, i.invoicedate, i.billingcountry
    FROM chinook.customers c
    JOIN chinook.invoices i
    ON c.customerid = i.customerid
    WHERE c.country = 'Brazil';

#4. Show the Employees who are Sales Agents.
    SELECT * FROM chinook.employees
    WHERE title like 'Sales Support Agent';
    
#5. Find a unique/distinct list of billing countries from the Invoice table.
    SELECT DISTINCT BillingCountry 
    FROM chinook.invoices;

#6. Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name.
    SELECT i.invoiceid, e.firstname, e.lastname
    FROM chinook.employees e
    JOIN chinook.customers c
    ON e.employeeid = c.supportrepid
    JOIN chinook.invoices i
    ON c.customerid = i.customerid
    WHERE e.title like 'Sales Support Agent';

#7. Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.
    SELECT c.firstname as C_FN, c.lastname as C_LN, c.country, e.firstname as Agent_FN, e.lastname as Agent_LN,  i.Total
    FROM chinook.invoices i
    JOIN chinook.customers c
    ON i.customerid = c.customerid
    JOIN chinook.employees e
    ON c.supportrepid = e.employeeid;

#8. How many Invoices were there in 2009?
    SELECT count(DISTINCT invoiceid) 
    FROM chinook.invoices
    WHERE InvoiceDate BETWEEN '2009-01-01' and '2009-12-31';

#9. What are the total sales for 2009?
    SELECT SUM(Total)
    FROM chinook.Invoices
    WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

#10. Write a query that includes the purchased track name with each invoice line ID.
     SELECT i.InvoiceLineID, t.Name as Track_Name
     FROM chinook.invoice_items i
     LEFT JOIN chinook.tracks t
     ON i.TrackId = t.TrackId;

#11. Write a query that includes the purchased track name AND artist name with each invoice line ID.
     SELECT t.name as Track_Name, a.name as Artist_Name, i.InvoiceLineId
     FROM chinook.invoice_items i
     JOIN chinook.tracks t
     ON i.trackid = t.trackid
     JOIN chinook.albums aa
     ON t.albumid = aa.albumid
     JOIN chinook.artists a
     ON aa.artistid = a.artistid;

#12. Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.
     SELECT t.Name as Track, a.title as Album, m.Name as MediaType, g.Name as Genre
     FROM chinook.tracks t
     LEFT JOIN chinook.albums a
     ON t.AlbumId = a.AlbumId
     LEFT JOIN chinook.media_types m
     ON t.MediaTypeId = m.MediaTypeId
     LEFT JOIN chinook.genres g
     ON t.GenreId = g.GenreId;

#13. Show the total sales made by each sales agent.
     SELECT e.FirstName, e.LastName, Round(sum(i.Total), 2) as TotalSales
     FROM chinook.invoices i
     JOIN chinook.customers c
     ON i. CustomerId = c.CustomerId
     JOIN chinook.employees e
     ON c.SupportRepId = e.EmployeeId
     WHERE e.Title = 'Sales Support Agent'
     GROUP BY e.employeeid;

#14. Which sales agent made the most dollars in sales in 2009?
     SELECT e.FirstName, e.LastName, Round(sum(i.Total), 2) as TotalSales
     FROM chinook.invoices i
     JOIN chinook.customers c
     ON i. CustomerId = c.CustomerId
     JOIN chinook.employees e
     ON c.SupportRepId = e.EmployeeId
     WHERE e.Title = 'Sales Support Agent'
     AND i.InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'
     GROUP BY e.employeeid
     ORDER BY TotalSales DESC
     LIMIT 1;


#15. Find the total revenue by genre and list genre name and total revenue from highest to lowest revenue.
     SELECT g.Name as Genre_Name, ROUND(SUM(i.Total), 2) as Total_Revenue
     FROM chinook.invoices i
     JOIN chinook.invoice_items it
     ON i.InvoiceId = it.InvoiceId
     JOIN chinook.tracks t
     ON it.TrackId = t.TrackId
     JOIN chinook.genres g
     ON t.GenreId = g.GenreId
     GROUP BY g.name
     ORDER BY 2 DESC;

#16. List top 10 countries by number of sales in 2012.
     SELECT i.BillingCountry as Country, SUM(it.Quantity) as Total_Sales
     FROM chinook.invoices i
     JOIN chinook.invoice_items it
     ON i.InvoiceId = it.InvoiceId
     WHERE i.InvoiceDate LIKE '2012%'
     GROUP BY 1
     ORDER BY 2 DESC
     LIMIT 10;

#17. Find out top 5 songs by revenue in each playlist. List the track name, song revenue and playlist name.
     SELECT Track, Total_Revenue, Playlist, RN
     FROM
     (
     SELECT t.Name as Track, ROUND(SUM(i.Total),2) as Total_Revenue, p.Name as Playlist, 
            ROW_NUMBER() OVER (Partition by p.Name ORDER BY ROUND(SUM(i.Total),2) DESC) as RN
     FROM chinook.tracks t
     JOIN chinook.invoice_items it
     ON t.TrackId = it.TrackId
     JOIN chinook.invoices i
     ON it.InvoiceId = i.InvoiceId
     JOIN chinook.playlist_track pt
     ON t.TrackId = pt.TrackId
     JOIN chinook.playlists p
     ON pt.PlaylistId = p.PlaylistId
     GROUP BY 1
     )
     WHERE RN <= 5;

#18. Which media type is most sold in 2013?
     SELECT m.Name as Media_Type
     FROM chinook.media_types m
     JOIN chinook.tracks t
     ON m.MediaTypeId = t.MediaTypeId
     JOIN chinook.invoice_items it
     ON t.TrackId = it.TrackId
     JOIN chinook.invoices i
     ON it.InvoiceId = i.InvoiceId
     WHERE i.InvoiceDate LIKE '2013%'
     GROUP BY 1
     ORDER BY sum(Quantity) DESC
     LIMIT 1;

#19. List top 10 artists by number of tracks released in 2011.
     SELECT a.Name AS Artist, COUNT(DISTINCT t.TrackId) as Total_Tracks_Released_in_2011
     FROM chinook.tracks t
     JOIN chinook.albums al
     ON t.AlbumId = al.AlbumId
     JOIN chinook.artists a
     ON al.ArtistId = a.ArtistId
     JOIN chinook.invoice_items it
     ON t.TrackID = it.TrackId
     JOIN chinook.invoices i
     ON it.InvoiceId = i.InvoiceId
     WHERE i.InvoiceDate LIKE '2011%'
     GROUP BY 1
     ORDER BY 2 DESC
     LIMIT 10;


#20. List the customers by their total spending from highest to lowest. Include customer name, country and total spending.
     SELECT c.FirstName, c.LastName, c.Country, SUM(i.Total) as Total_Spent
     FROM chinook.customers c
     JOIN chinook.invoices i
     ON c.CustomerId = i.CustomerId
     GROUP BY c.CustomerId
     ORDER BY 4 DESC;
