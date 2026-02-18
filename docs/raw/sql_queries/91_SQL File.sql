-- OBJECTIVE QUESTIONS SOLUTIONS






-- 1.Missing Value Handling

update customer
set company='Unknown'
where company is NULL;

update customer
set state='Unknown'
where state is NULL;

update customer
set postal_code='Unknown'
where postal_code is NULL;

update customer
set phone='Unknown'
where phone is NULL;

update customer
set fax='Unknown'
where fax is NULL;


update track
set composer='Unknown'
where composer is NULL;




-- 2. top selling tracks and top artist in the USA and identify their most famous genres

-- top selling track

with topSellingTrack
as
(select track_id,count(invoice_line_id) as sales_count from invoice i 
left join invoice_line i1 on i.invoice_id=i1.invoice_id
where billing_country='USA'
group by track_id
order by sales_count desc
limit 10)

select t.name,sales_count from topSellingTrack ts
join track t on ts.track_id=t.track_id;

-- top selling artist


with topAlbum
as
(select album_id,count(invoice_line_id) as albumSales from invoice_line i 
join track t on i.track_id=t.track_id
join invoice i1 on i.invoice_id=i1.invoice_id
where billing_country='USA'
group by album_id)

select aa.name,sum(albumSales) as artistSale from topAlbum ta
join album a on ta.album_id=a.album_id
join artist aa on a.artist_id=aa.artist_id
group by aa.name
order by artistSale desc
limit 10;

-- their most famous genre

with topAlbum
as
(select album_id,count(invoice_line_id) as albumSales from invoice_line i 
join track t on i.track_id=t.track_id
join invoice i1 on i.invoice_id=i1.invoice_id
where billing_country='USA'
group by album_id),
top10artist
as
(select aa.artist_id,aa.name,sum(albumSales) as artistSale from topAlbum ta
join album a on ta.album_id=a.album_id
join artist aa on a.artist_id=aa.artist_id
group by aa.artist_id,aa.name
order by artistSale desc
limit 10),
cte1
as
(select t.artist_id,t.name,genre_id,count(tt.track_id) as salecount from top10artist t
join album a on t.artist_id=a.artist_id
join track tt on a.album_id=tt.album_id
join invoice_line il on tt.track_id=il.track_id
group by 1,2,3),
bestgenre
as
(select *,rank() over (partition by artist_id order by salecount desc) as ranking from cte1)

select b.name,g.name from bestgenre b
join genre g on b.genre_id=g.genre_id
where ranking=1;




-- 3.customer demographic breakdown (age, gender, location) of Chinook's customer base

select country,count(customer_id) CustomerStrength from customer
group by country
order by CustomerStrength desc;

-- age and gender are not given in the data




-- 4.	Calculate the total revenue and number of invoices for each country, state, and city:

select billing_country as country,sum(total) as total_revenue,count(invoice_id) invoice_count from invoice
group by country
order by total_revenue desc,invoice_count desc;

select billing_state as state,sum(total) as total_revenue,count(invoice_id) invoice_count from invoice
group by state
order by total_revenue desc,invoice_count desc;

select billing_city as city,sum(total) as total_revenue,count(invoice_id) invoice_count from invoice
group by city
order by total_revenue desc,invoice_count desc;




-- 5.	Find the top 5 customers by total revenue in each country




with 
cust
as
(select billing_country, customer_id from (select *, rank() over(partition by billing_country order by rev) as ranking from (select customer_id,billing_country,sum(total) as rev from invoice
group by customer_id,billing_country
order by billing_country) a
order by billing_country) aa
where ranking<=5)

select billing_country as Country,concat(first_name,' ',last_name) as Customer_Name from cust c
join customer cc on c.customer_id=cc.customer_id;




-- 6.	Identify the top-selling track for each customer



with
cte1 
as
(select c.customer_id,t.track_id,t.name,count(t.track_id) as sale from customer c
join invoice i on c.customer_id=i.customer_id
join invoice_line i1 on i.invoice_id=i1.invoice_id
join track t on i1.track_id=t.track_id
group by 1,2,3
order by sale desc),
rownum
as
(select *,row_number() over(partition by customer_id order by sale desc) as rownum from cte1)

select customer_id,track_id,name from rownum
where rownum=1;


-- 7.	Are there any patterns or trends in customer purchasing behavior (e.g., frequency of purchases, preferred payment methods, average order value)?



with
frequency 
as
(select customer_id,round(avg(purchase_frequency),0) as avg_days_bw_purchase from (select customer_id,invoice_date,next_date,datediff(next_date,invoice_date) as purchase_frequency from (select *,lead(invoice_date) over(partition by customer_id) as next_date from invoice
order by customer_id) a) b
group by customer_id),
average_order
as
(select customer_id,round(avg(total),2) as average_order_value from invoice
group by customer_id
order by customer_id)

select f.customer_id,avg_days_bw_purchase,average_order_value from frequency f 
join average_order a on f.customer_id=a.customer_id;


-- 8.	What is the customer churn rate
-- calculating for the churn rate upto the the last 6 months since it is not given in the question.



with last_purchase
as 
(select customer_id, max(date(invoice_date)) as last_purchase_date from invoice
group by customer_id
order by customer_id),
active_or_inactive
as
(select customer_id,last_purchase_date, case when last_purchase_date>date_sub('2020-12-31',interval 6 month) then 'Active Customer'
when last_purchase_date<date_sub('2020-12-31',interval 6 month) then 'Churned Customer' end as status from last_purchase),
churned_count
as
(select status,count(customer_id) number_of_customers from active_or_inactive
group by status)

select round((sum(case when status='Churned Customer' then number_of_customers else 0 end)/sum(number_of_customers))*100,2) as churn_rate from churned_count;



-- 9.	Calculate the percentage of total sales contributed by each genre in the USA and identify the best-selling genres and artists.



with cte1
as
(select i1.track_id as trackid,i1.unit_price,count(invoice_line_id) as sales_count from invoice i 
left join invoice_line i1 on i.invoice_id=i1.invoice_id
where billing_country='USA'
group by track_id,unit_price
order by sales_count desc),
cte2 
as 
(select c.trackid,sales_count,t.genre_id,t.album_id,aa.artist_id,aa.name,c.unit_price,g.name as genre_name from cte1 c 
join track t on c.trackid=t.track_id
join genre g on t.genre_id=g.genre_id
join album a on t.album_id=a.album_id
join artist aa on a.artist_id=aa.artist_id),
cte3
as 
(select genre_name,sum(sales_count*unit_price) as rev from cte2
group by genre_name
order by rev desc)


select genre_name,round((rev/(select sum(rev) from cte3)*100),2) as percentage_sales from cte3;

-- artists

with cte1
as
(select i1.track_id as trackid,i1.unit_price,count(invoice_line_id) as sales_count from invoice i 
left join invoice_line i1 on i.invoice_id=i1.invoice_id
where billing_country='USA'
group by track_id,unit_price
order by sales_count desc),
cte2 
as 
(select c.trackid,sales_count,t.genre_id,t.album_id,aa.artist_id,aa.name as artist_name,c.unit_price,g.name as genre_name from cte1 c 
join track t on c.trackid=t.track_id
join genre g on t.genre_id=g.genre_id
join album a on t.album_id=a.album_id
join artist aa on a.artist_id=aa.artist_id),
cte3
as 
(select artist_name,sum(sales_count*unit_price) as rev from cte2
group by artist_name
order by rev desc)

select artist_name,round((rev/(select sum(rev) from cte3)*100),2) as percentage_sales from cte3;



-- 10.	Find customers who have purchased tracks from at least 3 different genres



select customer_id,count(distinct genre_id) as genre_count from invoice i 
join invoice_line il on i.invoice_id=il.invoice_id
join track t on il.track_id=t.track_id
group by customer_id
having count(distinct genre_id)>=3;




-- 11.	Rank genres based on their sales performance in the USA



with cte1
as
(select track_id,count(invoice_line_id) as sales_count from invoice i 
left join invoice_line i1 on i.invoice_id=i1.invoice_id
where billing_country='USA'
group by track_id
order by sales_count desc),
genrerank
as
(select genre_id,salesum,rank() over(order by salesum desc) as genre_sales_rank from (select genre_id,sum(sales_count) as salesum from cte1 c 
join track t on c.track_id=t.track_id
group by genre_id
order by salesum desc) a)

select gg.name,salesum,genre_sales_rank from genrerank g 
join genre gg on g.genre_id=gg.genre_id
order by genre_sales_rank;



-- 12.	Identify customers who have not made a purchase in the last 3 months



with cte1
as
(select customer_id from invoice
where date(invoice_date) between '2020-10-01' and '2020-12-30')

select distinct customer_id,max(date(invoice_date)) as last_purchase_date from invoice
where customer_id not in (select * from cte1)
group by customer_id
order by customer_id;














-- SUBJECTIVE QUESTION SOLUTIONS




-- 1.	Recommend the three albums from the new record label that should be prioritised for advertising and promotion in the USA based on genre sales analysis.



with topSellingTrack
as
(select track_id,count(invoice_line_id) as sales_count from invoice i 
left join invoice_line i1 on i.invoice_id=i1.invoice_id
where billing_country='USA'
group by track_id
order by sales_count desc),
topArtist
as
(select ar.name as artist_name,ar.artist_id as artist_id,sales_count from topSellingTrack ts 
join track t on ts.track_id=t.track_id
join album a on t.album_id=a.album_id
join artist ar on a.artist_id=ar.artist_id)


select ta.artist_name,t.album_id,title as album_name,sum(sales_count) as album_sales from topArtist ta
join album a on ta.artist_id=a.artist_id
join track t on a.album_id=t.album_id
join genre g on t.genre_id=g.genre_id
group by 1,2,3
order by album_sales desc
limit 3;

-- 2.	Determine the top-selling genres in countries other than the USA and identify any commonalities or differences.

with cte1
as
(select i1.track_id as trackid,i1.unit_price,count(invoice_line_id) as sales_count from invoice i 
left join invoice_line i1 on i.invoice_id=i1.invoice_id
where billing_country<>'USA'
group by track_id,unit_price
order by sales_count desc),
cte2 
as 
(select c.trackid,sales_count,t.genre_id,t.album_id,aa.artist_id,aa.name,c.unit_price,g.name as genre_name from cte1 c 
join track t on c.trackid=t.track_id
join genre g on t.genre_id=g.genre_id
join album a on t.album_id=a.album_id
join artist aa on a.artist_id=aa.artist_id),
cte3
as 
(select genre_name,sum(sales_count*unit_price) as rev from cte2
group by genre_name
order by rev desc)


select genre_name,round((rev/(select sum(rev) from cte3)*100),2) as percentage_sales from cte3;


--  3. How do the purchasing habits (frequency, basket size, spending amount) of long-term customers differ from those of new customers? What insights can these patterns provide about customer loyalty and retention strategies?

with
frequency 
as
(select customer_id,avg(purchase_frequency) as avg_days_bw_purchase from (select customer_id,invoice_date,next_date,datediff(next_date,invoice_date) as purchase_frequency from (select *,lead(invoice_date) over(partition by customer_id) as next_date from invoice
order by customer_id) a) b
group by customer_id),
basket_size
as
( select customer_id,round(avg(basket_size),2) as avg_basket_size from (select customer_id,i.invoice_id,count(invoice_line_id) as basket_size from invoice i 
join invoice_line i1 on i.invoice_id=i1.invoice_id
group by customer_id,invoice_id) a
group by customer_id
),
spending
as
(select customer_id,sum(total) as total_spent from invoice
group by customer_id),
newcust
as
(select customer_id from (select * from (select customer_id,min(invoice_date) as first_purchase_date from invoice
group by customer_id) b
order by first_purchase_date desc
limit 10) c
order by customer_id
),
oldcust
as
(select customer_id from customer
where customer_id not in (select customer_id from newcust)),
newcuststat
as
(select n.customer_id,avg_days_bw_purchase,avg_basket_size,total_spent from newcust n 
join frequency f on n.customer_id=f.customer_id
join basket_size b on n.customer_id=b.customer_id
join spending s on n.customer_id=s.customer_id
order by n.customer_id),
oldcuststat
as
(select n.customer_id,avg_days_bw_purchase,avg_basket_size,total_spent from oldcust n 
join frequency f on n.customer_id=f.customer_id
join basket_size b on n.customer_id=b.customer_id
join spending s on n.customer_id=s.customer_id
order by n.customer_id),
newcustagg
as
(select 'New Customers'as Customer_age,round(avg(avg_days_bw_purchase),0) as cust_avg_freq,round(avg(avg_basket_size),2) as cust_avgbasketsize,round(avg(total_spent),2) as cust_avgtotalspent from newcuststat),
oldcustagg
as
(select 'Long Term Customers'as Customer_age,round(avg(avg_days_bw_purchase),0) as cust_avg_freq,round(avg(avg_basket_size),2) as cust_avgbasketsize,round(avg(total_spent),2) as cust_avgtotalspent from oldcuststat)

select * from newcustagg
union 
select * from oldcustagg;


-- 4. Which music genres, artists, or albums are frequently purchased together by customers? How can this information guide product recommendations and cross-selling initiatives?

with cte1
as
(select i.invoice_id as invoice_id1,i1.invoice_id as invoice_id2,i1.track_id,t.album_id,a.artist_id,aa.name from invoice i
join invoice_line i1 on i.invoice_id=i1.invoice_id
join track t on i1.track_id=t.track_id
join album a on t.album_id=a.album_id
join artist aa on a.artist_id=aa.artist_id),
albumpair
as
(select distinct least(c1.album_id,c2.album_id) as album1,greatest(c1.album_id,c2.album_id) as album2,round(count(*)/2,0) as count from cte1 c1
join cte1 c2 on c1.invoice_id1=c2.invoice_id1
where c1.album_id<>c2.album_id
group by album1,album2
order by count desc),
most_paired_albums
as
(select a1.title as album_1,a2.title as album_2,count as times_purchased_together  from albumpair ap
join album a1 on ap.album1=a1.album_id
join album a2 on ap.album2=a2.album_id)

select * from most_paired_albums;

-- artists

with cte1
as
(select i.invoice_id as invoice_id1,i1.invoice_id as invoice_id2,i1.track_id,t.album_id,a.artist_id,aa.name from invoice i
join invoice_line i1 on i.invoice_id=i1.invoice_id
join track t on i1.track_id=t.track_id
join album a on t.album_id=a.album_id
join artist aa on a.artist_id=aa.artist_id),
artistpair
as
(select distinct least(c1.artist_id,c2.artist_id) as artist1,greatest(c1.artist_id,c2.artist_id) as artist2,round(count(*)/2,0) as count from cte1 c1
join cte1 c2 on c1.invoice_id1=c2.invoice_id1
where c1.artist_id<>c2.artist_id
group by artist1,artist2
order by count desc),
most_paired_artists
as
(select a1.name as artist_1,a2.name as artist_2,count as times_purchased_together  from artistpair ap
join artist a1 on ap.artist1=a1.artist_id
join artist a2 on ap.artist2=a2.artist_id)

select * from most_paired_artists;

-- genre

with cte1
as
(select i.invoice_id as invoice_id1,i1.invoice_id as invoice_id2,i1.track_id,aa.name,t.genre_id as genre from invoice i
join invoice_line i1 on i.invoice_id=i1.invoice_id
join track t on i1.track_id=t.track_id
join album a on t.album_id=a.album_id
join artist aa on a.artist_id=aa.artist_id),
genrepair
as
(select distinct least(c1.genre,c2.genre) as genre1,greatest(c1.genre,c2.genre) as genre2,round(count(*)/2,0) as count from cte1 c1
join cte1 c2 on c1.invoice_id1=c2.invoice_id1
where c1.genre<>c2.genre
group by genre1,genre2
order by count desc),
most_paired_genre
as
(select a1.name as genre_1,a2.name as genre_2,count as times_purchased_together  from genrepair ap
join genre a1 on ap.genre1=a1.genre_id
join genre a2 on ap.genre2=a2.genre_id
order by times_purchased_together desc)

select * from most_paired_genre;

-- 5.	Regional Market Analysis: Do customer purchasing behaviors and churn rates vary across different geographic regions or store locations? How might these correlate with local demographic or economic factors?

with
frequency 
as
(select billing_country,avg(purchase_frequency) as avg_days_bw_purchase from (select customer_id,billing_country,invoice_date,next_date,datediff(next_date,invoice_date) as purchase_frequency from (select *,lead(invoice_date) over(partition by customer_id) as next_date from invoice
order by customer_id) a) b
group by billing_country),
basket_size
as
( select billing_country,round(avg(basket_size),2) as avg_basket_size from (select customer_id,billing_country,i.invoice_id,count(invoice_line_id) as basket_size from invoice i 
join invoice_line i1 on i.invoice_id=i1.invoice_id
group by customer_id,billing_country,invoice_id) a
group by billing_country
),
spending
as
(select billing_country,sum(total) as total_spent from invoice
group by billing_country),
last_purchase
as 
(select customer_id, billing_country,max(date(invoice_date)) as last_purchase_date from invoice
group by customer_id,billing_country
order by customer_id),
active_or_inactive
as
(select customer_id,last_purchase_date,billing_country, case when last_purchase_date>date_sub('2020-12-31',interval 6 month) then 'Active Customer'
when last_purchase_date<date_sub('2020-12-31',interval 6 month) then 'Churned Customer' end as status from last_purchase),
churned_count
as
(select billing_country,status,count(customer_id) number_of_customers from active_or_inactive
group by billing_country,status),
churn_rate 
as
(select billing_country,round((sum(case when status='Churned Customer' then number_of_customers else 0 end)/sum(number_of_customers))*100,2) as churn_rate from churned_count
group by billing_country
order by billing_country)

select s.billing_country,round(avg_days_bw_purchase,0) as purchase_frequency,total_spent,avg_basket_size,churn_rate from spending s 
join basket_size b on s.billing_country=b.billing_country
join frequency f on s.billing_country=f.billing_country
join churn_rate c on s.billing_country=c.billing_country
order by billing_country;


-- 6.	Customer Risk Profiling: Based on customer profiles (age, gender, location, purchase history), which customer segments are more likely to churn or pose a higher risk of reduced spending? What factors contribute to this risk?


with
last_purchase
as 
(select customer_id, billing_country,max(date(invoice_date)) as last_purchase_date from invoice
group by customer_id,billing_country
order by customer_id),
active_or_inactive
as
(select customer_id,last_purchase_date,billing_country, case when last_purchase_date>date_sub('2020-12-31',interval 6 month) then 'Active Customer'
when last_purchase_date<date_sub('2020-12-31',interval 6 month) then 'Churned Customer' end as status from last_purchase),
churned_count
as
(select billing_country,status,count(customer_id) number_of_customers from active_or_inactive
group by billing_country,status),
churn_rate 
as
(select billing_country,sum(case when status = 'Churned Customer' then number_of_customers else 0 end) as churned_cust from churned_count
group by billing_country
order by billing_country),
first_date
as
(select customer_id,min(date(invoice_date)) as first_date from invoice
group by customer_id),
last_date
as
(select customer_id,max(date(invoice_date)) as last_date from invoice
group by customer_id),
first_av
as
(select c.customer_id,c.billing_country,round(avg(case when date(invoice_date) between first_date and date_add(first_date,interval (datediff(last_date,first_date)/2) day) then total else 0 end),2) as initial_avg_order from invoice c
join first_date f on c.customer_id=f.customer_id
join last_date l on c.customer_id=l.customer_id
group by customer_id,billing_country),
next_av
as
(select c.customer_id,c.billing_country,round(avg(case when date(invoice_date) between date_add(first_date,interval (datediff(last_date,first_date)/2) day) and last_date then total else 0 end),2) as final_avg_order from invoice c
join first_date f on c.customer_id=f.customer_id
join last_date l on c.customer_id=l.customer_id
group by customer_id,billing_country),
order_rep
as
(select fa.customer_id,fa.billing_country,initial_avg_order,final_avg_order from first_av fa
join next_av na on fa.customer_id=na.customer_id),
reduced_or_increased
as
(select customer_id,billing_country,case when final_avg_order>initial_avg_order then 'Increased Spending' else 'Reduced Spending' end as status from order_rep
order by customer_id,billing_country),
reduced_number
as
( select billing_country,count(case when status = 'Reduced Spending' then customer_id else NULL end) as reduced_spenders from reduced_or_increased
group by billing_country
)

select c.billing_country,churned_cust,reduced_spenders from churn_rate c 
join reduced_number r on c.billing_country=r.billing_country
order by churned_cust desc,reduced_spenders desc;

-- 7. Can you observe any common characteristics or purchase patterns among customers who have stopped purchasing

with 
last_purchase
as 
(select customer_id, billing_country,max(date(invoice_date)) as last_purchase_date from invoice
group by customer_id,billing_country
order by customer_id),
active_or_inactive
as
(select customer_id,last_purchase_date,billing_country, case when last_purchase_date>date_sub('2020-12-31',interval 6 month) then 'Active Customer'
when last_purchase_date<date_sub('2020-12-31',interval 6 month) then 'Churned Customer' end as status from last_purchase),
churned_cust
as
(select customer_id from active_or_inactive
where status='Churned Customer'),
active_cust
as 
(select customer_id from active_or_inactive
where status='Active Customer'),
frequency 
as
(select customer_id,avg(purchase_frequency) as avg_days_bw_purchase from (select customer_id,invoice_date,next_date,datediff(next_date,invoice_date) as purchase_frequency from (select *,lead(invoice_date) over(partition by customer_id) as next_date from invoice
order by customer_id) a) b
group by customer_id),
avg_days
as
(select 'Active Customer' as status,round(avg(avg_days_bw_purchase),2) as average_frequency from frequency
where customer_id in (select * from active_cust)
union
select 'Inactive Customer' as status,round(avg(avg_days_bw_purchase),2) as average_frequency from frequency
where customer_id in (select * from churned_cust)),
inactive_purchase
as
(select * from invoice_line where 
invoice_id in (select invoice_id from invoice
where customer_id in (select customer_id from churned_cust))),
inactivity
as
(select ip.track_id,invoice_line_id,genre_id,album_id from inactive_purchase ip 
join track t on ip.track_id=t.track_id),
genrestat
as
(select genre_id,count(invoice_line_id) genre_sale from inactivity
group by genre_id
order by genre_sale desc)

select gg.name as Genre,genre_sale from genrestat g 
join genre gg on g.genre_id=gg.genre_id
order by genre_sale desc;



-- frequency of inactive customers

with 
last_purchase
as 
(select customer_id, billing_country,max(date(invoice_date)) as last_purchase_date from invoice
group by customer_id,billing_country
order by customer_id),
active_or_inactive
as
(select customer_id,last_purchase_date,billing_country, case when last_purchase_date>date_sub('2020-12-31',interval 6 month) then 'Active Customer'
when last_purchase_date<date_sub('2020-12-31',interval 6 month) then 'Churned Customer' end as status from last_purchase),
churned_cust
as
(select customer_id from active_or_inactive
where status='Churned Customer'),
active_cust
as 
(select customer_id from active_or_inactive
where status='Active Customer'),
frequency 
as
(select customer_id,avg(purchase_frequency) as avg_days_bw_purchase from (select customer_id,invoice_date,next_date,datediff(next_date,invoice_date) as purchase_frequency from (select *,lead(invoice_date) over(partition by customer_id) as next_date from invoice
order by customer_id) a) b
group by customer_id),
avg_days
as
(select 'Active Customer' as status,round(avg(avg_days_bw_purchase),2) as average_frequency from frequency
where customer_id in (select * from active_cust)
union
select 'Inactive Customer' as status,round(avg(avg_days_bw_purchase),2) as average_frequency from frequency
where customer_id in (select * from churned_cust))

select * from avg_days;







-- 10.	How can you alter the "Albums" table to add a new column named "ReleaseYear" of type INTEGER to store the release year of each album?

alter table album add ReleaseYear int;

select * from album;


-- 11.	Chinook is interested in understanding the purchasing behavior of customers based on their geographical location. They want to know the average total amount spent by customers from each country, along with the number of customers and the average number of tracks purchased per customer. Write an SQL query to provide this information.

with 
totalamount
as
(select customer_id,sum(total) as total_amount from invoice 
group by customer_id),
tcount
as
(select customer_id,count(track_id) as track_count from invoice i 
join invoice_line i1 on i.invoice_id=i1.invoice_id
group by customer_id)

select billing_country as Country ,count(t.customer_id) as Customer_Strength,round(avg(total_amount),2) avg_sale_per_customer,round(avg(track_count),2) as tracks_per_customer from invoice i 
join totalamount t on i.customer_id=t.customer_id
join tcount t1 on i.customer_id=t1.customer_id
group by billing_country;




