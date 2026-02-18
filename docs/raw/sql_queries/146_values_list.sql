-- The idea is to use row values(probably passed from application code)
-- as table to query from
/*
Output
chinook=# \i values_list.sql
      name
-----------------
 Albert Carbon
 Jon Smith
 Bad Imagination
(3 rows)
*/

select (firstname || ' ' || lastname) as name
from (values ('Albert', 'Carbon'), ('Jon', 'Smith'), ('Bad', 'Imagination')) as b(firstname, lastname);
