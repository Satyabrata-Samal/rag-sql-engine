Part 1: 

WORLD DATABASE QUESTIONS
-- #1: List all countries in South America
SELECT Name from country WHERE continent = 'South America';

-- #2: Find the population of 'Germany'

SELECT population FROM country WHERE Name = 'Germany'; 

-- #3: Retrieve all cities in the country 'Japan'. 


select name from city where countrycode = 'JPN';

#4. Find the 3 most populated countries in the 'Africa' region.
SELECT Name, population 
FROM country
WHERE Continent = 'Africa'
ORDER BY population DESC
LIMIT 3;


5. Retrieve the country and its life expectancy where the population is between 1 and 5

million.
SELECT Name, LifeExpectancy
FROM country WHERE population <5000000 and population >1000000;


6. List countries with an official language of 'French'

SELECT country.Name 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode 
WHERE countrylanguage.Language = 'French'
AND countrylanguage.IsOfficial = 'T';

CHINOOK DATABASE QUESTIONS
7. Retrieve all album titles by the artist 'AC/DC'.


SELECT Album.Title
FROM Album
JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = 'AC/DC';

8. Find the name and email of customers located in 'Brazil'.
SELECT Customer.FirstName, Customer.LastName, Customer.Email
FROM Customer 
WHERE Customer.Country = 'Brazil';
9. List all playlists in the database.
SELECT * from Playlist;

Medium:

10. Find the total number of tracks in the 'Rock' genre

SELECT COUNT(*) 
FROM Genre 
JOIN Track ON Genre.GenreId = Track.GenreId
WHERE Genre.Name = 'Rock';

11. List all employees who report to 'Nancy Edwards'.

SELECT Employee.FirstName, Employee.LastName
FROM Employee 
JOIN Employee AS Manager ON Employee.ReportsTo = Manager.EmployeeID
WHERE Manager.FirstName = 'Nancy' AND Manager.LastName = 'Edwards';

12. Calculate the total sales per customer by summing the total amount in invoices.

SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId 
GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName;

Part 2: Create Your Own Database

In this section, you will design and create a new database, insert some data, and write

queries to extract information from it. You can use the database with YOUR compute ID as

the name of the database. You have write privileges there.

1. **Design Your Database:** Create a database for a small business of your choice, with at

least 3 tables with appropriate columns.


CREATE TABLE MenuItems(
    ItemID int NOT NULL PRIMARY KEY,
    Name VARCHAR(100),
    Price FLOAT,
    BowlType VARCHAR(100)
);
   

CREATE TABLE Customer (
    CustomerID int NOT NULL PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    PhoneNumber VARCHAR(100)
);

CREATE TABLE Sales (
    SaleID int NOT NULL PRIMARY KEY,
    ItemID INTEGER,
    Quantity INTEGER,
    TotalPrice FLOAT,
    Date DATETIME,
    CustomerID INT
);
    
INSERT INTO Sales(SaleID, CustomerID, ItemID, Date, Quantity, Amount)
VALUES (1, 3, 4, '2024-03-14 12:34:00', 3, 


2. **Create the Tables:** Write SQL statements to create the tables for your database.

Ensure that each table has a primary key and relationships where appropriate.


INSERT INTO Customer (CustomerID, FirstName, LastName, PhoneNumber)
VALUES 
(1, 'Margot', 'Brady', '508-654-3624'), 
(2, 'Mckenna', 'Kundis', '757-752-1046'),
(3, 'Caroline', 'Brinkman', '856-630-3511'),
(4, 'Naomi', 'Tekola', '703-825-0183'),
(5, 'Kara', 'Rippey', '202-425-2322');



INSERT INTO MenuItems (ItemID, Name, Price, BowlType)
VALUES
(1,'El Jefe', 13.25, 'Grain'),
(2, 'Apollo', 13.25, 'Grain'),
(3,'Balboa', 14.25, 'Grain'),
(4, 'Roots Bowl', 11.85, 'Grain'),
(5, 'Mad Bowl', 12.35, 'Grain'),
(6, 'Southern', 12.85, 'Grain'),
(7, 'Pesto Ceasar', 12.85, 'Salad'),
(8, 'Mayweather', 13.65, 'Salad'), 
(9, 'Corner Cobb', 13.25, 'Salad'),
(10, 'Tamari', 13.25, 'Salad');

INSERT INTO Sales(SaleID,ItemID,Quantity, TotalPrice, Date, CustomerID)
VALUES 
(1, 3, 4, 42.75, '2024-03-14 12:34:00', 3),
(2, 1, 1, 13.25, '2024-03-15 12:34:00', 1),
(3, 10, 1, 13.25, '2024-03-16 12:34:00', 5),
(4, 4, 2, 27.30, '2024-03-17 12:34:00', 2),
(5, 5, 1, 12.35, '2024-03-18 12:34:00', 1),
(6, 2, 1, 12.85, '2024-03-19 12:34:00', 4),
(7, 2, 2, 25.70, '2024-03-21 12:35:00', 1),
(8, 1, 1, 13.65, '2024-03-22 12:35:00', 2),
(9, 1, 1, 13.25, '2024-03-23 12:35:00', 2);


3. **Insert Data:** Insert at least 5 rows of data into each of the tables you created.

4. **Write Queries:** Write at least 3 queries to extract data from your new database.

To show the items in order of sales:

SELECT MenuItems.Name, SUM(Sales.Quantity) AS TotalOrdered 
FROM Sales
JOIN MenuItems ON Sales.ItemID = MenuItems.ItemID 
GROUP BY MenuItems.Name
ORDER BY TotalOrdered DESC;




Which customers have ordered the most times in descending order;


SELECT Customer.FirstName, Customer.LastName, COUNT(Sales.SaleID) AS NumberofOrders
FROM Sales
JOIN Customer ON Sales.CustomerID = Customer.CustomerID
GROUP BY Customer.CustomerID
ORDER BY NumberofOrders DESC;


Display most expensive bowl: 

SELECT Name, Price
FROM MenuItems
ORDER BY Price DESC
LIMIT 1; 



