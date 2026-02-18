/*Create the chinook database and use it in MySQL terminal.*/
CREATE DATABASE Chinook;


USE Chinook;

-- Create the customer table as follows
CREATE TABLE Customer (CustomerId INT NOT NULL, FirstName VARCHAR(40) NOT NULL, LastName VARCHAR(20) NOT NULL, Company VARCHAR(80), Address VARCHAR(70), City VARCHAR(40), State VARCHAR(40), Country VARCHAR(40), PostalCode VARCHAR(10), Phone VARCHAR(24), Fax VARCHAR(24), Email VARCHAR(60) NOT NULL, SupportRepId INT, CONSTRAINT PK_Customer PRIMARY KEY (CustomerId));

--Insert the following records of data into the Customer table
INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (1, 'Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3);
INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (2, 'Eduardo', 'Martins', 'Woodstock Discos', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'SP', 'Brazil', '01007-010', '+55 (11) 3033-5446', '+55 (11) 3033-4564', 'eduardo@woodstock.com.br', 4);
INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES

(3, 'Alexandre', 'Rocha', 'Banco do Brasil S.A.', 'Av. Paulista, 2022', 'São Paulo', 'SP', 'Brazil', '01310-200', '+55 (11) 3055-3278', '+55 (11) 3055-8131', 'alero@uol.com.br', 5);



INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES

(4, 'Roberto', 'Almeida', 'Riotur', 'Praça Pio X, 119', 'Rio de Janeiro', 'RJ', 'Brazil', '20040-020', '+55 (21) 2271-7000', '+55 (21) 2271-7070', 'roberto.almeida@riotur.gov.br', 3);



INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (5, 'Mark', 'Philips', 'Telus', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', '+1 (780) 434-4554', '+1 (780) 434-5565', 'mphilips12@shaw.ca', 5);



INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (6, 'Jennifer', 'Peterson', 'Rogers Canada', '700 W Pender Street', 'Vancouver', 'BC', 'Canada', 'V6C 1G8', '+1 (604) 688-2255', '+1 (604) 688-8756', 'jenniferp@rogers.ca', 3);

/*Task 1: Display data in customer table


Before you start sorting and filtering data, let’s display some of the customer data content that already exists in the database. This can be done by writing the following SELECT statement, which retrieves all data from the customer table.*/
SELECT CustomerID, FirstName, LastName, City, State, Country FROM Customer;

/*Task 2: Sort the result set of data

You can make it easier for the users of the database to find relevant customers by sorting the data. For example, you can sort the data alphabetically from A-Z by using the customers' first names. This can be done by adding the ORDER BY clause to the previous SQL statement as follows.*/

SELECT CustomerID, FirstName, LastName, City, State, Country
FROM Customer
ORDER BY FirstName;
/*Task 3: Filter the result set of data

You can make it even easier for users to find specific customers by filtering data based on some criteria. For example, extracting a list of customers that come from a specific country.

In this case, you can add the condition to the previous SQL statement using the "WHERE" clause as shown below and pressing Enter to execute the query.*/

SELECT * 
FROM Customer
WHERE Country = "Canada";

To make it even better, you can display all customers in Canada with the Alphabetical order from A to Z!  

To do that, you can add the ORDER BY clause at the end of the previous SQL statement as follows: 
/*
SELECT * 
FROM Customer  
WHERE Country = "Canada" 
 ORDER BY FirstName; 

The output result of the SQL statement now shows all customers from Canada with the right Alphabetical order.  

You have now learned how to sort and filter data using SQL clauses ORDER BY and WHERE. 
*/ 
