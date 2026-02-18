/* Customers Without Invoices (chinook database)
Medium

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
Make sure to handle cases where there may be no matching records in the Invoice table for a Customer. 
Your query should explicitly mention all column names and tables involved.  */



-- enter your SQL query here
-- use the SQL editor UI in browser to browse the SQL database


SELECT c.FirstName, c.LastName
FROM Customer AS c
LEFT JOIN Invoice AS i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL
ORDER BY c.CustomerId;
