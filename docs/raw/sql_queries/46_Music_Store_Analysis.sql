/* 
===========================
 SQL Portfolio Project:
 Music Store Analysis
 Using PostgreSQL | Chinook Sample Database
===========================
*/

/* -----------------------------------------------------
 PROJECT OVERVIEW:
 This project explores a music store dataset using SQL.
 Queries are grouped by difficulty level and cover 
 topics from simple SELECT to complex CTEs and insights.
 ----------------------------------------------------- */
/* =====================================================
 OBJECTIVE:
 - Practice SQL query writing
 - Extract business insights from a normalized DB
 - Demonstrate data analysis skills
 ===================================================== */
/* =====================================================
 SCHEMA USED:
 Tables: customer, employee, invoice, invoiceline,
 track, album, artist, genre
 ===================================================== */
/* =====================================================
  EASY LEVEL QUERIES
 ===================================================== */

--  1. List the names of all customers.
SELECT first_name,last_name FROM customer

--  2. Retrieve the names of all employees and their job titles.
SELECT first_name,last_name,title FROM employee

--  3. Show all the tracks along with their unit prices.
SELECT name,unit_price FROM track

--  4. List all albums with their corresponding artist names.
SELECT t1.title,t2.name FROM album t1
JOIN artist t2
ON t1.artist_id=t2.artist_id

--  5. Find the total number of customers in the database.
SELECT COUNT(customer_id) AS total_customers FROM customer

--  6. List all tracks that are longer than 5 minutes (300,000 milliseconds).
SELECT track_id,name, milliseconds FROM track 
WHERE milliseconds > 300000

--  7. Show the names of playlists and the number of tracks in each playlist.
SELECT t1.name,COUNT(t2.track_id) AS number_of_tracks FROM playlist t1 
JOIN  playlist_track t2 
ON t1.playlist_id=t2.playlist_id
GROUP BY name 

-- 8. List all invoices with customer names and total amount billed.
SELECT t1.customer_id,t1.first_name,t1.last_name,ROUND(sum(t2.total)::numeric,2) AS total_amount_billed FROM customer t1 
JOIN invoice t2 
ON t1.customer_id=t2.customer_id
GROUP BY t1.customer_id

-- 9. Get the list of employees along with the names of their managers.
SELECT e.first_name || ' ' || e.last_name AS EmployeeName,
       m.first_name || ' ' || m.last_name AS ManagerName
FROM employee e
LEFT JOIN employee m ON e.reports_to = m.employee_id

-- 10. Retrieve the top 5 most expensive tracks.
SELECT track_id,name,unit_price FROM track
ORDER BY unit_price DESC LIMIT 5 

/* =====================================================
  MODERATE LEVEL QUERIES
 ===================================================== */

-- 1. Which customer has spent the most money?
SELECT t2.customer_id,t2.first_name,t2.last_name,ROUND(SUM(t1.total)::NUMERIC,2) AS total_money_spent FROM invoice t1
JOIN customer t2 
ON t1.customer_id=t2.customer_id
GROUP BY t2.customer_id ORDER BY total_money_spent
DESC LIMIT 1

-- 2. Which employee has the most customers under them (i.e., whom they support)?
SELECT t1.employee_id,t1.first_name,t1.last_name,COUNT(*) AS total_customer FROM employee t1 
JOIN customer t2 
ON CAST(t1.employee_id AS INTEGER)=t2.support_rep_id
GROUP BY t1.employee_id
ORDER BY total_customer 
DESC LIMIT 1

-- 3. Which track generated the most revenue?
SELECT t1.name ,(t2.unit_price*t2.quantity) AS total_revenue FROM track t1 
JOIN invoice_line t2 
ON t1.track_id=t2.track_id
ORDER BY total_revenue DESC LIMIT 1

-- Q4. What are the top 5 most purchased genres?
SELECT t1.genre_id,t1.name,ROUND(SUM(t4.total)::NUMERIC,3) AS total_money FROM genre t1
JOIN track t2 
ON t1.genre_id=t2.genre_id
JOIN invoice_line t3 
ON t3.track_id =t2.track_id
JOIN invoice t4 
ON t4.invoice_id=t3.invoice_id
GROUP BY t1.genre_id 
ORDER BY total_money DESC LIMIT 5

-- 5. What is the average invoice total per country?
SELECT billing_country,ROUND(AVG(total)::NUMERIC,2) AS avg_invoice_total FROM invoice
GROUP BY billing_country 

-- 6. Which albums contain the most tracks?
SELECT t1.album_id,t1.title,COUNT(t2.track_id) AS num_of_track FROM album t1 
JOIN track t2 
ON t1.album_id=t2.album_id 
GROUP BY t1.album_id
ORDER BY num_of_track DESC LIMIT 1

-- 7. List the top 3 customers in each country by total spending.
SELECT *FROM (
    SELECT 
        t1.customer_id,
        t1.first_name,
        t1.last_name,
        t2.billing_country,
        SUM(t2.total) AS total_spent,
        RANK() OVER (PARTITION BY t2.billing_country ORDER BY SUM(t2.total) DESC) AS rank
    FROM 
        customer t1
    JOIN 
        invoice t2 ON t1.customer_id = t2.customer_id
    GROUP BY 
        t1.customer_id, t1.first_name, t1.last_name, t2.billing_country
)  ranked
WHERE rank <= 3

/* =====================================================
  ADVANCED LEVEL QUERIES
 ===================================================== 
This section contains advanced-level SQL queries written on the Music Store database. 
The questions explore deeper business insights using advanced SQL techniques like:
  - Common Table Expressions (CTEs)
  - Window Functions
  - Nested Subqueries
  - Set Operations (UNION, INTERSECT, EXCEPT)
  - Ranking and Partitioning

*/

-- 1. Which albums have more tracks than the average number of tracks per album?
SELECT 
    a.album_id, 
    COUNT(t.track_id) AS track_count
FROM 
    album a
JOIN 
    track t ON a.album_id = t.album_id
GROUP BY 
    a.album_id
HAVING 
    COUNT(t.track_id) > (
        SELECT AVG(track_count)
        FROM (
            SELECT COUNT(*) AS track_count
            FROM track
            GROUP BY album_id
        ) AS album_track_counts  
    )

-- 2. List the top 3 customers per country by their total purchases.
SELECT *
FROM (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        c.country,
        SUM(i.total) AS total_spent,
        RANK() OVER (PARTITION BY c.country ORDER BY SUM(i.total) DESC) AS country_rank
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.country
) ranked
WHERE country_rank <= 3;

-- 3. Identify tracks that have never been purchased.
SELECT * FROM track t1
LEFT JOIN invoice_line t2 
ON t1.track_id=t2.track_id
WHERE t1.track_id IS NULL 

-- 4. Find the invoice(s) with the highest total amount.
SELECT invoice_id,total FROM invoice 
WHERE total = (SELECT MAX(total) FROM invoice)
              
-- 5. Which genre has the highest average track price?
SELECT t1.genre_id,t2.name,ROUND(AVG(unit_price)::NUMERIC,2) AS avg_track_price FROM track t1
JOIN genre t2 
ON t1.genre_id=t2.genre_id
GROUP BY t1.genre_id,t2.name
ORDER BY avg_track_price DESC LIMIT 1

-- 6. Show all customers who have purchased tracks from more than 5 different genres.
SELECT t1.customer_id, COUNT(DISTINCT t4.genre_id) AS num_of_distinct_genres
FROM customer t1 
JOIN invoice t2 ON t1.customer_id = t2.customer_id
JOIN invoice_line t3 ON t2.invoice_id = t3.invoice_id
JOIN track t4 ON t3.track_id = t4.track_id
GROUP BY t1.customer_id
HAVING COUNT(DISTINCT t4.genre_id) > 5

-- 7 Which artists have their tracks in more than 3 genres?
SELECT t1.artist_id,t1.name AS artist_name,
    COUNT(DISTINCT t4.genre_id) AS genre_count
FROM  artist t1
JOIN album t2 ON t1.artist_id = t2.artist_id

JOIN track t3 ON t2.album_id = t3.album_id
JOIN genre t4 ON t3.genre_id = t4.genre_id
GROUP BY 
    t1.artist_id, t1.name
HAVING COUNT(DISTINCT t4.genre_id) > 3

-- 9. List the customers who have spent above the average total amount across all customers.
with t1 as (
select 
    t2.customer_id,
    t2.first_name,
    t2.last_name,
    sum(t3.total) as total_spent
from 
    customer t2
    join invoice t3 on t2.customer_id = t3.customer_id
group by 
    t2.customer_id, t2.first_name, t2.last_name
),
t4 as (
    select avg(total_spent) as avg_spent from t1
)
select 
    customer_id,
    first_name,
    last_name,
    total_spent
from 
    t1
where 
    total_spent > (select avg_spent from t4)

-- 10. Find the top artist by total number of tracks released.
with t1 as (
select 
    t2.artist_id,
    t2.name as artist_name,
    count(t4.track_id) as total_tracks
from 
    artist t2
    join album t3 on t2.artist_id = t3.artist_id
    join track t4 on t3.album_id = t4.album_id
group by 
    t2.artist_id, t2.name
)
select 
    artist_id,
    artist_name,
    total_tracks
from 
    t1
order by 
    total_tracks desc
limit 1

/* =====================================================
  EXPERT/BEYOND-HARD LEVEL QUERIES
 ===================================================== */







/* =====================================================
  BUSINESS INSIGHTS SUMMARY
 ===================================================== */

-- All tracks in the database have been purchased at least once.
-- Customers from USA and Canada have highest spending.
-- Rock is the most purchased genre overall.
-- The top artist has over 200 tracks in the system.
-- All employees contribute to customer engagement and sales.
-- No artist in this dataset remains completely unpurchased.



/* =====================================================
  END OF PROJECT
 ===================================================== */



