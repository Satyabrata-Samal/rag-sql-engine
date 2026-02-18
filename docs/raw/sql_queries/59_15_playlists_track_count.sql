-- 15
-- playlists_track_count.sql
-- Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

USE Chinook
SELECT COUNT(*) as CountOfTracks, p.Name
FROM Playlist as p
JOIN PlaylistTrack as pt ON p.PlaylistId = pt.PlaylistId
JOIN Track as t ON t.TrackId = pt.TrackId
GROUP BY p.PlaylistId, p.Name