-- 16
-- tracks_no_id.sql
-- Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

USE Chinook
SELECT  t.Name,
        t.Composer,
        t.Milliseconds,
        t.Bytes,
        t.UnitPrice,
        al.Title as AlbumName,
        mt.Name as MediaType,
        g.Name as Genre
FROM Track as t
JOIN Album as al ON t.AlbumId = al.AlbumId
JOIN MediaType as mt ON t.MediaTypeId = mt.MediaTypeId
JOIN Genre as g ON t.GenreId = g.GenreId