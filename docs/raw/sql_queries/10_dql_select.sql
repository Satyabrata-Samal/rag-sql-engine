USE `Chinook`;

SELECT c.Country, a.Title AS Album, COUNT(il.TrackId) AS Ventas
FROM InvoiceLine il
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album a ON t.AlbumId = a.AlbumId
WHERE i.InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY c.Country, a.AlbumId
ORDER BY c.Country, Ventas DESC;

SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalGastado
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING TotalGastado > 40;

SELECT g.Name AS Genero, COUNT(il.TrackId) AS Ventas
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.GenreId
ORDER BY Ventas DESC
LIMIT 5;

SELECT c.FirstName, c.LastName, COUNT(il.TrackId) AS CancionesCompradas
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY c.CustomerId;

SELECT c.FirstName, c.LastName
FROM Customer c
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId AND i.InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

SELECT ar.Name AS Artista, COUNT(il.TrackId) AS VentasTotales
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.ArtistId;

SELECT e.FirstName, e.LastName, SUM(i.Total) AS TotalVentas
FROM Employee e
JOIN Customer c ON e.EmployeeId = c.SupportRepId
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY e.EmployeeId;

SELECT c.Country, c.FirstName, c.LastName, COUNT(i.InvoiceId) AS Compras
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country, c.CustomerId
ORDER BY c.Country, Compras DESC;

SELECT DATE(i.InvoiceDate) AS Fecha, COUNT(il.TrackId) AS CancionesVendidas
FROM Invoice i
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
WHERE MONTH(i.InvoiceDate) = 6 AND YEAR(i.InvoiceDate) = YEAR(CURDATE())  -- Cambia el mes y año según sea necesario
GROUP BY Fecha;

SELECT c.FirstName, c.LastName, i.InvoiceDate AS FechaCompra
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
ORDER BY i.InvoiceDate DESC
LIMIT 5;

SELECT AVG(il.UnitPrice) AS PrecioPromedio
FROM InvoiceLine il;

SELECT t.Name AS Cancion, il.UnitPrice
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
ORDER BY il.UnitPrice DESC
LIMIT 1;

SELECT t.Name AS Cancion, il.UnitPrice
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
ORDER BY il.UnitPrice ASC
LIMIT 1;

SELECT c.FirstName, c.LastName, COUNT(il.TrackId) AS CancionesRockCompradas
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY c.CustomerId
ORDER BY CancionesRockCompradas DESC
LIMIT 5;

SELECT a.Title AS Album, SUM(t.Milliseconds) AS DuracionTotal
FROM Album a
JOIN Track t ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId;

SELECT e.FirstName, e.LastName, SUM(i.Total) AS VentasTotales
FROM Employee e
JOIN Customer c ON e.EmployeeId = c.SupportRepId
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY e.EmployeeId
ORDER BY VentasTotales DESC;

SELECT c.FirstName, c.LastName, COUNT(il.TrackId) AS CancionesCompradas
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY c.CustomerId
ORDER BY CancionesCompradas DESC
LIMIT 1;

SELECT a.Title AS Album, COUNT(il.TrackId) AS CancionesVendidas
FROM Album a
JOIN Track t ON a.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
WHERE i.InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY a.AlbumId
ORDER BY CancionesVendidas DESC;

SELECT YEARWEEK(i.InvoiceDate) AS Semana, COUNT(il.TrackId) AS CancionesVendidas
FROM Invoice i
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
WHERE i.InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY Semana;

SELECT g.Name AS Genero
FROM Genre g
LEFT JOIN Track t ON g.GenreId = t.GenreId
LEFT JOIN InvoiceLine il ON t.TrackId = il.TrackId
LEFT JOIN Invoice i ON il.InvoiceId = i.InvoiceId AND i.InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
WHERE i.InvoiceId IS NULL
LIMIT 1;





