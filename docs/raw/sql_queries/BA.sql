--Tracks Sold and % of Total Tracks Sold by Genre

SELECT
    g.Name AS genre
  , COUNT(ii.TrackID) AS tracks_sold
  , CAST(COUNT(ii.TrackID) AS FLOAT) / CAST(
      (
        SELECT
           COUNT(*) AS tracks_count
           FROM invoice_items AS ii
           LEFT JOIN invoices AS i
           ON i.InvoiceID = ii.InvoiceID
           LEFT JOIN customers AS c
           ON c.CustomerID = i.CustomerID
           WHERE c.Country = 'USA'
       ) 
       AS FLOAT) AS pct_sold
FROM invoice_items AS ii
LEFT JOIN tracks AS t
ON t.TrackID = ii.TrackID
LEFT JOIN genres AS g
ON g.GenreID = t.GenreID
LEFT JOIN invoices AS i
ON i.InvoiceID = ii.InvoiceID
LEFT JOIN customers AS c
ON c.CustomerID = i.CustomerID
WHERE c.Country = 'USA'
GROUP BY 1
ORDER BY 2 DESC;


--Dollar Sales by Employee
SELECT
    e.FirstName || ' ' || e.LastName AS employee_name
  , SUM(UnitPrice) AS total_sales
FROM invoice_items AS ii
LEFT JOIN invoices AS i
ON i.InvoiceID = ii.InvoiceID
LEFT JOIN customers AS c
ON c.CustomerID = i.CustomerID
LEFT JOIN employees AS e
ON e.EmployeeID = c.SupportRepID
WHERE e.Title = 'Sales Support Agent'
GROUP BY 1
ORDER BY 2 DESC;

--final query
WITH
tcs AS 
  (
    SELECT 
      c.CustomerID AS customer_id
      , SUM(ii.UnitPrice) AS total_sales
    FROM invoice_items AS ii
    LEFT JOIN Invoices AS i
    ON i.InvoiceID = ii.InvoiceID
    LEFT JOIN Customers AS c
    ON c.CustomerID = i.CustomerID
    GROUP BY 1
  ),
    
iamt AS 
  (
    SELECT 
      i.InvoiceID AS invoice_id
      , i.CustomerID AS customer_id
      , SUM(ii.UnitPrice) AS order_amount
    FROM invoice_items as ii
    LEFT JOIN invoices AS i
    ON ii.InvoiceID = i.InvoiceID
    GROUP BY 1
  ),
    
iavg AS 
  (
    SELECT
        iamt.customer_id
      , AVG(iamt.order_amount) AS avg_inv_amt
    FROM iamt
    GROUP BY 1
  )
  
SELECT
  c.Country AS country
  , COUNT(c.customerID) AS customer_count
  , SUM(tcs.total_sales) AS total_sales
  , ROUND(SUM(tcs.total_sales)/CAST(COUNT(c.customerID) AS FLOAT),2) AS avg_sales_customer
  , ROUND(AVG(iavg.avg_inv_amt),2) AS avg_order_amt
FROM customers AS c
LEFT JOIN tcs
ON tcs.customer_id = c.CustomerID
LEFT JOIN iavg
ON iavg.customer_id = c.CustomerID
GROUP BY 1
ORDER BY 3 DESC;

SELECT
  Name AS artist_name
FROM artists
GROUP BY 1;