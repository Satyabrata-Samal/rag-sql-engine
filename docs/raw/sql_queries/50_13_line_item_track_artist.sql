-- 13 
-- line_item_track_artist.sql 
-- Provide a query that includes the purchased track name AND artist name with each invoice line item.

USE Chinook
SELECT i.*, t.Name AS TrackName, ar.Name AS ArtistName
FROM Track as t--InvoiceLine AS i
JOIN InvoiceLine AS i ON t.TrackId = i.TrackId
JOIN Album as al ON t.AlbumId = al.AlbumId
JOIN Artist as ar ON al.ArtistId = ar.ArtistId
