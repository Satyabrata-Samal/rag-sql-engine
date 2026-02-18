-- Customer names (chinook database)

-- Welcome to this SQL lab, where you will be tested on your ability to query and extract specific data from the Chinook database. The Chinook database contains various tables related to a digital media store, including tables for artists, albums, tracks, playlists, invoices, and customers.

-- Database Details
-- You will primarily work with the Customer table in this lab. Here's a brief overview:

-- Customer
-- CustomerId (Primary Key)
-- FirstName
-- LastName
-- Company
-- Address
-- City
-- State
-- Country
-- PostalCode
-- Email
-- SupportRepId (Foreign Key to Employee)
-- Instructions
-- Challenge 1: American Music Lovers

-- Objective: Extract a list of names and countries of customers.

-- Task Details:

-- Use the table "Customer".
-- Retrieve the following columns:
-- "FirstName"
-- "Country"
-- Filter the results to include only customers residing in the 'USA'.
-- Order the results by the column "FirstName" in ascending order.
-- Make sure to use double quotes for table and column names for clarity and to prevent any potential SQL errors.

-- Remember, the expectation is that you write queries which produce outputs exactly matching the specified criteria. The challenge has been designed with specific "ORDER BY" clauses to ensure consistent and comparable outputs. Ensure you adhere to these specifications to successfully pass the lab.

-- Good luck and happy querying!

-- Challenges Information
-- Challenge 1: American Music Lovers
-- Objective: Assess the participant's proficiency in filtering, selecting specific columns, and ordering the results.

-- Description: You need to create a list for an exclusive music event. Retrieve the first names and countries of customers, but only for those residing in the USA. Ensure your list is in order by first name.

-- Tables Involved:

-- Customer
-- Columns to be Retrieved:

-- FirstName
-- Country
-- Constraints:

-- Only include records of customers from the USA.
-- Results should be ordered by the FirstName.
-- Expected Output Columns:

-- FirstName
-- Country

SELECT FirstName,Country 
FROM Customer
WHERE Country='USA'
ORDER BY FirstName ASC