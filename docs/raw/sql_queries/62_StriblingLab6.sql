-- Lab 6: Subqueries
-- For all queries in this lab, the SQL query should contain a subquery unless specified otherwise.
-- Use the World database
use world; 

-- 1.  Write a select statement that uses a subquery that is equivalent to this Join query:
-- SELECT name, population 
-- FROM city
-- JOIN country 
-- ON city.countrycode =  country.code
-- WHERE country.name IN ('Zambia', 'Zimbabwe')


-- SELECT Name, Population 
-- FROM city
-- WHERE CountryCode IN (
--     SELECT Code 
--     FROM country 
--     WHERE Name IN ('Zambia', 'Zimbabwe')
-- );

-- 2. Write a report using a subquery that includes name and population for every city in the city table where Hindi is listed as one of the official spoken languages.
-- SELECT Name, Population 
-- FROM city
-- WHERE CountryCode IN (
--     SELECT CountryCode 
--     FROM countrylanguage 
--     WHERE Language = 'Hindi' AND IsOfficial = 'T'
-- );

-- 3. Write a query that uses a subquery to list the name and population of any city where Spanish is spoken by 25% or more of the population. 
-- SELECT Name, Population 
-- FROM city
-- WHERE CountryCode IN (
--     SELECT CountryCode 
--     FROM countrylanguage 
--     WHERE Language = 'Spanish' AND Percentage >= 25.0
-- );

-- 4. Write a report that displays all the names, populations, and countrycodes of all cities in Canada or the United States, (Country Codes CAN and USA), that have populations greater than the largest city in Switzerland country code (CHE). Use a subquery to accomplish this.
-- SELECT Name, Population, CountryCode 
-- FROM city
-- WHERE CountryCode IN ('CAN', 'USA')
-- AND Population > (
--     SELECT MAX(Population) 
--     FROM city 
--     WHERE CountryCode = 'CHE'
-- );

-- 5. Write a select statement that uses a subquery to display the name, surface area, and continent of any country not in Africa that is larger than the average surface area of the countries in Africa. 
-- SELECT Name, SurfaceArea, Continent 
-- FROM country
-- WHERE Continent != 'Africa'
-- AND SurfaceArea > (
--     SELECT AVG(SurfaceArea) 
--     FROM country 
--     WHERE Continent = 'Africa'
-- );

-- 6. Write a select statement that uses a subquery to display the name, continent, and population of all countries not in South America  that have a population greater than  any country in South America;
-- SELECT Name, Continent, Population 
-- FROM country
-- WHERE Continent != 'South America'
-- AND Population > ANY (
--     SELECT Population 
--     FROM country 
--     WHERE Continent = 'South America'
-- );

-- 7. Copy your query from number 6 and change the ANY keyword to ALL. Run the query. Explain briefly why this report has fewer rows. 
-- SELECT Name, Continent, Population 
-- FROM country
-- WHERE Continent != 'South America'
-- AND Population > ALL (
--     SELECT Population 
--     FROM country 
--     WHERE Continent = 'South America'
-- );
-- Switch to the chinook database

-- 8. Use the EXISTS operator to display the name and unitprice of all tracks that have a row in the invoiceline table. The book has a good explanation of the EXISTS keyword. 
-- SELECT Name, UnitPrice 
-- FROM track t
-- WHERE EXISTS (
--     SELECT 1 
--     FROM invoiceline il 
--     WHERE il.TrackId = t.TrackId
-- );
-- 9. Use a subquery in the FROM clause to display the artistId and length in minutes (milliseconds/60 rounded to 2 decmal places) of the longest album for each artistId. (Hint: the subquery should select the artistid, albumid and sum the milliseconds for all the tracks grouped by albumid.)
-- SELECT ArtistId, ROUND(MAX(album_length_minutes), 2) as longest_album_minutes
-- FROM (
--     SELECT a.ArtistId, a.AlbumId, 
--            SUM(t.Milliseconds)/60000.0 as album_length_minutes
--     FROM album a
--     JOIN track t ON a.AlbumId = t.AlbumId
--     GROUP BY a.ArtistId, a.AlbumId
-- ) album_lengths
-- GROUP BY ArtistId;

-- 10. Use a subquery to list all of the invoiceid, customerid, and total  from customers in Brazil. 

-- SELECT InvoiceId, CustomerId, Total 
-- FROM invoice
-- WHERE CustomerId IN (
--     SELECT CustomerId 
--     FROM customer 
--     WHERE Country = 'Brazil'
-- );

