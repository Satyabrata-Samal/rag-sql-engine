/*
---------------------------------------------------------------------------------------------------------------------------------------------
 Chinook is a sample relational database often used for educational and demonstration purposes in the field of database management and SQL.
 This database is designed to represent a simplified digital media store.
 The Chinook database contains tables that model various aspects of a music store, such as customers,
 employees, invoices, tracks, albums, genres, and artists.
 The database allows users to explore relationships between entities, practice complex queries,
 and gain hands-on experience in managing data within a relational database environment.
 --------------------------------------------------------------------------------------------------------------------------------------------
 */


 /* List of Queries to be performed
 --------------------------------------------------------------------------------------------------------------------------------------------
 Certainly! Here are some additional real-life queries and tasks related to the Chinook database, covering various SQL concepts:

### 1. **Basic Queries:**
   - Retrieve all tracks from the "Tracks" table with their names and durations.
   - Find the top 10 customers who made the most purchases.
   - List all albums and their total sales.
   - Count the number of distinct composers in the database.

### 2. **Joins and Aggregations:**
   - Display a list of customers with their total purchase amount, including those who have not made any purchases.
   - List all tracks with their names, genres, and media types.
   - Find the average invoice total for each country.
   - Retrieve a list of albums along with the total number of tracks in each.

### 3. **Subqueries and Filtering:**
   - Identify customers who have purchased tracks by a specific artist.
   - List tracks that are longer than the average duration of all tracks.
   - Find customers who have made more than one purchase.
   - Display invoices with a total greater than the highest individual track price.

### 4. **Window Functions and Ranking:**
   - Rank customers based on the number of tracks they have purchased.
   - Calculate the cumulative sum of sales for each month.
   - Rank genres based on their total sales.
   - Determine the highest-selling track for each album.

### 5. **Stored Procedures and Updates:**
   - Create a stored procedure to add a new customer to the database.
   - Implement a stored procedure to update the price of tracks in a specific genre.
   - Design a stored procedure to delete a customer and associated invoices.
   - Create a stored procedure to calculate the average track duration for a given album.

### 6. **Advanced Queries:**
   - Identify customers who have not made a purchase in the last six months.
   - List the top 5 artists with the most tracks in the database.
   - Calculate the percentage of total sales contributed by each customer.
   - Find the correlation between the length of tracks and their popularity (number of times purchased).
------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

-- Query 1: Retrieve all information from the "Customers" table.

 SELECT *
 FROM CUSTOMER;

 --Query 2: List all unique genres from the "Tracks" table.

 SELECT T.NAME AS TRACKNAME,G.NAME AS "GENRE"
 FROM TRACK T
 JOIN GENRE G
	ON G.GenreId = T.GenreId;

-- Query 3: Count the total number of albums in the "Albums" table.

SELECT COUNT(DISTINCT ALBUMID) AS "COUNT"
FROM ALBUM;

--Query 4: Find the customer with the highest total purchase amount.

SELECT TOP 1 C.FIRSTNAME +' '+ C.LASTNAME AS NAME,I.TOTAL AS COST
FROM CUSTOMER C
JOIN INVOICE I
	ON I.CUSTOMERID = C.CustomerId
ORDER BY COST DESC;

-- Query 5: List all tracks and their total sales.

--TBC

--SELECT T.NAME
--FROM TRACK T
--JOIN InvoiceLine I
--	ON T.TrackId=I.TrackId;


-- Query 7: Retrieve a list of all invoices with customer details.

SELECT C.FIRSTNAME +' '+ C.LASTNAME AS NAME,C.Country,C.Email,I.InvoiceId,I.InvoiceDate
FROM Customer C
JOIN Invoice I
	ON I.CustomerId=C.CustomerId;

-- Query 8: List all tracks with their names, album titles, and artist names.

SELECT T.NAME AS TRACK,A.Title AS ALBUM,AA.Name AS ARTIST
FROM Track T
JOIN Album A
	ON A.AlbumId = T.AlbumId
JOIN Artist AA
	ON AA.ArtistId = A.AlbumId;

-- Query 9: Find the average invoice total for each country.

SELECT AVG(I.Total) AS AVERAGE,I.BillingCountry AS COUNTRY
FROM Invoice I
GROUP BY I.BillingCountry;

-- Query 10: Retrieve a list of albums along with the total number of tracks in each.

SELECT A.Title,T.AlbumId,COUNT(T.TrackId) AS 'NO OF TRACKS'
FROM TRACK T
JOIN ALBUM A
	ON A.AlbumId=T.AlbumId
GROUP BY T.AlbumId,A.Title;

-- Query 11: Identify customers who have purchased tracks by a specific artist.

SELECT CustomerID,
    FirstName + ' ' + LastName AS CustomerName,
    Email
FROM
    Customer
WHERE 
	CustomerId IN (
		SELECT DISTINCT
		C.CustomerId
		FROM
		Customer C,
		Invoice I,
		InvoiceLine IL,
		Track T,
		Album A,
		Artist AR
		WHERE
			C.CustomerId = I.CustomerId AND
			I.InvoiceId = IL.InvoiceId AND
			IL.TrackId = T.TrackId AND
			T.AlbumId = A.AlbumId AND
			A.AlbumId = AR.ArtistId AND
			AR.Name = 'Aerosmith'
			
		);

-- Query 12: List tracks that are longer than the average duration of all tracks.

SELECT NAME,Milliseconds
FROM TRACK
WHERE Milliseconds > (SELECT AVG(MILLISECONDS) FROM TRACK);

-- Query 13: Find customers who have made more than one purchase.

SELECT CustomerId, COUNT(CustomerId) AS 'COUNT'
FROM Invoice
GROUP BY CUSTOMERID
HAVING COUNT(CustomerId)>1;

-- Query 14: Display invoices with a total greater than the highest individual track price.

SELECT * 
FROM Invoice
WHERE TOTAL > (SELECT MAX(UnitPrice) FROM InvoiceLine);

-- Query 15: Identify the artist who has the most albums.

SELECT TOP 1
    ar.ArtistID,
    ar.Name AS ArtistName,
    COUNT(DISTINCT al.AlbumID) AS AlbumCount
FROM
    Artist ar
JOIN
    Album al ON ar.ArtistID = al.ArtistID
GROUP BY
    ar.ArtistID, ar.Name
ORDER BY
    AlbumCount DESC;

-- Query 16: Rank customers based on the number of tracks they have purchased.

SELECT CustomerId, COUNT(CustomerId) AS 'COUNT'
FROM Invoice
GROUP BY CUSTOMERID
ORDER BY COUNT DESC;

-- Query 17: Calculate the cumulative sum of sales for each month.

SELECT MONTH(InvoiceDate),SUM(TOTAL) 
FROM Invoice
GROUP BY MONTH(InvoiceDate);

-- Query 18: Rank genres based on their total sales.

