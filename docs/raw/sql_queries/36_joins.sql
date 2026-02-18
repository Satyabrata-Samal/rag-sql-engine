--INNER JOIN: Selects all rows from both tables that have a matching common key.
--LEFT JOIN: Uses all rows of the table on the left side and finds matching rows from the table on the right side.
--RIGHT JOIN: Uses all rows of the table on the right side and finds matching rows from the table on the left side.
--FULL JOIN: Combines all rows from both tables.


/*
 * Join Types
 * 		- INNER 
 * 			+ FULL
 * 			+ RIGHT
 * 			+ LEFT
 * 
 * 		- OUTER 
 * 			+ FULL
 * 			+ RIGHT
 * 			+ LEFT
 * 		
 * 		- SELF
 * 
 * 		- CROSS
 * 
 * -----------------------------
 * 
 * 		- Theta Joins (when your ON clause uses an arbitrary comparison <, >, >=, <= etc
 *  		- Equi Joins (theta joins that uses the equality operator (=)
 * 				- Natural join (the join occurs on a column whose name is shared between both tables - lets us do USING)
 */

SELECT * FROM "Artist";
SELECT * FROM "Album";
SELECT * FROM "Employee";


-- INNER JOIN
-- we will use "nicknames" for each table-- the INNER JOIN sleects all rows from both participating
SELECT alb."AlbumId", alb."Title", art."Name" AS artist
	FROM "Album" alb
	JOIN "Artist" art 
	ON alb."ArtistId" = art."ArtistId";

-- NATURAL INNER JOIN
-- the two tables being joined share a column with the exact same name
SELECT alb."AlbumId", alb."Title", art."Name" AS artist
	FROM "Album" alb
	JOIN "Artist" art 
	USING("ArtistId");


-- SELF JOINS
-- joining on another record within the same table
SELECT e1."FirstName", e1."LastName", e1."Title", e2."FirstName" AS boss_fn, e2."LastName" AS boss_ln, e2."Title" AS boss_title
	FROM "Employee" e1
	JOIN "Employee" e2
	ON e1."ReportsTo" = e2."EmployeeId";

-- create VIEW to simplify 
CREATE VIEW employee_relations AS
SELECT e1."FirstName", e1."LastName", e1."Title", e2."FirstName" AS boss_fn, e2."LastName" AS boss_ln, e2."Title" AS boss_title
	FROM "Employee" e1
	JOIN "Employee" e2
	ON e1."ReportsTo" = e2."EmployeeId";

SELECT * FROM employee_relations;

-- Multi-Table Joins (x3)
SELECT 
	t."Name" AS track_name,
	alb."Title" AS album_title,
	art."Name" AS artist_name
FROM "Track" t 
JOIN "Album" alb
USING ("AlbumId")
JOIN "Artist" art
USING ("ArtistId")
ORDER BY artist_name DESC;

SELECT * FROM "Track";
SELECT * FROM "InvoiceLine";


-- LEFT -JOIN
SELECT a."TrackId", a."Name", a."Composer" , b."InvoiceLineId", b."InvoiceId" 
FROM "Track" AS a 
LEFT JOIN "InvoiceLine" AS b 
ON a."TrackId" = b."TrackId";
-- If there are are left side values with no matching rows on the right, then a null value will fill

-- https://towardsdatascience.com/sql-join-8212e3eb9fde


SELECT * FROM chinook."Genre";


-- Subqueries / nested queries

-- we will use a subquery to find all genres that start with R
-- and their genre ID is greater than 6
-- shout out to Thinh!
SELECT r_genres.*
	FROM (
		SELECT * FROM "Genre"
			WHERE "Name" LIKE 'R%'
	) AS r_genres
WHERE r_genres."GenreId" > 6;

-- where the length of the name < 6

-- further nest this query
SELECT r_less_than_6id.*
	FROM 
	( SELECT r_genres.*
		FROM (
			SELECT * FROM "Genre"
				WHERE "Name" LIKE 'R%'
		) AS r_genres
	WHERE r_genres."GenreId" > 6) AS r_less_than_6id
	
WHERE LENGTH("Name") < 7;

	
	



















