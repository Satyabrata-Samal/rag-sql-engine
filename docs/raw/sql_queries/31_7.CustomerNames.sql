/* Day 7.[02-02-2023]:Customer names (chinook database)
Easy

Welcome to this SQL lab, where you will be tested on your ability to query and extract specific data from the Chinook database. The Chinook database contains various tables related to a digital media store, including tables for artists, albums, tracks, playlists, invoices, and customers.

Database Details
You will primarily work with the Customer table in this lab. Here's a brief overview:

Customer
CustomerId (Primary Key)
FirstName
LastName
Company
Address
City
State
Country
PostalCode
Email
SupportRepId (Foreign Key to Employee)

Instructions

Challenge 1: American Music Lovers

Objective: Extract a list of names and countries of customers.

Task Details:
Use the table "Customer".
Retrieve the following columns:
"FirstName"
"Country"
Filter the results to include only customers residing in the 'USA'.
Order the results by the column "FirstName" in ascending order.
Make sure to use double quotes for table and column names for clarity and to prevent any potential SQL errors.

Remember, the expectation is that you write queries which produce outputs exactly matching the specified criteria. 
The challenge has been designed with specific "ORDER BY" clauses to ensure consistent and comparable outputs.
Ensure you adhere to these specifications to successfully pass the lab. */


SELECT FirstName, Country
FROM Customer
WHERE Country = 'USA'
ORDER BY Firstname ASC;


