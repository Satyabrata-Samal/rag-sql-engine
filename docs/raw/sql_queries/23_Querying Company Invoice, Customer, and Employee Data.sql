
/* 
---Querying Company Invoice, Customer, and Employee Data---

This project uses SQL queries to access and manipulate company data 
surrounding invoices, customers, and employees.

Database Used: Chinook MySQL Database 
Access Database at:
https://github.com/lerocha/chinook-database/blob/master/ChinookDatabase/DataSources/Chinook_MySql.sql 

*/

/* Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table. */

Select  FirstName, LastName, BirthDate, Address, City, State From employee;

/* Find the first and last name of any customer who does not have an invoice.*/

Select customer.FirstName, customer.LastName, customer.CustomerId from customer
inner join invoice
on customer.CustomerId = invoice.CustomerId
where InvoiceId  = null;

/* Find the total number of invoices for each customer along with the 
customer's full name, city and email.*/

select sum(invoice.InvoiceID) as TotalInvoices, customer.CustomerId, customer.FirstName, 
customer.LastName, customer.City, customer.Email from customer
inner join invoice
on customer.CustomerId = invoice.CustomerId
group by customer.CustomerId, customer.FirstName, customer.LastName, customer.City, customer.Email;

/* Retrieve a list with the last name of the employees who report to the general manager.*/
 
select employee.LastName, employee.EmployeeID from employee
where Title = "General Manager";
/* Employee ID for General Manager is 1 and last name is Adams */
 
select a.LastName, a.Title, a.ReportsTo, a.EmployeeId, b.LastName, b.Title from employee a
inner join employee b
on a.LastName = b.LastName
where a.ReportsTo = '1';

/* Create a list of all the employee's and customer's first names and 
last names ordered by the last name in descending order.*/

Select LastName, FirstName from employee
union
select LastName, FirstName from customer
order by LastName desc;

/* Pull a list of customer ids with the customer’s full name, 
and address, along with combining their city and country together. 
Be sure to make a space in between these two and make it 
UPPER CASE (ex: LOS ANGELES USA) */

Select CustomerId, FirstName, LastName, Address, upper(concat(City , ' ', Country)) AS location
FROM customer;

/* See if there are any customers who have a different city listed in their
 billing city versus their customer city.*/
 
select customer.CustomerId, customer.City, invoice.BillingCity from customer
inner join invoice on 
customer.CustomerId = invoice.CustomerId
where customer.City <> invoice.BillingCity;

/* Create a new employee user id by combining the first 4 letters of the employee’s 
first name with the first 2 letters of the employee’s last name. Make the new 
field lower case */

select FirstName, substr(FirstName,1,4) as first, LastName, substr(LastName,1,2) as last,  
lower(concat(substr(FirstName,1,4), substr(LastName,1,2))) as newemployeeid
from employee;

/* Show a list of employees who have worked for the company for 15 or more 
years using the current date function. Sort by lastname ascending.*/

select FirstName, LastName, SUBSTRING(HireDate, 1, 10) as hiredate, 
curdate() as currentdate, datediff(curdate(),SUBSTRING(HireDate, 1, 10)) /365 as yearsworked
from employee
where  (datediff(curdate(),SUBSTRING(HireDate, 1, 10)) /365) >= 15
order by LastName asc;

/* Find the cities with the most customers and rank in descending order.*/

select count(CustomerId) as TotalCustomers, City from customer
group by City
order by TotalCustomers desc;

/* Create a new customer invoice id by combining a customer’s invoice id 
with their first and last name while ordering your query in the
 following order: firstname, lastname, and invoiceID.*/
 
select customer.FirstName, customer.LastName, customer.CustomerId, invoice.InvoiceId,
concat(firstname, '', lastname,'',invoiceid) as NewInvoiceID
from customer
inner join invoice
on customer.CustomerId = invoice.CustomerId
order by firstname, lastname, InvoiceID;
