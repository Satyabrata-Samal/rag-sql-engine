-- MY  SAMPLE SELECT  for Chinook database  https://github.com/lerocha/chinook-database 

SELECT  *
FROM TRACK
where composer  like '%'

SELECT  *
FROM TRACK
where composer is null        

select *
from track 
where UNITPRICE  BETWEEN 1 and 2 AND COMPOSER is null


select name, round(milliseconds/60000,2)
from track
order by milliseconds DESC


select  ar.name, ar.ARTISTID, al.title
from ARTIST ar inner join album al
on ar.ARTISTID  =al.ARTISTID

select al.title as ALBUM, al.albumid, t.name as Piosenka
from album al inner join track t 
on al.albumid = t.albumid


select al.title as ALBUM, count(t.name) as UtworyLiczba
from album al inner join track t 
on al.albumid = t.albumid
group by al.TITLE
ORDER BY al.TITLE


select al.title as ALBUM, count(t.name) as UtworyLiczba, sum(round(t.MILLISECONDS/60000,2)) as TrwaMinut
from album al inner join track t 
on al.albumid = t.albumid
group by al.TITLE

select *
from CUSTOMER
where phone is null

select *
from customer
where company is not null

select sum(total)
from invoice

select *
from invoice

select customerid, to_char(invoicedate, 'YYYY Month DD')
from invoice

select t.name as piosenka, g.name as gatunek
from track t inner join genre g
on t.genreid = g.genreid


select g.name as gatunek, count(g.name) as ilosc
from track t inner join genre g
on t.genreid = g.genreid
GROUP BY g.NAME

select t.name as piosenka, g.name as gatunek
from track t inner join genre g
on t.genreid = g.genreid
where g.name = 'Science Fiction'
