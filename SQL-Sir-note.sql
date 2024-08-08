
use sakila;

select 1+2 from dual;


select  month( '09-17-24');

select str_to_date('09-17/2024', '%m-%d/%Y');
-- date diff



select * from payment;

select sum(amount) from payment;

select max(amount),max(staff_id),
 min(amount), avg(amount) from payment;
 
 select count(customer_id) from payment;
 select count(*) from payment;
 
 select customer_id from payment;
 
select distinct(customer_id) from payment;

select count(distinct(customer_id)) from payment;

select * from payment;
select count(*) from payment where customer_id=2;



select distinct(customer_id) from payment;

select customer_id, count(*) from payment 
group by customer_id;


select * from address;

-- find the customerid max min avg
-- in every month what is the total payment 
-- get the total amonut only for those paymnet where the payment id is in between 3 to 300
-- and mke sure the customer id 4 not included
-- from the address table i need to find out the top 3 distinct by count 
 
 select max(customer_id),min(customer_id), avg(customer_id) from payment;
 select * from payment;
 select sum(amount) from payment;

  select sum(amount) from payment where payment_id between 3 and 300 and customer_id not in (4);
  -- Alices
  select customer_id as id from payment;
  
  -- join 
  /*
  SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
  */
  -- group by
/*
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
*/

/*
SELECT * 
FROM employees 
LIMIT 10;

*/

-- 10-7-24
