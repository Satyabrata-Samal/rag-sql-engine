/*  Day 9.[04-11-2023]: Distinct city names (chinook database)

Easy

Fetch unique customer cities in alphabetical orde
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

Good luck, and happy querying! */


SELECT  DISTINCT City
FROM Customer
ORDER BY city ASC;
