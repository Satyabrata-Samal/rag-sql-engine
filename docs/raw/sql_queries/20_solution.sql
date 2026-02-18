/*
DAY 1
Filtering Patients by Weight Range in SQLite
Your challenge is to construct an SQL query to achieve the following:

Retrieve the first_name and last_name of patients table.
The query should only select patients whose weight is within the range of 100 to 120 (inclusive).
Table Schema
You have to make use of the patients table. Here is the complete schema of the table for your reference

patient_id
first_name
last_name
gender
birth_date
city
province_id
allergies
height
weight
Key Concepts
SQLite: A C-language library that provides a lightweight disk-based database. It doesn’t require a separate server process.
SQL SELECT Statement: Used to select data from a database and fetch the result table. The result can be stored in a table or used as it is.
SQL WHERE Clause: Used to filter the results and extract only the necessary records.
BETWEEN Operator: In SQL, the BETWEEN operator is used to filter the result set based on a range. It can be used with numbers, text and even dates.
*/
select 
    first_name
    , last_name
from patients
where weight between 100 and 120
;

/*
DAY 2
Finding Patients from Hamilton with Allergies Using SQL
Write an SQL query to find a list of patients' first_name, last_name, and allergies who are from the city of Hamilton and have non-null values in the allergies column.

Tables Used: patients
Important Concepts
SQL Keywords: Understanding SQL keywords like SELECT, FROM, and WHERE will be essential.
NULL Values: Know how to handle NULL values in SQL, especially when you want to include or exclude them in your results.
*/
SELECT 
    first_name
    , last_name
    , allergies
FROM patients    
WHERE  city = 'Hamilton' 
    AND allergies IS NOT NULL
;

/*
DAY 3
Filtering and Sorting Customer Data by City and Contact Name in SQLite
In this lab, you will be working with the SQLite database northwind.sqlite. Your main task is to construct an SQL query to retrieve specific information from the customers table.

Objective
Your SQL query should fulfill the following requirements:

Retrieve the city, company_name, and contact_name columns from the customers table.
Filter the records to only include rows where the city name contains the letter 'L'.
Sort the resulting data set by contact_name in ascending order.
Key Concepts
To complete this lab, you should be familiar with the following SQL operations:

SELECT for specifying the columns you want to retrieve
WHERE for filtering rows based on a condition
ORDER BY for sorting the results
*/
SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE '%L%'
ORDER BY contact_name ASC
;

/*
DAY 4
Finding the Tallest Patient's Name and Height
Your goal is to retrieve specific information about patients based on certain criteria. Specifically, you are tasked with the following:

Retrieve the first_name, last_name, and height of the patient with the greatest height from the patients table
Schema
Schema of the patients table for reference

patient_id
first_name
last_name
gender
birth_date
city
province_id
allergies
height
weight
Concepts:
SELECT Statement: Used to select data from a database. The result is then stored in a result table.
Aggregate Functions: SQL aggregate functions return a single value, calculated from values in a column. The function MAX() is one such function which returns the maximum value of the selected column.
*/

SELECT first_name
    , last_name
    , MAX(height) AS height
FROM patients
;

/*
DAY 5
Filtering Patients by Specific IDs in a Hospital Database
Easy
128
1
93.9% Acceptance
The database focuses on hospital data, and for this particular exercise you'll be using the patients table.

Schema
patients table schema

patient_id
first_name
last_name
gender
birth_date
city
province_id
allergies
height
weight
Task
Write a SQL query to show all columns for patients who have specific patient_ids: 1, 45, 534, 879, 1000.

Concepts to Know
SELECT: To specify the columns you want to retrieve.
WHERE: To filter the records based on certain conditions.
IN: To specify multiple values in a WHERE clause.
*/

SELECT *
FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000)
;

/*
DAY 6
Counting Total Admissions for a Specific Patient in a Hospital Database

Write an SQL query to show the patient id and the total number of admissions for a patient with a patient_id of 579. Your query should return the patient_id and the total count of admissions for that patient with the column name alias total_admissions

Tables Used: admissions
Concepts
SELECT: To specify the columns you want in your result set.
COUNT(): An aggregate function to count the number of rows.
WHERE: To filter the records based on a condition.
*/

SELECT 
    patient_id
    , COUNT() AS total_admissions
FROM admissions
WHERE patient_id = 579
;

/*
DAY 7
Customer names (chinook database)

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

Remember, the expectation is that you write queries which produce outputs exactly matching the specified criteria. The challenge has been designed with specific "ORDER BY" clauses to ensure consistent and comparable outputs. Ensure you adhere to these specifications to successfully pass the lab.

Challenges Information
Challenge 1: American Music Lovers
Objective:
Assess the participant's proficiency in filtering, selecting specific columns, and ordering the results.

Description:
You need to create a list for an exclusive music event. Retrieve the first names and countries of customers, but only for those residing in the USA. Ensure your list is in order by first name.

Tables Involved:

Customer
Columns to be Retrieved:

FirstName
Country
Constraints:

Only include records of customers from the USA.
Results should be ordered by the FirstName.
Expected Output Columns:

FirstName
Country
*/
SELECT 
    FirstName
    , Country
FROM 
    Customer
WHERE Country = 'USA'
ORDER BY FirstName ASC
;    

/*
DAY 8
Identifying Same-Day Hospital Admissions and Discharges
Your task is to write a SQL query to show all the columns from the admissions table where the patient was admitted and discharged on the same day.

Important Concepts:
SELECT Statement: This SQL command selects specific columns from a table. To select all columns, you'd use the asterisk (*).
WHERE Clause: This clause filters records based on specific conditions.
It's essential to understand the relationships and the nature of data in the admissions table. As you craft your solution, make sure to test your query and ensure it produces the expected results.

Best of luck, and happy coding!
*/
SELECT *
FROM 
    admissions
WHERE 
    admission_date = discharge_date
;

/*
DAY 9
Distinct city names (chinook database)
In this exercise, you'll be working with the chinook database. Your task is to solve a series of challenges that test your SQL skills.

Lab Dataset
You'll be using the chinook database, which represents a digital music shop. Here's a quick breakdown of the tables and the key columns:

Artist: "ArtistId", "Name"
Album: "AlbumId", "Title", "ArtistId"
Track: "TrackId", "Name", "AlbumId", "MediaTypeId", "GenreId", "Composer", "Milliseconds", "Bytes", "UnitPrice"
MediaType: "MediaTypeId", "Name"
Genre: "GenreId", "Name"
Playlist: "PlaylistId", "Name"
PlaylistTrack: "PlaylistId", "TrackId"
Invoice: "InvoiceId", "CustomerId", "InvoiceDate", "BillingAddress", "BillingCity", "BillingState", "BillingCountry", "BillingPostalCode", "Total"
InvoiceLine: "InvoiceLineId", "InvoiceId", "TrackId", "UnitPrice", "Quantity"
Customer: "CustomerId", "FirstName", "LastName", "Company", "Address", "City", "State", "Country", "PostalCode", "Email", "SupportRepId"
Employee: "EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email"
Instructions
Writing SQL Queries: Write SQL queries to solve the challenges. Make sure to name all the columns exactly as mentioned in the challenge statement.
Using Double Quotes: Whenever referencing column names or table names, use double quotes for clarity, e.g., SELECT "Name" FROM "Artist".
Order Matters: Always ensure that the ordering specified in the challenge is strictly followed. This is important to make sure your solution matches the expected output, as the evaluation may involve direct comparison of rows.
Be Precise: Ensure that the queries you write follow the exact specifications of the challenges. Avoid adding or removing columns that are not explicitly mentioned.
When you're ready to submit, ensure your SQL query matches the problem statement's requirements, and remember to test your solution to ensure accuracy!

Good luck, and happy querying!

Challenges Information
Challenge 1: Distinct Customer Cities
Objective: Fetch a list of all the unique cities in which the customers live.

Details:

Dataset: Use the Customer table from the chinook database.
Columns to Display: Display the City column.
Ordering: Results should be ordered alphabetically by the city name.
Uniqueness: Ensure that each city name appears only once in the result.
*/
SELECT 
    DISTINCT "City" 
FROM 
    "Customer"
ORDER BY 
    "CITY"
;
/*
DAY 10
Retrieve Even-Numbered Order IDs from the Orders Table

Retrieve all the even-numbered Order_id from the orders table.

Concepts to Review:
SELECT Statement: The fundamental SQL command used to retrieve data from a table.
WHERE Clause: Used in SQL to filter records based on specific conditions.
MOD Function: In SQL, the MOD function returns the remainder of a division. For example, MOD(column_name, n) will give the remainder when column_name is divided by n.
*/
SELECT 
    Order_id
FROM orders
WHERE 
    MOD(Order_id, 2) = 0
;

/*
DAY 11
In this lab, you'll be working with the Chinook database, which simulates a digital media store. You'll be tasked with a series of SQL challenges that will test your ability to retrieve, manipulate, and structure data effectively.

Dataset
The primary dataset you'll be working with is the Chinook database. It has various tables including Track, Album, Artist, and many others. Here's a brief overview:

"Track": Contains details about individual music tracks including their Name, duration (Milliseconds), and which Album they belong to (AlbumId).
"Album": Stores information about music albums including their Title and which Artist made them (ArtistId).
... (Other tables follow a similar descriptive format.)
Ensure that you use exact table names and column names as defined in the schema, and always use double quotes around them for clarity.

For each challenge, make sure to read the problem statement carefully and craft your SQL queries accordingly. Always ensure the columns in your output match the expected column names exactly, as discrepancies can lead to failed evaluations.

Task
You are required to retrieve track names ("Name") and their corresponding album IDs ("AlbumId") for tracks that have a duration longer than 5 minutes.

Conditions:

Use the "Track" table.
Filter by track duration ("Milliseconds") to get tracks longer than 300,000 milliseconds (5 minutes).
Order your result by the track name ("Name") in ascending order.
Your output should have columns named "Name" and "AlbumId".

Submission
Once you've crafted your SQL queries, you can submit them for evaluation. Remember to always check the expected output format and ensure your queries match them closely to maximize your chances of passing the challenges.

Best of luck!

Challenges
Challenge 1: Long Tracks Listing
Objective: Retrieve track names and their corresponding album IDs for tracks that have a duration longer than 5 minutes.

Details:

Database Tables to Use: Track
Columns to Display:
Name: Name of the track
AlbumId: ID of the album to which the track belongs
Conditions/Criteria:
Track duration (Milliseconds) should be greater than 300,000 (which is equivalent to 5 minutes).
Ordering: The resulting list should be ordered by the track name (Name) in ascending order.
Expected Output Format:

| Name          | AlbumId |
|---------------|---------|
| Track A       | 5       |
| Track B       | 7       |
| ...           | ...     |
*/

SELECT
    Name
    , AlbumID
FROM 
    Track
WHERE 
    Milliseconds > 300000
ORDER BY
    Name
;
/*
DAY 12
Calculating Average Unit Price, Total Stock, and Discontinued Products in SQLite
In this lab, you will be specifically focusing on the products table. Your task is to write a SQL query to address the following question:

Question: Show the average unit_price rounded to 2 decimal places as average_price , the total units in stock (use units_in_stock) across all products as total_stock, and the total discontinued products (use discontinued) from as total_discontinued the products table.

products Table Schema
product_id
product_name
supplier_id
category_id
quantity_per_unit
unit_price
units_in_stock
units_on_order
reorder_level
discontinued
Concepts Needed
Aggregate Functions (AVG, SUM)
Rounding (ROUND)
SELECT statements
The column names must be average_price, total_stock, total_discontinued, any other name would fail the tests. Make sure to add proper aliases to your columns.
*/
SELECT
    ROUND(AVG(unit_price), 2) AS average_price
    , SUM(units_in_stock) AS total_stock
    , SUM(discontinued) AS total_discontinued
FROM
    products
;

/*
DAY 13
Filtering Patients by Specific First Name Criteria in SQLite

Your task is to write a SQL query to fetch specific patient information from the patients table.

Schema
patients table schema for reference

patient_id
first_name
last_name
gender
birth_date
city
province_id
allergies
height
weight
Task
Show the patient_id and first_name from the patients table where the first_name starts and ends with the letter 's' and is at least 6 characters long and ordered by patient_id in ascending order

Important Concepts
SQLite syntax: You will be writing your query in SQLite.
Wildcards: This query will require you to use wildcards to filter data.
*/

SELECT 
    patient_id
    , first_name
FROM
    patients
WHERE
    LOWER(first_name) LIKE 's%s' 
    AND
    LENGTH(first_name) >=6
ORDER BY 
    patient_id
;
/*
DAY 14
Identifying Duplicate Patient Records by First and Last Names

Welcome to this SQL lab where you'll be working with a database named hospital.sqlite. This database contains a table named patients that, as you might guess, holds data related to patients. Your task is to delve into this data and extract valuable insights.

Objective:

Write an SQL query to display the number of duplicate patients based on their first_name and last_name.

Concepts to Understand:

GROUP BY Clause: This allows you to arrange identical data into groups. For this lab, you'll be grouping based on two columns: first_name and last_name.

HAVING Clause: Works in conjunction with the GROUP BY clause to filter the grouped records based on a condition. You'll be using this to ensure you're only considering duplicate records.

Get started and try to come up with the solution on your own! Remember to focus on the task at hand and leverage the power of SQL's aggregation and filtering capabilities.

Make sure the column names are first_name, last_name, num_of_duplicates
*/
SELECT
    first_name
    , last_name
    , COUNT(*) AS num_of_duplicates
FROM
    patients
GROUP BY 
    first_name
    , last_name
HAVING 
    COUNT(*) >= 2
;

/*
DAY 15
Identifying Patients with Multiple Admissions for the Same Diagnosis

In this lab, you are presented with a database that contains hospital admission records. Your task is to write an SQL query to find patients who have been admitted multiple times for the same diagnosis. You are required to display the patient_id and diagnosis for these cases.

Important Concepts
GROUP BY: Useful for aggregating data based on one or more columns.
HAVING: Allows you to filter records after performing an aggregation.
COUNT(): SQL function for counting the number of rows in a result set.
*/
SELECT
    patient_id
    , diagnosis
FROM 
    admissions
GROUP BY 
    patient_id
    , diagnosis
HAVING 
    COUNT(*) >= 2
;
/*
DAY 16
Retrieve Most Recent Admission Details for a Specific Patient in SQLite

Your task is to interact with the admissions table to retrieve specific information. Your goal is to write a SQL query to show all columns for a patient with a patient_id of 542 based on their most recent admission_date.

Schema
Table Schema for admissions table

patient_id
admission_date
discharge_date
diagnosis
attending_doctor_id
*/
SELECT *
FROM
    admissions
WHERE 
    patient_id = 542
ORDER BY 
    admission_date DESC
LIMIT 1
;

/*
DAY 17
Calculating Weight Difference for Maroni Patients in SQLite

Your task is to write an SQL query to find the difference between the largest and smallest weight among patients with the last name 'Maroni'.

Concepts
SELECT: To specify the columns that should be returned in the result set.
MAX(): SQL function to get the maximum value in a numeric dataset.
MIN(): SQL function to get the minimum value in a numeric dataset.
WHERE: To filter records based on specific conditions.
Requirements
Your query should only return a single column named weight_delta that contains the weight difference.
You must use the patients table
Your query should run without errors to pass the lab.
*/
SELECT
    MAX(weight) - MIN(weight) AS weight_delta
FROM 
    patients
WHERE 
    last_name = 'Maroni'
; 

/*
DAY 18
Filtering Customers by Country in Northwind Database

Retrieve the following columns: contact_name, address, and city from the table customers
The query should only include customers that are NOT from the countries Germany, Mexico, or Spain.
customers table schema
customer_id
company_name
contact_name
contact_title
address
city
region
postal_code
country
phone
fax
Important Concepts
SQL SELECT statement: Used to specify the columns that should be returned in the result set.
SQL WHERE clause: Used for filtering records based on specific conditions.
SQL NOT IN clause: Used to exclude records that match values in a list.
*/
SELECT
    contact_name
    , address
    , city
FROM 
    customers
WHERE 
    country NOT IN ('Germany', 'Mexico', 'Spain')
;
/*
DAY 19
Filter and Sort Unique Cities Starting with a Vowel from Patient Data

Your task is to write an SQL query to retrieve a list of unique cities where patients in the patients table reside. The catch is, you only need to list cities that start with a vowel (A, E, I, O, U), and sort them in ascending order.

Concepts
To accomplish this task, you'll likely need to be familiar with the following SQL concepts:

SELECT: To specify the columns that should be returned in the result set.
DISTINCT: To ensure that the result set contains unique records.
WHERE: To filter the records based on specific conditions.
LIKE: To search for a specified pattern in a column.
ORDER BY: To sort the result set in ascending or descending order.
*/
SELECT DISTINCT city
FROM 
patients
WHERE 
   city LIKE 'A%' 
   OR city LIKE 'E%' 
   OR city LIKE 'I%' 
   OR city LIKE 'O%' 
   OR city LIKE 'U%'
ORDER BY 
   city ASC
;

/*
DAY 20
Counting and Sorting Patients by City in SQLite

Your task is to write a SQL query that returns the name of each city and the total number of patients residing in that city with the column name as num_patients. Your query should order the results first by the total number of patients (num_patients) in descending order, and then by the city name in ascending alphabetical order.

Concepts Covered
Aggregate Functions (COUNT)
GROUP BY Clause
Sorting (ORDER BY, ASC, DESC)
Database Schema
patients: This table contains information related to patients. You'll primarily be querying this table to solve the exercise.

Patients Table Schema

product_id
product_name
supplier_id
category_id
quantity_per_unit
unit_price
units_in_stock
units_on_order
reorder_level
discontinued
Requirements
Use the SELECT statement to specify the columns you want to retrieve.
Utilize the COUNT function to get the total number of patients for each city give the column an alias num_patients
Apply the GROUP BY clause to group the results by the city.
Use the ORDER BY clause to sort the results based on the conditions specified.
*/

SELECT
    city
    , COUNT(*) AS num_patients
FROM 
    patients
GROUP BY 
    city
ORDER BY
    num_patients DESC
    , city ASC
;

/*
DAY 21

Customers by Country (chinook database)

The dataset you're working with represents a digital media store. You'll find information about artists, albums, tracks, media types, genres, playlists, invoices, customers, and employees.

Instructions
Carefully read through the challenge requirements.
Stick strictly to the column and table names provided in the Chinook database schema.
After constructing your SQL query, test it to ensure it works as expected.
Once you're confident in your solution, submit it for evaluation.
Challenges
Objective:

Determine the number of customers from each country.

Description:

Write an SQL query that counts the number of customers from each country. You should group the results by Country and order them alphabetically by Country.

Tables Used:

Customer
Expected Columns in Output:

Country
CustomerCount (this should represent the count of customers for each country)
Hints/Tips:

Make sure to use the COUNT function and the GROUP BY clause.
When writing your query, make sure to name the count column as CustomerCount.
Your result should be ordered by Country.
Example of Expected Output:

Country	CustomerCount
Brazil	5
Canada	8
*/

SELECT
    Country
    , COUNT(*) AS CustomerCount
FROM
    Customer
GROUP BY 
    Country
ORDER BY
    Country
;

/*
DAY 22
Invoices by Year (chinook database)

Your main task in this lab is to craft SQL queries to extract specific data from the Chinook database. You should be able to understand the database schema, apply various SQL techniques, and come up with the required solution.

Database Schema
Here's a brief rundown of the tables and columns you will be working with:

"Artist": Contains "ArtistId" and "Name" columns.
"Album": Important columns include "AlbumId", "Title", and "ArtistId".
"Track": Some key columns are "TrackId", "Name", "AlbumId", and "InvoiceDate".
"Invoice": The main columns to note are "InvoiceId", and "InvoiceDate".
Instructions
Stick to the SQLite syntax as we are working with the SQLite version of the Chinook database.
Ensure your queries are optimized for performance.
Properly format and structure your SQL for readability.
Always include an "ORDER BY" clause where specified to ensure consistent and correct output.
Challenge
Objective: Your task is to count the number of invoices generated each year from the Invoice table.

Expected Output:

Columns:
Year: Extracted from the InvoiceDate column representing the year the invoices were generated. (Hint: Use string functions to extract the year part).
InvoiceCount: Represents the total number of invoices generated in that specific year.
Order: Ensure your results are sorted by the Year column in ascending order.

SQL Components to Use:

substr() function to extract the year from the InvoiceDate column.
GROUP BY clause to group results by year.
COUNT() function to count the invoices per year.
ORDER BY clause to sort the results by year.
Evaluation:
Ensure your query returns the correct counts for each year.
While the primary requirement is the SQLite syntax, try to keep your queries optimized.
Your solution should be clear and easily understandable, with proper SQL formatting.
*/

SELECT
    SUBSTR(InvoiceDate, 1, 4) AS Year
    , COUNT(*) AS InvoiceCount
FROM
    Invoice
GROUP BY
    SUBSTR(InvoiceDate, 1, 4)
ORDER BY
    SUBSTR(InvoiceDate, 1, 4)
;

/*
DAY 23
Customers Without Invoices (chinook database)

You will be working on challenges that involve multiple tables from the Chinook database, such as Customer, Invoice, and more.

Database Schema
You can find the full schema of the database in your lab resources. However, for a quick reference, you'll be primarily working with the following tables:

Customer
Invoice
Challenge
Objective:

Your task is to identify customers from the Customer table who have never made a purchase. This means they do not have any corresponding records in the Invoice table.

Tables Involved:
Customer
Invoice

Sorting Criteria:
Your query should order the results by Customer.CustomerId.

Output Columns:
Your query should return the following columns explicitly named:
Customer.FirstName
Customer.LastName

Note:
You should use a LEFT JOIN between Customer and Invoice tables to achieve this. 
Make sure to handle cases where there may be no matching records in the Invoice table for a Customer. Your query should explicitly mention all column names and tables involved.
*/

SELECT
    Customer.FirstName
    , Customer.LastName
FROM 
    Customer
LEFT JOIN 
    Invoice
ON 
    Customer.CustomerId = Invoice.CustomerId
WHERE
    Customer.CustomerId NOT IN 
    (SELECT 
        Invoice.CustomerId
    FROM 
        Invoice
    )
;

/*
DAY 24
Identifying Provinces with More Male Patients than Female

Your task is to write a SQL query to answer the following question. Show the provinces that have more patients identified as 'M' than 'F'. You should only display the full province_name.

Database Information
You will be working with a database. The relevant tables for this exercise are:

patients
province_names
You are encouraged to explore the structure of these tables to understand their relationships and the data they contain.

Important Concepts
Joins: You'll need to join multiple tables to gather all the necessary data.
Aggregate Functions: These functions allow you to perform calculations on a group of rows, potentially subdividing them based on the values of one or more columns. For this exercise, understanding how to count rows based on certain conditions will be crucial.
Grouping: It's essential to group your results by certain columns to aggregate data correctly.
Having Clause: Once you've grouped your results, you might want to filter them based on the aggregated data.
Make sure the column name is province_name

Remember to think critically about each step in your query, and ensure your final output matches the question's requirements. Good luck!
*/
SELECT
    pr.province_name
FROM 
    province_names pr
JOiN 
    patients p
ON pr.province_id = p.province_id
GROUP BY 
    p.province_id
HAVING 
    COUNT(CASE WHEN p.gender = 'M' THEN 1 END) > 
    COUNT(CASE WHEN p.gender = 'F' THEN 1 END)
;

/*
DAY 25
Combining Patient and Doctor Data Using SQL UNION

The hospital.sqlite database consists of multiple tables, but for this challenge, you will primarily be focused on two tables:

patients
doctors
Each table represents different roles within a hospital: "Patient" and "Doctor".

Task Description
Your challenge is to retrieve the first_name, last_name, and role of every person present in both the patients and doctors tables. You must ensure that the role for each person is correctly labeled as either "Patient" or "Doctor". Make sure to name this column as "role"

Key Concepts
UNION: SQL's UNION clause allows you to combine rows from two or more tables based on a related column. The primary condition is that the columns should be of the same datatype.
ALIAS: In SQL, aliases are used to give a temporary name to a table or a column for the purpose of a specific SQL query. It can be beneficial for making column names more readable.
Good luck with your task! Remember, practice makes perfect.
*/

SELECT 
    first_name
    , last_name
    , 'Patient' AS role
FROM 
    patients
UNION ALL
SELECT 
    first_name
    , last_name
    , 'Doctor' AS role
FROM 
    doctors
;

/*
DAY 26
Incomplete Albums (chinook database)
In this lab, you will be tasked with writing SQL queries to solve specific challenges. The dataset used in this lab is based on the "Chinook" database, which simulates a digital media store, including tables for artists, albums, media tracks, invoices, and customers.

Dataset Schema
Here's a brief overview of the tables and their important columns:

"Artist": Represents music artists.

"ArtistId": Unique identifier for each artist.
"Name": Name of the artist.
"Album": Represents a collection of tracks.

"AlbumId": Unique identifier for each album.
"Title": Name of the album.
"ArtistId": Identifier of the artist of the album.
"Track": Represents individual media tracks.

"TrackId": Unique identifier for each track.
"Name": Name of the track.
"AlbumId": Identifier of the album containing the track.
Challenges
You will be given specific challenges that test various aspects of SQL, including but not limited to joins, subqueries, and aggregation functions.

Objective:
Identify albums that have tracks missing. For the purpose of this challenge, any album that does not have an associated track in the tracks table is considered to have missing tracks.

Tables Involved:

albums
tracks
Instructions:

Join the albums table with the tracks table using the appropriate keys.
Find albums where there are no tracks associated.
Your result should only include albums that are missing tracks.
Expected Output Columns:

albums.Title
Ordering:
Order your results based on albums.AlbumId.
*/




/*
DAY 27
Aggregating Data with Window Functions

The goal here is to solve a set of challenges that revolve around querying a musical database.

Database Details:
The Chinook dataset simulates a digital music shop and contains information about albums, tracks, invoices, customers, and more.

Important Notes:
Exact Match: The column names in your final output must match exactly with the ones described in the challenge. Pay close attention to the column names and make sure they match what's required.
Double Quotes: For clarity, always wrap table and column names with double quotes like "ColumnName".

Ordering: Ensure that you always order your results as specified in the problem statement. This ensures that the output matches the expected results.

Challenges
Objective:

Calculate a running total for each customer based on their invoices. This should reflect the cumulative sum of invoice totals for every customer over time.

Instructions:
Table Used: Use the Invoice table.
Output Columns: Your result should have the following columns:
CustomerId: The unique identifier of the customer.
InvoiceDate: The date the invoice was created.
RunningTotal: The cumulative sum of the invoice total for the specific customer up to and including the current invoice date.
Ordering: Order your results first by CustomerId and then by InvoiceDate in ascending order.
Hint:

To achieve the desired output, you might need to perform a JOIN on the Invoice table with itself. Use the SUM aggregate function to calculate the running total. Ensure your final output has columns named CustomerId, InvoiceDate, and RunningTotal.
*/

SELECT 
    CustomerId
    , InvoiceDate
    , SUM(Total) OVER
         (PARTITION BY CustomerId ORDER BY InvoiceDate) AS RunningTotal
FROM 
    Invoice 
ORDER BY
    CustomerId
    , InvoiceDate
;   

/*
DAY 29
Multi-table Subquery

Welcome to this SQLite lab where you will be honing your SQL skills using the Chinook dataset. The Chinook dataset represents a digital media store, including tables for artists, albums, media tracks, invoices, and customers.

Objective
Your goal is to complete SQL challenges based on the data and relationships in the Chinook database.

Dataset Description
The Chinook dataset consists of the following tables:

"Artist" with columns: "ArtistId" and "Name".
"Album" with columns: "AlbumId", "Title", and "ArtistId".
"Track" with columns: "TrackId", "Name", "AlbumId", "MediaTypeId", "GenreId", "Composer", "Milliseconds", "Bytes", and "UnitPrice".
... [and so on for each table]
Challenges
Retrieve the track with the longest duration for each genre.

Instructions:

From the "Track" table, fetch the "GenreId" and the name of the track corresponding to the maximum duration for each genre.
Your result should have two columns: "GenreId" and the track's name with the maximum duration, named as "MaxDurationTrackName".
Order your results by "GenreId" in ascending order to ensure consistency in output.
Expected Output Columns:

"GenreId"
"MaxDurationTrackName"
To ensure success:

Stick closely to the given schema, table names, and column names.
Use double quotes around table and column names for clarity.
Remember to order your results when necessary to match the expected output.
*/
-- solution 1
WITH MaxDurationPerGenre AS (
    SELECT 
        "GenreId", 
        MAX("Milliseconds") AS "MaxMilliseconds"
    FROM 
        "Track"
    GROUP BY 
        "GenreId"
)

SELECT 
    t."GenreId",
    t."Name" AS "MaxDurationTrackName"
FROM 
    "Track" t
JOIN 
    MaxDurationPerGenre md
ON 
    t."GenreId" = md."GenreId" AND t."Milliseconds" = md."MaxMilliseconds"
ORDER BY 
    t."GenreId" ASC;

-- solution 2 
SELECT 
    "GenreId"
    , "Name" AS "MaxDurationTrackName"
FROM 
    "Track"
WHERE 
    ("GenreId", "Milliseconds") IN (
        SELECT 
            "GenreId"
            , MAX("Milliseconds")
        FROM 
            "Track"
        GROUP BY 
            "GenreId"
    )
ORDER BY 
    "GenreId" ASC;

/*
DAY 32
Invoice Line Count (chinook database)

Your task is to write SQL queries to solve a series of challenges based on the chinook database. While constructing your queries, make sure to keep the following points in mind:

Stick to the table and column names exactly as defined in the chinook database schema. Deviations from the original names may result in incorrect results.

Use double quotes around table and column names for clarity, like "TableName".

When creating your solution, ensure the ORDER BY clause is used wherever applicable to avoid potential output mismatches.

Ensure your output column names match exactly with what's mentioned in the challenge description.

Database Schema
Here's a quick rundown of the chinook database schema:

Tables:
Artist: Contains columns "ArtistId" and "Name".
Album: Contains columns "AlbumId", "Title", and "ArtistId".
Track: Holds information related to individual tracks.
MediaType, Genre, Playlist, PlaylistTrack, Invoice, InvoiceLine, Customer, and Employee: Various other tables with their respective columns.
Challenges
Objective: Your task is to determine the number of line items associated with each invoice.

Description:
In any business, an invoice can contain multiple line items detailing the products or services being charged. For this challenge, you need to find out how many line items are there in every invoice.

Tables to Use:

Invoice
InvoiceLine
Instructions:

Join the Invoice and InvoiceLine tables using the appropriate key.
Group the results by Invoice.InvoiceId.
Count the number of line items for each invoice. The result should have a column named LineCount that represents this count.
Display the Invoice.InvoiceId and LineCount.
Order your results by Invoice.InvoiceId.
Expected Output Columns:

Invoice.InvoiceId
LineCount
*/

SELECT
    i.InvoiceId
    , COUNT(il.InvoiceLineId) AS LineCount
FROM
    Invoice i
    JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY 
    i.InvoiceId
ORDER BY 
    i.InvoiceId
;

/*
DAY 33
Category-Wise Average Product Price in Northwind

Your task is to explore the database and craft an SQL query to answer the given challenge.

Relevant Tables:

products
categories
Challenge:
Show the category name and the average product unit price for each category, rounding the result to two decimal places. The column names must be category_name, average_unit_price and ordered by average_unit_price in descending order

Important Concepts:

JOIN: Understand how to use the JOIN clause to combine rows from two or more tables based on a related column.
GROUP BY: Grasp the concept of grouping rows that have the same values in specified columns into summary rows.
Aggregate Functions: Familiarize yourself with SQL aggregate functions, like AVG, to compute a single result value from a set of input values.
ROUND: Know how to use this function to round the numbers to the desired decimal places.
ORDER BY: To show the desired rows in the required order based on the column name
Best of luck! Craft your query keeping these concepts in mind.
*/
SELECT
    c.category_name
    , ROUND(AVG(p.unit_price),2) AS average_unit_price
FROM products p
    JOIN categories c
    ON c.category_id = p.category_id
GROUP BY 
    c.category_name
ORDER BY
    average_unit_price DESC
;

/*
DAY 34
Playlist Duration (chinook database)

Welcome to the SQL lab based on the SQLite chinook database. In this lab, you will be working on various challenges to test your SQL skills.

Instructions
Database Connection: You do not need to establish any database connections. Everything is set up for you to start coding.

Writing SQL Queries: Write your SQL queries in the provided editor. Make sure to stick to the exact table and column names as per the chinook database schema.

Test Execution: Once you have written your SQL query for a challenge, run the test to see if it passes.

Column Names: Be extremely cautious about the column names. They must match exactly as specified in the challenge for your test to pass.

Query Formatting: For better readability and clarity, use double quotes around column and table names whenever possible.

Challenges
Objective:

Calculate the total duration of each playlist in milliseconds.

Tables Involved:

Playlist, PlaylistTrack, Track

Order By:

Order your result by Playlist.PlaylistId.

Final Columns in Output:

Your query should return the following columns:

Playlist.Name as Name,

SUM of Track.Milliseconds as TotalDuration.
*/
SELECT 
    p.Name AS Name
    , SUM(t.Milliseconds) AS TotalDuration
FROM 
    Playlist p
JOIN 
    PlaylistTrack pt ON p.PlaylistId = pt.PlaylistId
JOIN 
    Track t ON pt.TrackId = t.TrackId
GROUP BY 
    p.PlaylistId
ORDER BY 
    p.PlaylistId
;
/*
DAY 35
Complex Filtering using Common Table Expressions (CTE)
Hard

Welcome to this SQL lab designed to test and improve your skills! We'll be using the Chinook database and the SQLite engine for this exercise.

Database Schema
The database schema used in this lab is the standard schema for the Chinook database. It consists of several tables, but for our current challenges, you'll mostly be focused on the InvoiceLine table.

Challenges
Identifying Duplicate Tracks from the Same Album in Invoices
Table Used: "InvoiceLine"

Task Description:
Your task is to identify invoices that contain more than one track from the same album. Write a SQL query to accomplish this.

Final Output Columns:

"InvoiceId": The unique identifier for the invoice.
"DuplicateAlbumCount": The count of albums that have more than one track in the invoice.
Order By:
Make sure to sort the final output by "InvoiceId".

Important Note:
Make sure to name all the columns exactly as specified here to match the expected output.
*/
WITH AlbumTrackCount AS (
    SELECT 
        il.InvoiceId
        , t.AlbumId
        , COUNT(t.TrackId) AS TrackCount
    FROM 
        InvoiceLine il
    JOIN 
        Track t ON il.TrackId = t.TrackId
    GROUP BY 
        il.InvoiceId
        , t.AlbumId
    HAVING 
        COUNT(t.TrackId) > 1
)
SELECT 
    InvoiceId
    , COUNT(AlbumId) AS DuplicateAlbumCount
FROM 
    AlbumTrackCount
GROUP BY 
    InvoiceId
ORDER BY 
    InvoiceId
;
/*
DAY 36
Calculating Admission Costs Based on Insurance Status in a Hospital Database

In this lab, you will be working with a database containing a table called admissions. Your task is to calculate the total cost of admissions for patients based on their insurance status.

Each admission costs $50 for patients without insurance and $10 for patients with insurance. You can determine if a patient has insurance based on their patient_id; all patients with an even patient_id have insurance.

You are required to write a SQL query that does two things:

Label each patient with 'Yes' if they have insurance and 'No' if they don't.
Calculate the total admission cost for each group (Yes and No). Make sure to only use Yes and No strings as labels to pass the tests.
Make sure to set the column names to has_insurance and cost_after_insurance in the sql query to pass the tests
Concepts Required
Conditional Logic: Use of the CASE statement to apply conditions.
Aggregation: Using SUM to calculate total costs.
Grouping Records: Usage of GROUP BY to segregate data into groups.
Your output should include two columns: one that states if the patient has insurance ('Yes' or 'No') and another that gives the total admission cost for that group.

Here's how the final output should like with different integer values, make sure that the column names and the string values match with the table

has_insurance	cost_after_insurance
No	123123
Yes	123123
*/
SELECT
    CASE
        WHEN patient_id % 2 = 0 THEN 'Yes'
        ELSE 'No'
        END AS 'has_insurance'
    , SUM(CASE 
            WHEN patient_id % 2 = 0 THEN 10
            ELSE 50
        END) AS cost_after_insurance
FROM 
    admissions
GROUP BY 
    has_insurance
;

/*
DAY 37
Aggregating Admissions Attended by Each Doctor
You are provided with a database that contains multiple tables. Your task is to write a SQL query to fetch specific information from two tables: admissions and doctors.

Question:
Show first_name, last_name, and the total number of admissions attended for each doctor. Note that every admission in our database has been attended by a doctor.

Important Concepts:
JOIN: This SQL command can be used to combine rows from two or more tables based on a related column between them. For this lab, you will need to understand how to use JOIN to fetch data from both admissions and doctors tables.

GROUP BY: This clause groups rows that have the same values in specified columns into summary rows, like "find the number of admissions for each doctor". It's often used with aggregate functions like COUNT(), MAX(), etc.

COUNT(): An aggregate function that returns the number of items in a group.

Requirements:
Ensure you select the correct columns in the order specified in the question.
You'll need to use the JOIN operation to combine information from both tables.
Make sure to aggregate your results properly to display the total number of admissions for each doctor.
Make sure the name of the columns in output are: first_name, last_name, admissions_total
*/

SELECT 
    d.first_name
    , d.last_name
    , COUNT(a.patient_id) AS admissions_total
FROM 
    doctors d
JOIN 
    admissions a ON d.doctor_id = a.attending_doctor_id
GROUP BY 
    d.doctor_id
    , d.first_name
    , d.last_name
;

/* 
DAY 39 
Analyzing Daily Hospital Admissions and Their Variations

For each day, compute the total number of admissions. Additionally, calculate the difference in the number of admissions from the previous day.

Concepts to understand:
Aggregate Functions: These are SQL functions that perform a calculation on a set of values and return a single value. Examples include SUM(), COUNT(), AVG(), etc.

Window Functions: These are special SQL functions that perform calculations across a set of rows related to the current row. An example in this exercise would be LAG(), which can fetch data from a previous row.

Your goal is to write an SQL query that accomplishes the given task. Remember, focus on the structure of your query, the use of aggregate functions, and the application of window functions where necessary. Good luck!

SELECT
    admission_date
    , COUNT(patient_id) AS admission_day
    , COUNT(patient_id) - LAG(COUNT(patient_id)) 
        OVER (ORDER BY admission_date) AS admission_count_change
FROM
    admissions
GROUP BY
    admission_date
;

/*
DAY 40
Merging Customer and Supplier Data with Table Origin Column

You have access to two tables: customers and suppliers. Your objective is to:

Select the columns city, company_name, and contact_name from both tables.
Merge the results together.
Add an additional column in the result set to specify the origin of each record. This column should contain either 'customers' or 'suppliers' to indicate from which table the record came. Make sure name of this column is relationship
Concepts to Consider
Think about how you can merge results from two separate queries.
Consider how to add static values to a result set for classification purposes.
Ensure your final query is structured and formatted correctly. Once you believe you have the correct solution, submit your query for validation. Best of luck!
*/
SELECT 
    city
    , company_name
    , contact_name
    , 'customers' AS relationship
FROM 
    customers
UNION
SELECT 
    city
    , company_name
    , contact_name
    , 'suppliers' AS relationship
FROM 
    suppliers
;

/*
DAY 41
Prioritizing 'Ontario' in Ascending Province Sort

In this challenge, you'll be presented with data about various provinces. Your mission, if you choose to accept it, is to dive deep into the province_names table and retrieve specific information based on the requirements.

Objective:
Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.

Database Details:

Database Name: hospital.sqlite
Table: province_names
Concepts Covered
To successfully retrieve the desired data, you should be familiar with the following SQL concepts:

ORDER BY: This clause is used to sort the result-set in ascending or descending order based on one or more columns.
CASE: The SQL CASE statement goes through conditions and returns a value when the first condition is met.
Good luck, and happy querying!
*/
SELECT province_name
FROM province_names
ORDER BY 
  CASE 
    WHEN province_name = 'Ontario' THEN 0
    ELSE 1
  END,
province_name ASC;

/*
DAY 42
Tracks with Multiple Genres (chinook database)

Welcome to this SQL lab where you'll be working with the Chinook database to solve various challenges. This lab is designed to test your SQL skills, particularly in SQLite.

Database Schema
Here's a reminder of some of the tables you'll be working with:

Artist: Contains ArtistId and Name.
Album: Contains AlbumId, Title, and ArtistId.
Track: Contains TrackId, Name, AlbumId, and other attributes.
Genre: Contains GenreId and Name.
For the full schema, please refer to the document provided.

Challenges
Objective: Your task is to write a SQL query to identify tracks that appear under more than one genre.

Important: Your output will be compared with the expected output; therefore, please ensure to include all the specified columns, tables and ordering criteria.

Tables Involved: Utilize the Track and Genre tables.

Final Columns: The output should consist of two columns:

Name from the Track table
GenreCount, which is a count of how many genres are associated with each track.
Ordering: The output should be ordered by TrackId.

Hints:

You may need to use JOIN operations between the Track and Genre tables.
Aggregate functions can help in counting the number of genres for each track.
Consider using a GROUP BY clause to aggregate data based on TrackId.
A HAVING clause might be useful to filter tracks appearing in more than one genre.
*/
SELECT t.Name
    , COUNT(*) AS GenreCount
FROM 
    Track t
        JOIN Genre g
            ON t.GenreId = g.GenreId
GROUP BY 
    t.Name
    , t.TrackId
HAVING 
    COUNT(*) > 1
ORDER BY 
    t.TrackId
;

/*
DAY 44
Working with Subqueries

Welcome to this SQL coding lab! The objective is to deepen your understanding of subqueries in SQL using the Chinook dataset. We will focus on incorporating subqueries in the SELECT and WHERE clauses to perform more advanced queries.

Lab Environment
Database: SQLite
Dataset: Chinook
Tables You'll Use
"Album"
"Track"
Challenge Overview
You will be tasked with listing the names of albums from the "Album" table that contain tracks in the "Track" table with "UnitPrice" higher than the average unit price across all available tracks.

Key SQL Concepts
SELECT
WHERE
Subquery
AVG()
Instructions
Explore the Chinook Database: You don't need to download anything. The Chinook database is already set up in your environment. Feel free to explore the "Album" and "Track" tables to familiarize yourself with the data.

Write Your SQL Code: Start writing your query. Make sure to stick to the SQLite syntax, as this lab environment uses SQLite.

Run the Query: Once you're satisfied with your SQL query, go ahead and run it. Make sure it executes without errors and review the output to ensure it meets the challenge criteria.

Submission: Save your final SQL query. Your submission will be automatically evaluated against the correct answer to determine your score.

Challenge
Objective:
Your task is to list the distinct names of albums from the Album table that contain tracks in the Track table with UnitPrice higher than the average unit price across all available tracks. The result should be sorted by AlbumId in ascending order.

Concepts to Master:

SELECT to choose the specific columns: Album.Title.
WHERE to filter records based on conditions.
Subquery to perform a secondary query within the main query for average UnitPrice.
AVG() to calculate the average unit price of all tracks.
Requirements:

Use only the Album and Track tables from the Chinook dataset.
Your query should only display the distinct names of qualifying albums, meaning each album name should appear only once in your result.
The result should be sorted by AlbumId in ascending order.
Utilize a subquery in the WHERE clause to find the average unit price across all tracks. Compare each track's unit price against this average to determine if it exceeds the average.
The output column should be named Title.
*/
SELECT DISTINCT 
    a.Title AS Title
FROM 
    Album a
JOIN 
    Track t ON a.AlbumId = t.AlbumId
WHERE 
    t.UnitPrice > (SELECT AVG(UnitPrice) FROM Track)
ORDER BY 
    a.AlbumId;


/*
DAY 46
Pivoting Rows to Columns with CASE
Hard

Welcome to the SQL practice lab, where you will hone your SQL skills using SQLite and the Chinook dataset. Follow the challenge instructions carefully to complete the lab successfully.

Setup
You don't need to worry about setting up your environment; everything has been pre-configured for you. Your task is to read the challenges and write SQL queries that solve them. Place your queries in the /home/damner/code/query.sql file.

Challenges
Your task is to pivot the "Title" column from the Employee table and count the number of occurrences of each unique title.

Table Used: Employee
Task Description: Pivot the Title column from the Employee table into separate columns for each unique title. Count the number of occurrences for each title and display them in separate columns in your output.
Final Columns: Your output should contain the following columns:
SalesAgentCount: Count of employees with the title 'Sales Support Agent'
SupportAgentCount: Count of employees with the title 'Support Representative'
OtherTitleCount: Count of employees with titles not in ('Sales Support Agent', 'Support Representative')
Order By: Your output should be sorted by SalesAgentCount.
*/
SELECT 
    SUM(CASE WHEN Title = 'Sales Support Agent' 
        THEN 1 ELSE 0 END) AS SalesAgentCount
    , SUM(CASE WHEN Title = 'Support Representative' 
        THEN 1 ELSE 0 END) AS SupportAgentCount
    , SUM(CASE WHEN Title NOT IN ('Sales Support Agent', 'Support Representative') 
        THEN 1 ELSE 0 END) AS OtherTitleCount
FROM 
    Employee
ORDER BY 
    SalesAgentCount
;
/*
DAY 47
Tracks without Purchase (chinook database)
Your primary task will be to test your SQL knowledge and skills on the given challenges using the SQLite database.

Instructions:
Database Schema: Familiarize yourself with the chinook database schema. Ensure you're well-versed with table structures and relationships before attempting the challenges.

The primary tables you'll interact with are:

"Track"
"InvoiceLine"
And others mentioned in the challenges
SQL Syntax: Ensure you use SQLite-compatible SQL syntax. Since this lab is SQLite-specific, any syntax not supported by SQLite will not execute correctly.

Challenge Details: Read each challenge carefully. You must adhere to the expected output, including column names and the order of results. Your results will be compared with the correct answers to determine if you've passed the challenge. Differences in column names or ordering can result in a failed attempt, so attention to detail is crucial.

Using Double Quotes: When referencing table or column names, always use double quotes for clarity, e.g., "Track"."Name".

Ordering Results: Whenever you're attempting a challenge, always pay attention to the ordering criteria. Ensure you include an ORDER BY clause as per the instructions given for each challenge.

Challenge
Objective: Identify tracks in the "Track" table that have never been purchased.

Description: The chinook database is filled with a myriad of tracks. However, some have never been bought by customers. Your objective is to retrieve a list of these tracks.

Expected Tables and Columns:

Tables: "Track", "InvoiceLine"
Output Columns: "Track"."Name"
Ordering Criteria:

Your results should be ordered by "Track"."TrackId".
Hints:

You might find a LEFT JOIN useful between the "Track" and "InvoiceLine" tables. The goal is to focus on tracks where there isn't a corresponding "TrackId" in the "InvoiceLine" table.
/*
SELECT 
    "Track"."Name"
FROM 
    "Track"
LEFT JOIN 
    "InvoiceLine"
ON 
    "Track"."TrackId" = "InvoiceLine"."TrackId"
WHERE 
    "InvoiceLine"."TrackId" IS NULL
ORDER BY 
    "Track"."TrackId"
;

/*
DAY 48
Most Active Customers (chinook database)
This lab consists of challenges, each designed to test your SQL knowledge on different concepts such as sorting, aggregation, joins, and subqueries.

Rules
Make sure to use only SQLite-compatible syntax.
Always use double quotes around table and column names for clarity.
Your query output should exactly match the column names and sorting criteria mentioned in the challenge description.
Challenges
Objective: Write an SQL query to list the top 5 customers who have the highest number of invoices. Your output should show the first names of these customers alongside the count of their invoices.

Tables Involved:

Customer
Invoice
Columns to Display in the Final Output:

Customer.FirstName
InvoiceCount (This is an alias for the invoice count column)
Sorting Criteria:

The results should be sorted by InvoiceCount in descending order.
Constraints:

Use only SQLite supported syntax.
Your query should return exactly 5 rows.
Note: You must use double quotes for table and column names.

Submission
Once you've written your SQL queries, make sure to submit them for evaluation. Ensure your solutions adhere to the challenge rules and guidelines to maximize your chances of passing the lab.
*/

SELECT 
    "Customer"."FirstName"
    , COUNT("Invoice"."InvoiceId") AS "InvoiceCount"
FROM 
    "Customer"
JOIN 
    "Invoice"
ON 
    "Customer"."CustomerId" = "Invoice"."CustomerId"
GROUP BY 
    "Customer"."CustomerId"
ORDER BY 
    "InvoiceCount" DESC
LIMIT 5
;
