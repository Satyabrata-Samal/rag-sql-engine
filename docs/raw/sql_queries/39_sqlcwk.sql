/*
@author Nurhanim Binti Rosly

This is an sql file to put your queries for SQL coursework. 
You can write your comment in sqlite with -- or /* * /

To read the sql and execute it in the sqlite, simply
type .read sqlcwk.sql on the terminal after sqlite3 chinook.db.
*/

/* =====================================================
   WARNNIG: DO NOT REMOVE THE DROP VIEW
   Dropping existing views if exists
   =====================================================
*/
DROP VIEW IF EXISTS vCustomerPerEmployee;
DROP VIEW IF EXISTS v10WorstSellingGenres ;
DROP VIEW IF EXISTS vBestSellingGenreAlbum ;
DROP VIEW IF EXISTS v10BestSellingArtists;
DROP VIEW IF EXISTS vTopCustomerEachGenre;

/*
============================================================================
Question 1: Complete the query for vCustomerPerEmployee.
WARNNIG: DO NOT REMOVE THE STATEMENT "CREATE VIEW vCustomerPerEmployee AS"

Write a SQLite query to create a view called vCustomerPerEmployee for each 
employees LastName,FirstName, EmployeeID, and the total number of customers 
served by them (named as TotalCustomer) as shown below
============================================================================
*/

CREATE VIEW vCustomerPerEmployee  AS

SELECT e.LastName, e.FirstName, EmployeeId, COUNT(SupportRepId) AS TotalCustomer
FROM employees e
LEFT JOIN customers ON SupportRepId = EmployeeId
GROUP BY EmployeeId, SupportRepId
;

/*
============================================================================
Question 2: Complete the query for v10WorstSellingGenres.
WARNNIG: DO NOT REMOVE THE STATEMENT "CREATE VIEW v10WorstSellingGenres AS"

Write a SQLite query to create a view called v10WorstSellingGenres for the 10 
worst-selling genres(named as Genre) based on the quantity of tracks sold (named
as Sales), order by Sales in ascending order.
============================================================================
*/

CREATE VIEW v10WorstSellingGenres  AS

SELECT g.Name AS Genre, COALESCE(SUM(qt), 0) AS Sales -- COALESCE to return 0 on NULL values
FROM (
    SELECT t.GenreId, SUM(ii.Quantity) AS qt
    FROM invoice_items ii
    LEFT JOIN tracks t ON ii.TrackId = t.TrackId
    GROUP BY t.GenreId
) AS subquery
RIGHT JOIN genres g ON g.GenreId = subquery.GenreId
GROUP BY g.Name
ORDER BY Sales ASC  -- In ascending order
LIMIT 10  -- Return only top 10 of the row
;

/*
============================================================================
Question 3:
Complete the query for vBestSellingGenreAlbum
WARNNIG: DO NOT REMOVE THE STATEMENT "CREATE VIEW vBestSellingGenreAlbum AS"

Write a SQLite query to create a view called vBestSellingGenreAlbum for the 
best-selling album in each genre with sales (based on the quantity of tracks 
sold, named as Sales) with the following named columns. 
============================================================================
*/

CREATE VIEW vBestSellingGenreAlbum AS

SELECT g.Name AS Genre, al.Title AS Album, ar.Name AS Artist, MAX(qt) AS Sales
FROM (
    SELECT t.TrackId, g.GenreId, t.AlbumId, al.Title, SUM(ii.Quantity) AS qt
    FROM invoice_items ii
    LEFT JOIN tracks t ON ii.TrackId = t.TrackId
    LEFT JOIN albums al ON al.AlbumId = t.AlbumId
    RIGHT JOIN artists ar ON ar.ArtistId = al.ArtistId
    RIGHT JOIN genres g ON g.GenreId = t.GenreId
    GROUP BY g.GenreId, al.Title
) AS subquery
LEFT JOIN tracks t ON subquery.TrackId = t.TrackId
LEFT JOIN albums al ON al.AlbumId = t.AlbumId
RIGHT JOIN artists ar ON ar.ArtistId = al.ArtistId
RIGHT JOIN genres g ON g.GenreId = t.GenreId
GROUP BY g.GenreId
HAVING MAX(qt) > 0 -- Exclude any Genre with Sales 0 
;

/*
============================================================================
Question 4:
Complete the query for v10BestSellingArtists
WARNNIG: DO NOT REMOVE THE STATEMENT "CREATE VIEW v10BestSellingArtists AS"

Write a SQLite query to create a view called v10BestSellingArtists for the 10 
best-selling artists based on the total quantity of tracks sold (named as 
TotalTrackSales) order by TotalTrackSalesin descending order as shown in the 
sample output in Figure 4. TotalAlbum is the number of albumswith tracks sold 
for each artist.
============================================================================
*/

CREATE VIEW v10BestSellingArtists AS

SELECT ar.Name AS Artist, COUNT(DISTINCT al.AlbumId) AS TotalAlbum, SUM(qt) AS TotalTrackSales
FROM (
    SELECT t.AlbumId, SUM(Quantity) AS qt
    FROM invoice_items ii
    LEFT JOIN tracks t ON ii.TrackId = t.TrackId
    GROUP BY t.AlbumId
) AS subquery
RIGHT JOIN albums al ON al.AlbumId = subquery.AlbumId
NATURAL JOIN artists ar
GROUP BY ar.Name
ORDER BY TotalTrackSales DESC  -- In descending order
LIMIT 10 -- To return only top 10 rows
;

/*
============================================================================
Question 5:
Complete the query for vTopCustomerEachGenre
WARNNIG: DO NOT REMOVE THE STATEMENT "CREATE VIEW vTopCustomerEachGenre AS" 

Write a SQLite query to create a view called vTopCustomerEachGenre for the
customer (named asTopSpender) that spent the most (based on quantity x unitprice,
named as TotalSpending) on each genre of music.

*Other customer with same TotalSpending in the same genre also acceptable.
============================================================================
*/

CREATE VIEW vTopCustomerEachGenre AS

SELECT g.Name AS Genre, c.FirstName || ' ' || c.LastName AS TopSpender, MAX(qt) AS TotalSpending -- Concatenation operator (||) for combining strings
FROM (
    SELECT t.TrackId, t.AlbumId, ii.InvoiceId, g.GenreId, i.CustomerId, ii.UnitPrice * SUM(ii.Quantity) AS qt
    FROM invoice_items ii
    LEFT JOIN tracks t ON t.TrackId = ii.TrackId
    RIGHT JOIN invoices i ON i.InvoiceId = ii.InvoiceId
    LEFT JOIN customers c ON c.CustomerId = i.CustomerId
    RIGHT JOIN genres g ON g.GenreId = t.GenreId
    GROUP BY g.GenreId, c.CustomerId
) AS subquery
LEFT JOIN tracks t ON t.TrackId = subquery.TrackId
RIGHT JOIN invoices i ON i.InvoiceId = subquery.InvoiceId
LEFT JOIN customers c ON c.CustomerId = i.CustomerId
RIGHT JOIN genres g ON g.GenreId = t.GenreId
GROUP BY g.Name
HAVING MAX(qt) > 0  -- To exclude customers with TotalSpending of 0 from rows
;

/*
To view the created views, use SELECT * FROM views;
You can uncomment the following to look at invididual views created
*/
--SELECT * FROM vCustomerPerEmployee;
--SELECT * FROM v10WorstSellingGenres ;
--SELECT * FROM vBestSellingGenreAlbum ;
--SELECT * FROM v10BestSellingArtists;
SELECT * FROM vTopCustomerEachGenre;

/* 
===========================
        REFERENCES 
===========================
Websites:
1. W3Schools. (n.d.). SQL JOIN. Retrieved March 14, 2023, 
    from https://www.w3schools.com/sql/sql_join.asp.
2. Tutorialspoint. (n.d.). How can MySQL COALESCE function 
    be used with MySQL SUM function to customize the output? Retrieved March 14, 2023, 
    from https://www.tutorialspoint.com/How-can-MySQL-COALESCE-function-be-used-with-MySQL-SUM-function-to-customize-the-output.
3. Ayush Jain (2020) SQL | Subquery. GeeksforGeeks. Available
    at: https://www.geeksforgeeks.org/sql-subquery/ (Accessed: 14 March 2023).
4. SQL Shack. (2021, June 22). Understanding the SQL SUM function and its use cases.
    Retrieved from https://www.sqlshack.com/understanding-the-sql-sum-function-and-its-use-cases/

*/