cd C:\Users\HP\Downloads\sqlite-tools-win-x64-3490200
sqlite3 ..\..\Downloads\Chinook_Sqlite.sqlite
.schema
--1. Top 5 Countries by Total Sales
SELECT BillingCountry, SUM(Total) AS TotalSales  FROM Invoice  GROUP BY BillingCountry  ORDER BY TotalSales DESC  LIMIT 5;

--2. Average Sale Value per Customer 
SELECT CustomerId, AVG(Total) AS AverageSale  FROM Invoice GROUP BY CustomerId ORDER BY AverageSale DESC; 

--3. Customers Who Purchased More Than 5 Tracks
SELECT c.CustomerId, c.FirstName, c.LastName, COUNT(DISTINCT il.TrackId) AS TrackCount FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId GROUP BY c.CustomerId HAVING TrackCount > 5 ORDER BY TrackCount DESC;

--4. Find the Most Expensive Track
SELECT Name, UnitPrice FROM Track ORDER BY UnitPrice DESC LIMIT 1;

--5. List of Albums Purchased by Customers
SELECT a.Title, COUNT(il.InvoiceLineId) AS Purchases FROM Album a JOIN Track t ON a.AlbumId = t.AlbumId JOIN InvoiceLine il ON t.TrackId = il.TrackId GROUP BY a.Title ORDER BY Purchases DESC;

--6. Invoice Details with Track Names
SELECT i.InvoiceId, c.FirstName, c.LastName, t.Name AS TrackName, il.Quantity, il.UnitPrice FROM Invoice i JOIN Customer c ON i.CustomerId = c.CustomerId JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId JOIN Track t ON il.TrackId = t.TrackId ORDER BY i.InvoiceId, t.Name;

--7. Top 3 Artists by Total Sales
SELECT ar.Name AS Artist, SUM(il.Quantity * il.UnitPrice) AS TotalSales FROM Artist ar JOIN Album a ON ar.ArtistId = a.ArtistId JOIN Track t ON a.AlbumId = t.AlbumId JOIN InvoiceLine il ON t.TrackId = il.TrackId GROUP BY ar.ArtistId ORDER BY TotalSales DESC LIMIT 3;

--8. Find the Customer Who Made the Most Purchases
SELECT c.FirstName, c.LastName, COUNT(i.InvoiceId) AS Purchases FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId ORDER BY Purchases DESC LIMIT 1;

--9. Tracks with No Sales
SELECT t.Name FROM Track t LEFT JOIN InvoiceLine il ON t.TrackId = il.TrackId WHERE il.TrackId IS NULL;

--10. Total Sales by Media Type
SELECT m.Name AS MediaType, SUM(il.Quantity * il.UnitPrice) AS TotalSales FROM MediaType m JOIN Track t ON m.MediaTypeId = t.MediaTypeId JOIN InvoiceLine il ON t.TrackId = il.TrackId GROUP BY m.MediaTypeId ORDER BY TotalSales DESC;

--11. View: Average Sales by Customer
CREATE VIEW AvgSalesByCustomer AS SELECT CustomerId, AVG(Total) AS AvgSale FROM Invoice GROUP BY CustomerId;
SELECT * FROM AvgSalesByCustomer WHERE AvgSale > 50;


--12. Using Subquery: Customers with Highest Purchase
SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalSpent FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId HAVING TotalSpent > (SELECT AVG(Total) FROM Invoice);

--13. Find Most Purchased Track
SELECT t.Name, SUM(il.Quantity) AS TotalQuantity FROM Track t JOIN InvoiceLine il ON t.TrackId = il.TrackId GROUP BY t.TrackId ORDER BY TotalQuantity DESC LIMIT 1;

--14. Optimize Query Performance with Indexes
CREATE INDEX idx_customer_id ON Invoice(CustomerId)
CREATE INDEX idx_invoice_id ON InvoiceLine(InvoiceId);