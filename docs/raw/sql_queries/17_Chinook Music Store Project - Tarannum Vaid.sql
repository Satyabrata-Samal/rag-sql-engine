-- Objective Questions
-- q1.	does any table have missing values or duplicates? if yes how would you handle it ?
-- album table
-- check for duplicates
select album_id, title, artist_id, count(*) as duplicate_count
from album
group by album_id, title, artist_id
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when album_id is null then 1 else 0 end) as null_album_id,
    sum(case when title is null then 1 else 0 end) as null_title,
    sum(case when artist_id is null then 1 else 0 end) as null_artist_id
from album;

-- artist table
-- check for duplicates
select artist_id, name, count(*) as duplicate_count
from artist
group by artist_id, name
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when artist_id is null then 1 else 0 end) as null_artist_id,
    sum(case when name is null then 1 else 0 end) as null_name
from artist;

-- customer table
-- check for duplicates
select customer_id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id, count(*) as duplicate_count
from customer
group by customer_id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when customer_id is null then 1 else 0 end) as null_customer_id,
    sum(case when first_name is null then 1 else 0 end) as null_first_name,
    sum(case when last_name is null then 1 else 0 end) as null_last_name,
    sum(case when company is null then 1 else 0 end) as null_company,
    sum(case when address is null then 1 else 0 end) as null_address,
    sum(case when city is null then 1 else 0 end) as null_city,
    sum(case when state is null then 1 else 0 end) as null_state,
    sum(case when country is null then 1 else 0 end) as null_country,
    sum(case when postal_code is null then 1 else 0 end) as null_postal_code,
    sum(case when phone is null then 1 else 0 end) as null_phone,
    sum(case when fax is null then 1 else 0 end) as null_fax,
    sum(case when email is null then 1 else 0 end) as null_email,
    sum(case when support_rep_id is null then 1 else 0 end) as null_support_rep_id
from customer;

-- employee table
-- check for duplicates
select employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email, count(*) as duplicate_count
from employee
group by employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when employee_id is null then 1 else 0 end) as null_employee_id,
    sum(case when last_name is null then 1 else 0 end) as null_last_name,
    sum(case when first_name is null then 1 else 0 end) as null_first_name,
    sum(case when title is null then 1 else 0 end) as null_title,
    sum(case when reports_to is null then 1 else 0 end) as null_reports_to,
    sum(case when birthdate is null then 1 else 0 end) as null_birthdate,
    sum(case when hire_date is null then 1 else 0 end) as null_hire_date,
    sum(case when address is null then 1 else 0 end) as null_address,
    sum(case when city is null then 1 else 0 end) as null_city,
    sum(case when state is null then 1 else 0 end) as null_state,
    sum(case when country is null then 1 else 0 end) as null_country,
    sum(case when postal_code is null then 1 else 0 end) as null_postal_code,
    sum(case when phone is null then 1 else 0 end) as null_phone,
    sum(case when fax is null then 1 else 0 end) as null_fax,
    sum(case when email is null then 1 else 0 end) as null_email
from employee;

-- genre table
-- check for duplicates
select genre_id, name, count(*) as duplicate_count
from genre
group by genre_id, name
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when genre_id is null then 1 else 0 end) as null_genre_id,
    sum(case when name is null then 1 else 0 end) as null_name
from genre;

-- invoice table
-- check for duplicates
select invoice_id, customer_id, invoice_date, billing_address, billing_city, billing_state, billing_country, billing_postal_code, total, count(*) as duplicate_count
from invoice
group by invoice_id, customer_id, invoice_date, billing_address, billing_city, billing_state, billing_country, billing_postal_code, total
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when invoice_id is null then 1 else 0 end) as null_invoice_id,
    sum(case when customer_id is null then 1 else 0 end) as null_customer_id,
    sum(case when invoice_date is null then 1 else 0 end) as null_invoice_date,
    sum(case when billing_address is null then 1 else 0 end) as null_billing_address,
    sum(case when billing_city is null then 1 else 0 end) as null_billing_city,
    sum(case when billing_state is null then 1 else 0 end) as null_billing_state,
    sum(case when billing_country is null then 1 else 0 end) as null_billing_country,
    sum(case when billing_postal_code is null then 1 else 0 end) as null_billing_postal_code,
    sum(case when total is null then 1 else 0 end) as null_total
from invoice;

-- invoice_line table
-- check for duplicates
select invoice_line_id, invoice_id, track_id, unit_price, quantity, count(*) as duplicate_count
from invoice_line
group by invoice_line_id, invoice_id, track_id, unit_price, quantity
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when invoice_line_id is null then 1 else 0 end) as null_invoice_line_id,
    sum(case when invoice_id is null then 1 else 0 end) as null_invoice_id,
    sum(case when track_id is null then 1 else 0 end) as null_track_id,
    sum(case when unit_price is null then 1 else 0 end) as null_unit_price,
    sum(case when quantity is null then 1 else 0 end) as null_quantity
from invoice_line;

-- media table
-- check for duplicates
select media_type_id, name, count(*) as duplicate_count
from media_type
group by media_type_id, name
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when media_type_id is null then 1 else 0 end) as null_media_type_id,
    sum(case when name is null then 1 else 0 end) as null_name
from media_type;

-- playlist table
-- check for duplicates
select playlist_id, name, count(*) as duplicate_count
from playlist
group by playlist_id, name
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when playlist_id is null then 1 else 0 end) as null_playlist_id,
    sum(case when name is null then 1 else 0 end) as null_name
from playlist;

-- playlist_track table
-- check for duplicates
select playlist_id, track_id, count(*) as duplicate_count
from playlist_track
group by playlist_id, track_id
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when playlist_id is null then 1 else 0 end) as null_playlist_id,
    sum(case when track_id is null then 1 else 0 end) as null_track_id
from playlist_track;

-- track table
-- check for duplicates
select track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price, count(*) as duplicate_count
from track
group by track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price
having count(*) > 1;

-- count nulls for each column
select 
    sum(case when track_id is null then 1 else 0 end) as null_track_id,
    sum(case when name is null then 1 else 0 end) as null_name,
    sum(case when album_id is null then 1 else 0 end) as null_album_id,
    sum(case when media_type_id is null then 1 else 0 end) as null_media_type_id,
    sum(case when genre_id is null then 1 else 0 end) as null_genre_id,
    sum(case when composer is null then 1 else 0 end) as null_composer,
    sum(case when milliseconds is null then 1 else 0 end) as null_milliseconds,
    sum(case when bytes is null then 1 else 0 end) as null_bytes,
    sum(case when unit_price is null then 1 else 0 end) as null_unit_price
from track;

-- q2. find the top-selling tracks and top artist in the usa and identify their most famous genres.
select t.name as track_name, ar.name as artist_name, g.name as genre_name, sum(il.quantity) as total_sold
from invoice_line il
inner join invoice i on il.invoice_id = i.invoice_id
inner join track t on il.track_id = t.track_id
inner join album a on t.album_id = a.album_id
inner join artist ar on a.artist_id = ar.artist_id
inner join genre g on t.genre_id = g.genre_id
where i.billing_country = 'usa'
group by t.track_id
order by sum(il.quantity) desc
limit 1;
-- Q3.	What is the customer demographic breakdown (age, gender, location) of Chinook's customer base?
select
    country,
    state,
    city,
    count(*) as customer_count
from customer
group by country, state, city
order by country, state, city;

-- Q4.	Calculate the total revenue and number of invoices for each country, state, and city:
select billing_country, billing_state, billing_city, count(*) as num_invoices, sum(total) as total_revenue
from invoice
group by billing_country, billing_state, billing_city;

-- Q5. Find the top 5 customers by total revenue in each country
select c.country, c.customer_id, c.first_name, c.last_name, sum(i.total) as total_revenue
from customer c
inner join invoice i on c.customer_id = i.customer_id
group by c.country, c.customer_id, c.first_name, c.last_name
order by total_revenue desc
limit 5;

-- Q6. Identify the top-selling track for each customer
select
    c.customer_id,
    c.first_name,
    c.last_name,
    max(t.name) as top_track,
    max(il.quantity) as max_quantity_sold
from customer c
inner join invoice i on c.customer_id = i.customer_id
inner join invoice_line il on i.invoice_id = il.invoice_id
inner join track t on il.track_id = t.track_id
group by c.customer_id, c.first_name, c.last_name;

-- Q7. Are there any patterns or trends in customer purchasing behavior (e.g., frequency of purchases, preferred payment methods, average order value)?
-- count the number of invoices per customer
select
    c.customer_id,
    c.first_name,
    c.last_name,
    count(*) as total_invoices,
    avg(i.total) as average_order_value
from customer c
inner join invoice i on c.customer_id = i.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_invoices desc;

-- avg order value
select
    c.customer_id,
    c.first_name,
    c.last_name,
    count(*) as total_orders,
    avg(i.total) as average_order_value
from customer c
inner join invoice i on c.customer_id = i.customer_id
group by c.customer_id, c.first_name, c.last_name
order by average_order_value desc;

-- Q8. What is the customer churn rate?
-- calculations based on an assumption of 6 months that the customer stopped purchasing
select 
count(*) as num_churned_customers
from customer c
where c.customer_id not in (
select distinct i.customer_id
from invoice i
where i.invoice_date >= date_sub(now(), interval 6 month)
);

-- Q9.	Calculate the percentage of total sales contributed by each genre in the USA and identify the best-selling genres and artists.
select g.name as genre_name, sum(il.quantity) as total_sold, sum(il.quantity) / (select sum(il.quantity) 
from invoice_line il 
inner join invoice i on il.invoice_id = i.invoice_id where i.billing_country = 'usa') * 100 as percentage_sales
from invoice_line il
inner join invoice i on il.invoice_id = i.invoice_id
inner join track t on il.track_id = t.track_id
inner join genre g on t.genre_id = g.genre_id
where i.billing_country = 'usa' group by g.name
order by total_sold desc;

-- Q10.	Find customers who have purchased tracks from at least 3 different genres
select c.customer_id, c.first_name, c.last_name
from customer c
inner join (
select i.customer_id from invoice_line il
inner join invoice i on il.invoice_id = i.invoice_id
inner join track t on il.track_id = t.track_id
group by i.customer_id
having count(distinct t.genre_id) >= 3
) as cust_genres on c.customer_id = cust_genres.customer_id;

-- Q11. Rank genres based on their sales performance in the USA
select g.name as genre_name, sum(il.quantity) as total_sold, rank() over (order by sum(il.quantity) desc) as sales_rank
from invoice_line il
inner join invoice i on il.invoice_id = i.invoice_id
inner join track t on il.track_id = t.track_id
inner join genre g on t.genre_id = g.genre_id
where i.billing_country = 'usa' group by g.name
order by total_sold desc;

-- Q12. Identify customers who have not made a purchase in the last 3 months
select c.customer_id, c.first_name, c.last_name
from customer c
where c.customer_id not in (select distinct i.customer_id
from invoice I where i.invoice_date >= date_sub(now(), interval 3 month)
);


-- Subjective Questions
-- 1.	Recommend the three albums from the new record label that should be prioritised for advertising and promotion in the USA based on genre sales analysis.
Select a.album_id, a.title as album_title, count(il.invoice_line_id) as total_sales
from album a
join track t on a.album_id = t.album_id
join genre g on t.genre_id = g.genre_id
join invoice_line il on t.track_id = il.track_id
join invoice i on il.invoice_id = i.invoice_id
join customer c on i.customer_id = c.customer_id
where c.country = 'usa' group by a.album_id, a.title
order by total_sales desc
limit 3;

-- 2.	Determine the top-selling genres in countries other than the USA and identify any commonalities or differences.
select country, genre_name, total_sales
from (select c.country, g.name as genre_name, count(il.invoice_line_id) as total_sales, row_number() over (partition by c.country order by count(il.invoice_line_id) desc) as genre_rank
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line il on i.invoice_id = il.invoice_id
join track t on il.track_id = t.track_id
join genre g on t.genre_id = g.genre_id
where c.country != 'usa'
group by c.country, g.name) as ranked_genres
where genre_rank = 1
order by country;


-- 3.	Customer Purchasing Behavior Analysis: How do the purchasing habits (frequency, basket size, spending amount) of long-term customers differ from those of new customers? What insights can these patterns provide about customer loyalty and retention strategies?
select case when tenure >= 365 then 'long-term' else 'new' end as customer_type,
count(distinct customer_id) as num_customers, avg(total) as avg_order_value, avg(quantity) as avg_tracks_per_order
from (select c.customer_id, datediff(max(i.invoice_date), min(i.invoice_date)) as tenure, sum(i.total) as total, sum(il.quantity) as quantity
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line il on i.invoice_id = il.invoice_id
group by c.customer_id
) as customer_summary
group by case when tenure >= 365 then 'long-term' else 'new' end;

-- 4.	Product Affinity Analysis: Which music genres, artists, or albums are frequently purchased together by customers? How can this information guide product recommendations and cross-selling initiatives?
select t.genre_id, g.name as genre_name, count(*) as frequency
from invoice_line il1
join invoice_line il2 on il1.invoice_id = il2.invoice_id and il1.track_id != il2.track_id
join track t on il2.track_id = t.track_id
join genre g on t.genre_id = g.genre_id
group by t.genre_id, g.name order by frequency desc;

-- 5.	Regional Market Analysis: Do customer purchasing behaviors and churn rates vary across different geographic regions or store locations? How might these correlate with local demographic or economic factors?
select c.country, avg(i.total) as avg_total_spent, count(distinct c.customer_id) as num_customers, avg(il.quantity) as avg_tracks_per_customer
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line il on i.invoice_id = il.invoice_id
group by c.country;

-- 6.	Customer Risk Profiling: Based on customer profiles (age, gender, location, purchase history), which customer segments are more likely to churn or pose a higher risk of reduced spending? What factors contribute to this risk?
select case when tenure < 365 then 'new customer' when total_spent < 100 then 'low spender' else 'regular spender' 
end as customer_segment, count(*) as num_customers, avg(total_spent) as avg_total_spent
from (select c.customer_id, sum(i.total) as total_spent, datediff(max(i.invoice_date), min(i.invoice_date)) as tenure
from customer c
join invoice i on c.customer_id = i.customer_id
group by c.customer_id) as customer_summary
group by customer_segment;

-- 7.	Customer Lifetime Value Modeling: How can you leverage customer data (tenure, purchase history, engagement) to predict the lifetime value of different customer segments? This could inform targeted marketing and loyalty program strategies. Can you observe any common characteristics or purchase patterns among customers who have stopped purchasing?
-- Calculate basic CLV metrics and identify at-risk customers

-- Step 1: Calculate historical CLV metrics
select c.customer_id, count(distinct i.invoice_id) as total_orders, sum(i.total) as total_revenue, avg(i.total) as average_order_value, 
datediff(max(i.invoice_date), min(i.invoice_date)) as customer_tenure_days, datediff(now(), max(i.invoice_date)) as days_since_last_purchase, 
case when datediff(now(), max(i.invoice_date)) > 365 then 'inactive > 1 year' when datediff(now(), max(i.invoice_date)) > 180 then 'inactive > 6 months' 
when datediff(now(), max(i.invoice_date)) > 90 then 'inactive > 3 months' else 'active' end as customer_status 
from customer c
left join invoice i on c.customer_id = i.customer_id
group by c.customer_id;

-- Step 2: Identify at-risk customers (churn analysis) (assumed days since last purchase as 90)
select c.customer_id, count(distinct i.invoice_id) as total_orders, sum(i.total) as total_revenue, avg(i.total) as average_order_value, 
datediff(max(i.invoice_date), min(i.invoice_date)) as customer_tenure_days, datediff(now(), max(i.invoice_date)) as days_since_last_purchase, 
case when datediff(now(), max(i.invoice_date)) > 365 then 'inactive > 1 year' when datediff(now(), max(i.invoice_date)) > 180 then 'inactive > 6 months' 
when datediff(now(), max(i.invoice_date)) > 90 then 'inactive > 3 months' else 'active' end as customer_status
from customer c
left join invoice i on c.customer_id = i.customer_id
group by c.customer_id having datediff(now(), max(i.invoice_date)) > 90;

-- 8.	If data on promotional campaigns (discounts, events, email marketing) is available, how could you measure their impact on customer acquisition, retention, and overall sales?
select promotion_type, count(distinct case when acquisition = 1 then customer_id end) as num_customers_acquired, 
count(distinct case when retention = 1 then customer_id end) as num_customers_retained, sum(total) as total_sales_during_promotion
from (select i.invoice_id, i.total, case when i.invoice_date between 'start_date' and 'end_date' then 1 else 0 end as acquisition, 
case when i.invoice_date between 'start_date' and 'end_date' then 1 else 0 end as retention, 
case when i.invoice_date between 'start_date' and 'end_date' then 'promotion_type' else 'no promotion' end as promotion_type, customer_id from invoice i
) as promotion_impact
group by promotion_type;

-- 10.	How can you alter the "Albums" table to add a new column named "ReleaseYear" of type INTEGER to store the release year of each album?
alter table album
add column releaseyear integer;

-- 11.	Chinook is interested in understanding the purchasing behavior of customers based on their geographical location. They want to know the average total amount spent by customers from each country, along with the number of customers and the average number of tracks purchased per customer. Write an SQL query to provide this information.
select c.country, count(distinct c.customer_id) as num_customers, avg(i.total) as avg_total_amount, avg(il.quantity) as avg_tracks_purchased_per_customer 
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line il on i.invoice_id = il.invoice_id
group by c.country;
