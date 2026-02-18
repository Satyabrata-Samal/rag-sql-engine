
/* 
---Querying Digital Media Data--- 

This project uses SQL queries to access and manipulate the database for a digital media store,
which includes tables for artists, albums, media tracks.

Database Used: Chinook MySQL Database 
Access Database at:
https://github.com/lerocha/chinook-database/blob/master/ChinookDatabase/DataSources/Chinook_MySql.sql 

*/


/* Retrieve all the columns from the Tracks table, but only return 20 rows. */

Select * From track Limit 20;

/* How many albums does the artist Led Zeppelin have? */

select count(album.AlbumId) as total_album, album.ArtistId from album
inner join artist
on  album.ArtistId = artist.ArtistId
where Name = 'Led Zeppelin';

/* Create a list of album titles and the unit prices for the artist "Aerosmith". */

Select album.Title, track.UnitPrice from track
inner join album on track.AlbumId = album.AlbumId
inner join artist on album.ArtistId = artist.ArtistId
where artist.Name = 'Aerosmith';

/* Find the names of all the tracks for the album "Californication". */

select name from track
where AlbumId = (select AlbumId from album where title = 'Californication');

/* Retrieve the track name, album, artistID, and trackID for all albums.*/

select track.Name, track.AlbumId, album.Title, album.ArtistId, track.TrackId from track
inner join album
on track.AlbumId = album.AlbumId;

/* Find the name and ID of the artists who do not have albums.*/

select artist.ArtistId, artist.Name from artist
left join album
on artist.ArtistId = album.ArtistId
where album.AlbumId is null;

