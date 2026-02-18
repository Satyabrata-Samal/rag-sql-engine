-- Projet Chinook SQL : Rapports ventes automatisés, KPI par produit/agent
-- Auteur : Adam (2024)

-- 1. Clients non américains
SELECT CustomerId, FirstName || ' ' || LastName AS FullName, Country
FROM Customer
WHERE Country <> 'USA';

-- 2. Clients brésiliens
SELECT CustomerId, FirstName || ' ' || LastName AS FullName, Country
FROM Customer
WHERE Country = 'Brazil';

-- 3. Factures des clients brésiliens
SELECT c.FirstName || ' ' || c.LastName AS Client, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE c.Country = 'Brazil';

-- 4. Agents de vente
SELECT EmployeeId, FirstName || ' ' || LastName AS Agent, Title
FROM Employee
WHERE Title = 'Sales Support Agent';

-- 5. Pays uniques dans les factures
SELECT DISTINCT BillingCountry
FROM Invoice;

-- 6. Factures par agent de vente
SELECT e.FirstName || ' ' || e.LastName AS Agent, i.InvoiceId
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent';

-- 7. Détails des factures
SELECT i.InvoiceId, i.Total, c.FirstName || ' ' || c.LastName AS Client, i.BillingCountry, e.FirstName || ' ' || e.LastName AS Agent
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId;

-- 8. Ventes par année (2009 et 2011)
SELECT strftime('%Y', InvoiceDate) AS Annee, COUNT(*) AS NbFactures, SUM(Total) AS TotalVentes
FROM Invoice
WHERE strftime('%Y', InvoiceDate) IN ('2009', '2011')
GROUP BY Annee;

-- 9. Nombre d'articles pour la facture 37
SELECT COUNT(*) AS NbArticles
FROM InvoiceLine
WHERE InvoiceId = 37;

-- 10. Nombre d'articles par facture
SELECT InvoiceId, COUNT(*) AS NbArticles
FROM InvoiceLine
GROUP BY InvoiceId;

-- 11. Nom des morceaux pour chaque ligne de facture
SELECT il.InvoiceLineId, t.Name AS Morceau
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId;

-- 12. Morceaux et artistes pour chaque ligne de facture
SELECT il.InvoiceLineId, t.Name AS Morceau, ar.Name AS Artiste
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId;

-- 13. Nombre de factures par pays
SELECT BillingCountry, COUNT(*) AS NbFactures
FROM Invoice
GROUP BY BillingCountry;

-- 14. Nombre de morceaux par playlist
SELECT p.Name AS Playlist, COUNT(pt.TrackId) AS NbMorceaux
FROM Playlist p
LEFT JOIN PlaylistTrack pt ON p.PlaylistId = pt.PlaylistId
GROUP BY p.PlaylistId;

-- 15. Liste des morceaux (sans ID)
SELECT t.Name AS Morceau, al.Title AS Album, mt.Name AS MediaType, g.Name AS Genre
FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN MediaType mt ON t.MediaTypeId = mt.MediaTypeId
JOIN Genre g ON t.GenreId = g.GenreId;

-- 16. Factures et nombre d'articles par facture
SELECT i.InvoiceId, i.InvoiceDate, COUNT(il.InvoiceLineId) AS NbArticles
FROM Invoice i
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY i.InvoiceId;

-- 17. Ventes totales par agent de vente
SELECT e.FirstName || ' ' || e.LastName AS Agent, SUM(i.Total) AS TotalVentes
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
GROUP BY e.EmployeeId
ORDER BY TotalVentes DESC;

-- 18. Meilleur agent de 2009
SELECT e.FirstName || ' ' || e.LastName AS Agent, SUM(i.Total) AS TotalVentes
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
WHERE strftime('%Y', i.InvoiceDate) = '2009'
GROUP BY e.EmployeeId
ORDER BY TotalVentes DESC
LIMIT 1;

-- 19. Meilleur agent de 2010
SELECT e.FirstName || ' ' || e.LastName AS Agent, SUM(i.Total) AS TotalVentes
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
WHERE strftime('%Y', i.InvoiceDate) = '2010'
GROUP BY e.EmployeeId
ORDER BY TotalVentes DESC
LIMIT 1;

-- 20. Meilleur agent global
SELECT e.FirstName || ' ' || e.LastName AS Agent, SUM(i.Total) AS TotalVentes
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
GROUP BY e.EmployeeId
ORDER BY TotalVentes DESC
LIMIT 1;

-- 21. Nombre de clients par agent de vente
SELECT e.FirstName || ' ' || e.LastName AS Agent, COUNT(c.CustomerId) AS NbClients
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId
GROUP BY e.EmployeeId;

-- 22. Ventes totales par pays
SELECT BillingCountry, SUM(Total) AS TotalVentes
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalVentes DESC;

-- 23. Morceau le plus acheté en 2013
SELECT t.Name AS Morceau, COUNT(il.InvoiceLineId) AS NbAchats
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
WHERE strftime('%Y', i.InvoiceDate) = '2013'
GROUP BY t.TrackId
ORDER BY NbAchats DESC
LIMIT 1;

-- 24. Top 5 des morceaux les plus achetés
SELECT t.Name AS Morceau, COUNT(il.InvoiceLineId) AS NbAchats
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY t.TrackId
ORDER BY NbAchats DESC
LIMIT 5;

-- 25. Top 3 des artistes les plus vendus
SELECT ar.Name AS Artiste, COUNT(il.InvoiceLineId) AS NbVentes
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.ArtistId
ORDER BY NbVentes DESC
LIMIT 3;

-- 26. Type de média le plus acheté
SELECT mt.Name AS MediaType, COUNT(il.InvoiceLineId) AS NbAchats
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN MediaType mt ON t.MediaTypeId = mt.MediaTypeId
GROUP BY mt.MediaTypeId
ORDER BY NbAchats DESC
LIMIT 1;

-- 27. Vue pour automatiser le rapport ventes par produit (dernier trimestre)
CREATE VIEW RapportVentesDernierTrimestre AS
SELECT t.Name AS Produit,
       SUM(il.UnitPrice * il.Quantity) AS TotalVentes
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
WHERE i.InvoiceDate >= date('now', '-3 months')
GROUP BY t.TrackId; 