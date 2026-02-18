-- Check tables within Chinook DB
SELECT name 
FROM sqlite_master 
WHERE type='table';

-- Albums with 12 or more tracks
SELECT AlbumID,
COUNT(TrackID) AS nTracks
FROM Track
GROUP BY AlbumID
HAVING nTracks >= 12;

----------------------------------------------------------------------
-- SUBQUERIES
----------------------------------------------------------------------
-- Subqueries are queries embedded inside other queries
-- Will always start with innermost query
SELECT * FROM Invoice;
SELECT * FROM Customer;

-- Return the names and id of customers who ordered from U countries
SELECT CustomerId, FirstName, LastName, Country
FROM Customer
WHERE Country IN (SELECT BillingCountry
                  FROM Invoice
                  WHERE BillingCountry LIKE 'U%');

-- Inner queries can only select one column
SELECT * FROM Playlist; 
-- PlaylistId, Name
SELECT * FROM PlaylistTrack;
-- PlaylistId, TrackID
SELECT * FROM Track;
-- TrackId, UnitPrice

-- All playlists containg a track that starts with letter B
SELECT PlaylistId, Name 
FROM Playlist
WHERE PlaylistId IN (SELECT PlaylistId 
                     FROM PlaylistTrack
                     WHERE (TrackId in (SELECT TrackId
                                        FROM Track
                                        WHERE Name LIKE 'B%')));

-- Name and region and total number of orders for each
-- Subqueries involving calculations are different

-- Return total amount spent with customer info
SELECT 
CustomerId,
FirstName,
LastName,
(SELECT SUM(Total) AS TotalSpent
                     FROM Invoice
                     GROUP BY CustomerId) AS TotalSpent, 
Country 
FROM Customer;

----------------------------------------------------------------------
-- JOINS
----------------------------------------------------------------------
/*Cartesian/Cross JOINS joins each row from the first table with
all the other rows of another. Does not match, only does said 
operation so only good for matrix math and finding combinations*/

SELECT EmployeeId, CustomerId
FROM Employee CROSS JOIN Customer;

-- INNER JOIN selects records that have matching values in both tables
SELECT Playlist.PlaylistId,
Playlist.Name, PlaylistTrack.TrackId
FROM Playlist INNER JOIN PlaylistTrack
ON Playlist.PlaylistId = PlaylistTrack.PlaylistId;

-- Can do the same thing but with aliases
SELECT pl.PlaylistId,
Name, TrackId
FROM Playlist AS pl, PlaylistTrack AS pt
WHERE pl.PlaylistId = pt.PlaylistId;

-- SELF JOINs self explanatory
-- The || ' ' || used to concatenate strings with a space in between
SELECT 
e1.FirstName || ' ' || e1.LastName AS EmployeeName,
e2.FirstName || ' ' || e2.LastName AS ManagerName
FROM Employee e1
LEFT JOIN Employee e2
ON e1.ReportsTo = e2.EmployeeId
ORDER BY EmployeeName;

-- sqlite is only capable of left joins..

-- INNER JOIN
-- list of album titles and unit prices for artist "Audioslave"
SELECT
UnitPrice,
artists.ArtistId AS Artist_Id,
tracks.AlbumId as Album_Id
FROM albums
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
WHERE Artist_Id IN (8);

-- Customers with no invoice
SELECT
FirstName,
LastName,
invoices.CustomerId AS Customer_Id,
InvoiceId
FROM customers
LEFT JOIN invoices
ON customers.CustomerId = invoices.CustomerId
WHERE InvoiceId LIKE 'N';

-- Total price of album
SELECT
Title,
tracks.AlbumId AS Album_Id,
SUM(UnitPrice) AS Total_Price
FROM albums
INNER JOIN tracks
ON tracks.AlbumId = albums.AlbumId
WHERE Title LIKE 'Big Ones';

-- Names of tracks for album 'Californication'
SELECT
Name,
Title
FROM Tracks
INNER JOIN Albums
ON Tracks.AlbumId = Albums.AlbumId
WHERE Title LIKE 'Californication';

-- Total number of invoices per customer
SELECT
FirstName,
LastName,
City,
Email,
COUNT(DISTINCT InvoiceId) AS Total_Invoices
FROM Customers
LEFT JOIN Invoices
ON Customers.CustomerId = Invoices.CustomerId
GROUP BY Customers.CustomerId;

-- Track name, album, artistID, 
-- and trackID for all albums
SELECT
Name,
Title,
ArtistId,
TrackId
FROM Tracks
INNER JOIN Albums
ON Tracks.AlbumId = Albums.AlbumId;

----------------------------------------------------------------------
-- STRING FUNCTIONS
----------------------------------------------------------------------

-- String concatenate using || ' ' ||
SELECT
FirstName || ' ' || LastName AS EmployeeName
FROM Employee;

-- TRIM, LTRIM, RTRIM
-- Removes spaces (or specified characters) from both ends
SELECT TRIM('   hello   ');
SELECT TRIM('---hello---', '-');

-- Removes spaces (or specified characters) from the right end
SELECT RTRIM('hello   ');             
SELECT RTRIM('hello---', '-');

-- Removes spaces (or specified characters) from the left end
SELECT LTRIM('   hello'); 
SELECT LTRIM('---hello', '-');

-- Substring SUBSTR(Name of str col, starting char, # of chars)
SELECT FirstName,
SUBSTR(FirstName, 1, 3)
FROM Employee;

-- UPPER and LOWER change case of string
SELECT UPPER('hello'); -- Returns HELLO
SELECT LOWER('HELLO'); -- Returns hello

/*DATE — 'YYYY-MM-DD' (e.g., '2025-08-09')
DATETIME — 'YYYY-MM-DD HH:MM:SS' (e.g., '2025-08-09 14:30:00')
TIMESTAMP — Often stored as 'YYYY-MM-DD HH:MM:SS.SSS'*/

-- STRFTIME To extract certain parts of a date and time string.

SELECT InvoiceDate,
STRFTIME('%Y', InvoiceDate) AS Year,
STRFTIME('%m', InvoiceDate) AS Month,
STRFTIME('%d', InvoiceDate) AS Day
FROM Invoice;

-- Tells the current date (wow!)
SELECT DATE('now');

-- Calculate employee's age from birthdate
SELECT BirthDate,
STRFTIME('%Y', BirthDate) AS Year,
STRFTIME('%m', BirthDate) AS Month,
STRFTIME('%d', BirthDate) AS Day,
STRFTIME(DATE('now')) - BirthDate AS Age 
FROM Employee

----------------------------------------------------------------------
-- CASE Statements
----------------------------------------------------------------------

-- Selects the following cols from Employee table with an additional
-- Calgary col showing Calgary or Other depending on city
SELECT
EmployeeId,
FirstName,
LastName,
City,
CASE City
    WHEN 'Calgary'
    THEN 'Calgary'
ELSE 'Other'
    END 'Calgary'
FROM Employee
ORDER BY LastName, FirstName;

-- Categorizes Tracks by small, med, large number of bytes
SELECT
TrackId,
Name,
Bytes,
CASE
    WHEN Bytes < 300000 THEN 'Small'
    WHEN Bytes BETWEEN 300001 AND 500000 THEN 'Medium'
    -- Can also repeat col name before number
    WHEN Bytes >= 500001 THEN 'Large'
    ELSE 'Other'
    END BytesCategory
FROM Track;


----------------------------------------------------------------------
-- Views
----------------------------------------------------------------------

-- Similar use as functions in R
CREATE VIEW my_view AS
SELECT





