use MelodyDB
-- ==================================================
-- 🗃️ CHINOOK MUSIC STORE ANALYTICS – SQL PROJECT
-- Author: Fezi
-- Description: Business insights using SQL queries
-- ==================================================

-- =========================================
-- 🔹 1. Top-Selling Genre by Revenue
-- =========================================
select 
    G.Name as Genre_name,sum(Inl.UnitPrice) as total_revenue
from Genre G
left join Track T on T.GenreId=G.GenreId
left join InvoiceLine Inl on Inl.TrackId=T.TrackId
group by G.Name
order by total_revenue desc;

-- =========================================
-- 🔹 2. Top 5 Customers Who Spent the Most
-- =========================================
select 
    Top 5 CONCAT(C.FirstName,C.LastName) as CustomerName,
	sum(Invoice.Total)  as TotalSpent,
	C.Country as Country
from Customer C
left join Invoice 
on Invoice.CustomerId=C.CustomerId
group by C.FirstName,C.LastName,C.Country
order by TotalSpent desc ;

-- =========================================
-- 🔹 3. Monthly Revenue Trend Analysis
-- =========================================
SELECT 
    CAST(YEAR(Inv.InvoiceDate) AS VARCHAR) + '-' + CAST(MONTH(Inv.InvoiceDate) AS VARCHAR) AS YearMonth,
    COUNT(Inv_line.UnitPrice*Inv_line.Quantity) AS Revenue
from Invoice Inv
left join InvoiceLine Inv_line on Inv.InvoiceId=Inv_line.InvoiceId
group by 
  YEAR(InvoiceDate),
  MONTH(InvoiceDate)
order by 
  YEAR(InvoiceDate),
  MONTH(InvoiceDate);

-- =========================================
-- 🔹 4. Top 5 Artists by Tracks Sold
-- ========================================
select 
    top 5(ART.Name) as Artist,
    count(InvoiceLine.Quantity) as Total_Tracks_Sold
from Artist ART
left join Album on ART.ArtistId=Album.ArtistId
left join Track on Album.AlbumId=Track.AlbumId
left join InvoiceLine on InvoiceLine.TrackId=Track.TrackId
group by ART.Name
order by Total_Tracks_Sold desc; 

-- =========================================
-- 🔹 5. Revenue by Country (Excluding USA)
-- =========================================
select 
    Cus.City as City_name,
    sum(InvoiceLine.UnitPrice*InvoiceLine.Quantity) as Revenue
from Customer Cus
left join Invoice Inv on Inv.CustomerId=Cus.CustomerId
left join InvoiceLine on InvoiceLine.InvoiceId=Inv.InvoiceId
where Cus.Country <> 'USA'
group by City

-- =========================================
-- 🔹 6. Albums with Most Number of Tracks
-- =========================================
select 
    Title  as AlbumTitle, count(Track.AlbumId) as TrackCount
from Album
left join Track on Album.AlbumId=Track.AlbumId
group by Title
order by TrackCount desc 

-- =========================================
-- 🔹 7. Customer Purchase Segmentation
-- =========================================
select 
    CONCAT(Cus.FirstName, ' ',Cus.LastName) as CustomerName,
    count(Inv.InvoiceId) as PurchaseCount,
    case 
        when count(Inv.InvoiceId)>1 then 'multiple purchases'
	    else 'one-time buyers'
    end as Purchase_type
from Customer Cus
left join Invoice Inv on Cus.CustomerId=Inv.CustomerId
group by CONCAT(Cus.FirstName, ' ',Cus.LastName)

-- =========================================
-- 🔹 8. Revenue Growth Year Over Year (YoY)
-- =========================================
/*YoY Growth = [(Current Period Value - Last Period Value) / Last Period Value] * 100*/
WITH year_revenue AS (
  select 
      CAST(YEAR(Inv.InvoiceDate) AS VARCHAR) as year,
      sum(Inv_line.UnitPrice*Inv_line.Quantity) as revenue
from Invoice Inv
left join InvoiceLine Inv_line on Inv.InvoiceId=Inv_line.InvoiceId
group by CAST(YEAR(Inv.InvoiceDate) AS VARCHAR)
)
select 
    year,
    revenue,
    ROUND(
        ((revenue - LAG(revenue) OVER (ORDER BY year)) * 100.0) / 
        LAG(revenue) OVER (ORDER BY year), 2
    ) AS YoY_growthfrom
from year_revenue

-- =========================================
-- 🔹 9. Unique Genres per Playlist
-- =========================================
select 
    G.Name,
    count(DISTINCT(G.Name)) as GenreCount
from Genre G
left join Track on Track.GenreId=G.GenreId
left join PlaylistTrack on PlaylistTrack.TrackId=Track.TrackId
left join Playlist on Playlist.PlaylistId=PlaylistTrack.PlaylistId
group by G.Name
order by GenreCount desc 

-- =========================================
-- 🔹 10. Longest Track by Duration (Per Genre)
-- =========================================
select 
    T.Name as TrackName,
    G.Name as Genre,
    MAX(T.Milliseconds) as Duration
from Track T
left join Genre G on G.GenreId=T.GenreId
group by T.Name,G.Name
order by Duration desc