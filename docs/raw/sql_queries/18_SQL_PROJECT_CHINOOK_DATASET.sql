-- USE chinook

-- Question 1 <List all the customers:

SELECT * FROM customer;

-- Question 2 < Retrieve the names and emails of all customers:

SELECT FirstName,Email FROM customer;

-- Question 3 < Find all tracks with a unit price greater than $0.99:

SELECT * FROM track WHERE UnitPrice > 0.99;

-- Question 4 < List the total number of invoices:

SELECT COUNT(*) FROM invoice;

-- Question 5 < Find the names of all customers along with the total number of invoices they have:

SELECT 
    customer.FirstName, 
    COUNT(invoice.InvoiceId) AS TotalInvoices
FROM 
    customer
LEFT JOIN 
    invoice ON customer.CustomerId = invoice.CustomerId
GROUP BY 
    customer.CustomerId,customer.FirstName;


-- Question 6 < Get the names of all playlists and the number of tracks in each playlist:

SELECT playlist.Name,COUNT(*) FROM playlist
LEFT JOIN playlisttrack
ON playlist.PlaylistId = playlisttrack.PlaylistId
GROUP BY playlist.Name;


-- Question 7 < Find the top 5 customers who have spent the most money:


SELECT customer.FirstName,customer.customerId,SUM(Total) AS num FROM invoice 
JOIN customer 
ON customer.CustomerId = invoice.customerId
GROUP BY invoice.CustomerId,customer.FirstName
ORDER BY num DESC
LIMIT 5;


-- Question 8 < Retrieve the list of employees who have been support reps for customers, along with the total number of customers they support:


SELECT 
    employee.FirstName, 
    employee.LastName, 
    COUNT(customer.CustomerId) AS TotalCustomers
FROM 
    employee
JOIN 
    customer ON employee.EmployeeId = customer.SupportRepId
GROUP BY 
    employee.EmployeeId,employee.FirstName, 
    employee.LastName;


-- Question 9 < Find the genres that have the most tracks and the count of tracks for each genre:

SELECT Genre.Name,track.GenreId,COUNT(*) FROM track 
JOIN Genre
ON track.GenreId = Genre.GenreId
GROUP BY GenreId,Genre.Name;


-- Question 10 < Calculate the average invoice total for each country:

SELECT BillingCountry,AVG(Total) FROM invoice
GROUP BY BillingCountry;

-- Question 11 < Get the names of the artists who have more than 5 albums:
SELECT 
    artist.Name, 
    COUNT(album.AlbumId) AS TotalAlbums
FROM 
    artist
JOIN 
    album ON artists.ArtistId = albums.ArtistId
GROUP BY 
    artist.ArtistId
HAVING 
    COUNT(album.AlbumId) > 5;

-- Question 12 < Identify the month and year with the highest total sales:

SELECT  DATE_FORMAT(InvoiceDate, '%Y-%m') AS YearMonth,Sum(Total) AS total FROM invoice
GROUP BY InvoiceDate,YearMonth
ORDER BY total DESC LIMIT 1;


-- Question 13 < Find all tracks that are in more than 3 playlists:

SELECT 
    track.Name, 
    COUNT(playlisttrack.PlaylistId) AS PlaylistCount
FROM 
    track
JOIN 
    playlisttrack ON track.TrackId = playlisttrack.TrackId
GROUP BY 
    track.TrackId,track.Name
HAVING 
    PlaylistCount > 3;

-- Question 14 < List all the tracks that belong to the 'Pop' genre:

SELECT 
    track.Name AS TrackName
FROM 
    track
JOIN 
    genre ON track.GenreId = genre.GenreId
WHERE 
    genre.Name = 'Pop';

-- Question 15 < Retrieve the details of all employees who report to a manager (SupportRepId is not NULL):

SELECT * FROM employee
WHERE ReportsTo IS NULL;

-- Question 16 < List the names of all customers from the USA:

SELECT * FROM customer
WHERE Country = 'USA';

-- Question 17 < Find the average length of all tracks:

SELECT AVG(Milliseconds) / 60000.0 AS AvgTrackLengthMinutes FROM track ;

-- Question 18 < Get the details of the invoice with the highest total:

SELECT MAX(Total) FROM invoice ;

-- Question 19 < Find the total sales for each customer by summing their invoices:

SELECT Customer.CustomerId,SUM(Total) FROM customer
JOIN invoice
ON customer.CustomerId = invoice.CustomerId
GROUP BY Customer.CustomerId ;


-- Question 20 < Identify the most popular media type by the number of tracks:

SELECT 
    mediatype.Name AS MediaTypeName, 
    COUNT(track.TrackId) AS TotalTracks
FROM 
    mediatype
JOIN 
    track ON mediatype.MediaTypeId = track.MediaTypeId
GROUP BY 
    mediatype.MediaTypeId,MediaTypeName
ORDER BY 
    TotalTracks DESC
LIMIT 1;
