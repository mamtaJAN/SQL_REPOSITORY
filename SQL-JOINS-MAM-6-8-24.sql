CREATE DATABASE Customers;
use Customers;
create table Customer(Customerid INT PRIMARY KEY,CustomerName VARCHAR(255));
Insert into Customer Values (1,'Alice'),(2,'Bob'),(3,'Charlie'),(4,'David');
create table Orders(Orderid INT PRIMARY KEY,CustomerId INT);
Insert into Orders Values (101,1),(102,2),(103,1),(104,4);
select * from Customer;
select * from Orders;
-- inner join
select Customer.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer INNER JOIN Orders on Customer.CustomerId=Orders.Customerid;
 -- left join
 select Customer.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer LEFT JOIN Orders on Customer.CustomerId=Orders.Customerid;
 -- right join
 select Customer.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer RIGHT JOIN Orders on Customer.CustomerId=Orders.Customerid;
 -- full join
  select Customer.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer FULL JOIN Orders on Customer.CustomerId=Orders.Customerid;
 
 -- Union join,it is used when full join not work in some system so use union.
 -- in union join -left plus right join plus is union
  select Customer.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer LEFT JOIN Orders on Customer.CustomerId=Orders.Customerid
 UNION 
 select Customer.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer RIGHT JOIN Orders on Customer.CustomerId=Orders.Customerid;
-- CROSS JOIN-CARTISION JOIN
 select Customer.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer CROSS JOIN Orders;
 -- NATURAL JOIN
  select Customer.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer NATURAL JOIN Orders;
 
 -- semi join
 select Customer.* from Customer Where Exists (Select 1 From Orders Where Customer.Customerid=Orders.Customerid);
 
 -- anti join 
  select Customer.* from Customer Where Not Exists  (Select 1 From Orders Where Customer.Customerid=Orders.Customerid);
 
 -- self join
 Select Customer1.Customerid,Customer2.CustomerName from Customer 
 As Customer1 Inner join Customer as Customer2 on Customer1.Customerid=Customer2.Customerid;
 
 select * from Customer;