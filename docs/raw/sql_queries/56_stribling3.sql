-- Andrew Stribling 07.09.2025 
-- Insert your name and the date you started on this as a comment above this line.

-- Use the world database to run the next few queries. 

-- 1. For every country in the database list the country code of the country, name of the country, the population, and every language that is listed for the country, sort your report by the name of the country (A-Z).
-- Note that the tables are joined by two columns that have different names. 

-- USE world;
-- SELECT Code, Name, Population, Language
-- FROM world.country 
-- INNER JOIN  world.countrylanguage
-- ON world.country.Code = countrylanguage.CountryCode
-- ORDER BY Code, Name, Population, Language DESC; 

-- 2. For every city in the database, list the city name, and the population. Also list the name of the country that the city is in, and the continent. Note that both the country name and the city name have the same column names, you will therefore need to qualify your names in the select statement of your report. 
-- USE World; 
-- SELECT city.Name,city.Population,country.Name
-- FROM world.city
-- INNER JOIN world.country
-- ON city.countrycode = country.code;

-- SELECT Name, Population
-- 3. Many countries have more than one language. For this report just show the official language for each country. 
-- Show the country code of the country, the name of the country, the population, and the official language, sort your report by the name of the country (A-Z). 
-- Some countries have more thant one official language. Often there are flags in database tables that are used to determine things like who are the captains of teams, or what the official language(s) of a country are. 
-- Look at the columns in the tables and find the flag and how the flag is set up, and don't forget to JOIN the tables properly. 

-- SELECT country.code, country.name, country.population, countrylanguage.Language
-- FROM world.country
-- INNER JOIN world.countrylanguage
-- ON country.code = countrylanguage.CountryCode
-- WHERE countrylanguage.IsOfficial='T' 
-- ORDER BY country.Name ASC; 

-- 4. Generate a report that lists every city whose name starts with an "A" . List the name of the city, the name of the country that the city is in, and the continent that the city is on. 
-- As in question3 you will need to qualify the names of the city and the country in the select statement and don't forget to JOIN the tables properly.

-- SELECT city.name, country.name, country.continent
-- FROM world.city
-- INNER JOIN world.country 
-- ON city.countrycode = country.code
-- WHERE city.name LIKE 'A%'; 

-- 5. List every city where Spanish is reported as a spoken language in the databse. 
-- List the name of the city,  the city's country code, the name of the language, and percentage of people reported as speaking Spanish. 
-- Even though you don't require data from the Country table for the report, you still must use the country table to produce the report correctly. 
-- Don't forget to JOIN the tables properly. Sort the report by highest to lowest percentage of Spanish speakers.  
-- Remember that the country table is joined to the other tables by column called "code", this data is stored in the other tables as "countrycode". 
-- Remember that "ambigous" errors only mean that the name of an object exitst in more than one table, and you only need to qualify the object name to fix this!

-- SELECT city.name, city.CountryCode, countrylanguage.Language, countrylanguage.Percentage
-- FROM world.city
-- INNER JOIN world.country 
-- ON city.CountryCode = country.Code
-- INNER JOIN world.countrylanguage
-- ON country.code = countrylanguage.CountryCode
-- WHERE countrylanguage.language = 'Spanish'
-- ORDER BY countrylanguage.Percentage DESC;

-- 6. Write a report for each country in North America where it is reported that more than half (>50) of the population speaks Spanish as noted in the percentage column. 
-- List the name of the country, the name of the language, the continent, and the percentage of the Spanish speaking population. 
-- Sort the report by percentage, (Z-A), and within the percentage by the name of the country (A-Z).

-- SELECT country.Name, countrylanguage.Language, country.Continent, countrylanguage.Percentage
-- FROM world.country
-- INNER JOIN world.countrylanguage
-- ON country.Code = countrylanguage.CountryCode
-- WHERE countrylanguage.Percentage > 50 AND country.Continent = 'North America'
-- ORDER BY countrylanguage.Percentage AND country.Name ASC; 


-- 7. Write a report that gets information regarding Africa from all three tables. 
-- For this report the request is to list the name of each of city, the population of each city, the name of the country the city is in, the region of that country, and the name of any language you might encounter in that city. 
-- You will notice in this report that each city might be listed more than once, this is because more than one language is spoken in the country that the city is in. 
-- Don't forget to join the tables properly, and remember that "ambiguous" errors are easy to fix, just qualify the column names with the table name. 
-- Sort your report by the name of the country (A-Z) and within each country by language (A-Z).

-- SELECT city.Name, city.Population, country.Name, country.Region, countrylanguage.Language
-- FROM world.city 
-- INNER JOIN world.country
-- ON city.CountryCode = country.Code
-- INNER JOIN world.countrylanguage
-- ON country.Code = countrylanguage.CountryCode
-- ORDER BY country.Name, countrylanguage.Language ASC; 

-- 8. Notice that in this database cities are grouped in "districts" not states. This is because many countries don't have states, they have provinces or some other subdivisions. 
-- Write a report that shows all the cities in the world that start with "S",
--  where Spanish is the official language and only list cities that are the capital of its country. 
-- Include the name of the city, 
-- the population of the city, 
-- the name of the country, 
-- the population of the country, 
-- the district the city is in, 
-- and the official language. 

-- Notice the column in the country table called capital. This is how the database lists the capital of each country so the join between city and country tables will need two conditions. 
-- Also remember that the IsOfficial flag in the countrylanguage table is either true, or false, ("T" or "F")"

-- SELECT ci.Name AS CityName, ci.Population AS CityPopulation, co.Name AS CountryName, co.Population AS CountryPopulation, ci.District, cl.Language
-- FROM world.city ci
-- INNER JOIN world.country co ON ci.CountryCode = co.Code AND ci.ID = co.Capital
-- INNER JOIN world.countrylanguage cl ON co.Code = cl.CountryCode
-- WHERE ci.Name LIKE 'S%' 
-- AND cl.Language = 'Spanish' 
-- AND cl.IsOfficial = 'T';

-- Switch to the sakila database. This database lists movies and rentals for videotapes that people used to rent from a store. This really was the way it was done! 
/* 9. This database contains an example of a many to many relationship. There are many actors in the world, and many films. 
A film has more than one actor and an actor can be in more than one film. Notice that there are 3 tables in the database that show this relationship. 
A table named "film" that describes each movie. 
A table named "actor" that describes each person that works as an actor. 
A table named "film_actor" that bridges the many to many relationship between movies and actors. 

Write a report that shows the title of each movie, 
as well ast first name and last name of any actor that appears in that movie.  
To do this you must join the actor table to the film_actor table and  film table to the film_actor table. 
Sort your report by the name of the film (AZ) and within each film by the last_name of the actor (A-Z). */ 

-- use sakila; 
-- SELECT f.title, a.first_name, a.last_name
-- FROM  sakila.film AS f
-- INNER JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
-- INNER JOIN sakila.actor a ON fa.actor_id = a.actor_id 
-- ORDER BY f.title ASC, fa.last_name ASC;

-- 
-- 10. Write a report that displays the the title of each movie, 
-- the first and last names of any actors that are in the movie, 
-- the descripion of the movie, 
-- and the name of the category of the movie. 
-- Only include movies with a description that contains the word "boring". Sort the report by movie title and within each movie by the last name of the actor. 
-- Note that each film has a category_id stored in the film_category bridge table and the name of the category is stored in the category table. 
-- So you will be joining 5 tables in your sql statement in order to retrieve the information. 

-- 
-- ASK THOMAS HOW TO BREAK DOWN THIS QUESTION BECAUSE I DONT UNDERSTAND THE INSTRUCTIONS 

-- USE sakila; 
-- SELECT f.title, a.first_name, a.last_name, f.description, c.name 
-- FROM film AS f
-- INNER JOIN film_actor AS fa ON f.film_id = fa.film_id
-- INNER JOIN actor AS a ON fa.actor_id = a.actor_id
-- INNER JOIN film_category AS fc ON f.film_id = fc.film_id   
-- INNER JOIN category AS c ON fc.category_id = c.category_id
-- WHERE f.description LIKE '%boring%'
-- ORDER BY f.title, a.last_name ASC; 

-- TESTCASE: WHERE f.title = 'AMADEUS HOLY'; 


-- 11. There are two stores that rent movies in this database. A report is needed that lists if a particular title is at one store only, or at both stores. 
-- For this report all that is needed is the store id and film id. 
-- The best way to accomplish this, is to join the inventory table to itself. 
-- Look at the inventory table of the SAKILA database, you will notice that multiple copies of the same movie will be for sale at one store or both stores. 
-- We only need to list the film id one time for each store that has the film. (Remember the distinct clause from lab 2). 
-- There is a good example of this type of query on page 122 of the book, but for this report you will need this hint. film_id = film_id and inventory_id <> inventory_id.  Sort the report by the film id smallest to largest. 

-- FIRST I NEED TO SPECIFY WHAT TO TARGET. 
-- inventory means dvd for one recorded 

-- SELECT * FROM inventory; 
-- SELECT DISTINCT i1.store_id, i1.film_id 
-- FROM inventory AS i1
-- INNER JOIN inventory i2 ON i1.inventory_id <> i2.inventory_id AND i1.film_id = i2.film_id
-- ORDER BY i1.film_id ASC;

-- 12. There are times when a report requires all of the contents from one table and, if there are matching records in a second table, display some information from the second table. 
-- This is called a LEFT JOIN. In the ex table there is a list of employees stored in the employee table, and a list of projects by employee in the projects table. 
-- For this report we will list all employees' first and last name, dept_number and, additionally if the employee has a project number assigned to her, we will list that too, 
-- but the report should list all employees whether or not they have projects. 
-- Switch to the EX database
-- USE EX; 
-- SELECT e.first_name, e.last_name, e.employee_id, e.dept_number, p.project_number
-- FROM ex.employees e 
-- LEFT JOIN ex.projects p 
-- ON e.employee_id = p.employee_id;

-- 13. In this database there are two tables of invoices. One is called active_invoices and one is called paid_invoices. 
-- Use a UNION query (page 140) to generate a report that shows all invoices for vendor 123. This will join the active_invoices table to the paid_invoices table. 
-- The report should include invoice_id, the vendor_id, the invoice total, the invoice date, and a column called "Status" that has a value of "paid"  
-- if there is a date in payment_date column, or "not paid" if there is a null value in the pending column. 

-- SELECT invoice_id, vendor_id, invoice_total, invoice_date,
--        CASE 
--          WHEN payment_date IS NOT NULL THEN 'paid'
--          ELSE 'not paid'
--        END AS Status
-- FROM ex.active_invoices
-- WHERE vendor_id = 123
-- UNION
-- SELECT invoice_id, vendor_id, invoice_total, invoice_date,
--        CASE 
--          WHEN payment_date IS NOT NULL THEN 'paid'
--          ELSE 'not paid'
--        END AS Status
-- FROM ex.paid_invoices
-- WHERE vendor_id = 123;


-- 14. Often when joining many tables together it can save time and coding mistakes to use table aliases in SELECT and ON clauses. 
-- Write a report that lists the first and last name of each employee, as well as the name of the department that the employee is assigned to. 
-- To do this you will join the employees and departments tables. Use table aliases when writing the report. 
-- Switch to the chinook database for the last two queries.

-- USE EX;
-- SELECT e.first_name, e.last_name, e.department_number, d.department_name
-- FROM employees AS e
-- INNER JOIN departments AS d ON e.department_number = d.department_number;




-- 15. In the chinook table there is a list of employees stored in the employee table. Some of the employees (sales staff) have customers assigned to them, others do not. 
-- Use a LEFT JOIN to list all employees in the employee table and if the employee has customers list some customer information too. 
-- For this report you will list the lastname, first_name, title, and employeeid of all employees, and the last name  and first name of any customers assigned to an employee. 
-- Sort this report by employee last name (A-Z).

-- USE chinook;
-- SELECT e.FirstName, e.LastName, e.title, e.EmployeeId 
-- FROM chinook.employee AS e
-- LEFT JOIN chinook.customer c ON e.employeeId = c.supportrepid
-- ORDER BY e.LastName ASC; 


-- 16. The chinook streaming service sells streaming songs to its customers. 
-- Some information in the database records sale information and some information records information about the songs and who wrote and performed them. 
--  Produce a report that lists the following information for any track that has had a sale as shown in the invoiceline table. 

/* 1. The name of the album the track came from.
   2. The name of the artist that produced the album. 
   3. The name, length (in milliseconds), size (in bytes), and composer for each track. 
   4. The invoiceid and untiprice for each track that exists in the invoiceline table. 
   5. The customerid, firstname and lastname of each customer that has purchased a track. 
   
   
   To produce this report you will join the CUSTOMER->INVOICE->INVOICELINE->INVOICE->TRACK->ALBUM->ARTIST tables. 
   Join your tables with the USING shortcut, instead of ON clauses and give  column names aliases to album.name, artist.name and track.name. */
   
--   SELECT al.Title AS AlbumName, ar.Name AS ArtistName, t.Name AS TrackName, 
--        t.Milliseconds, t.Bytes, t.Composer, 
--        il.InvoiceId, il.UnitPrice, 
--        c.CustomerId, c.FirstName, c.LastName
-- FROM chinook.customer c
-- INNER JOIN chinook.invoice i USING (CustomerId)
-- INNER JOIN chinook.invoiceline il USING (InvoiceId)
-- INNER JOIN chinook.track t USING (TrackId)
-- INNER JOIN chinook.album al USING (AlbumId)
-- INNER JOIN chinook.artist ar USING (ArtistId);
--    

















