use customers;
create table Customers(CustomerID int(4),CustomerName varchar(20),Country varchar(20));
insert into Customers (CustomerID,CustomerName ,Country)values(1,'Alice','USA'),
(2,'Bob','Canada'),(3,'Charlie','UK'),(4,'David','Australia');

select * from Customers;
create table Orderss(OrderID int,OrderDate date,CustomerID int ,TotalAmount float);
insert into Orderss(OrderID ,OrderDate,CustomerID,TotalAmount)values(101,'2024-01-10',1,250.00),
(102,'2024-01-15',2,150.00),(103,'2024-01-20',1,300.00),(104,'2024-01-25',3,400.00);

select * from Orderss;
create table Products(ProductID int,ProductName varchar(20),Price float);
insert into Products(ProductID,ProductName ,Price)values(1,'Laptop',800.00),
(2,'Mouse',20.00),(3,'Keyboard',30.00),(4,'Monitor',150.00);

select * from Products;

create table OrderDetails(OrderDetailID int ,OrderID int ,ProductID int ,Quantity int);
insert into OrderDetails(OrderDetailID,OrderID,ProductID,Quantity) values
(1001,101,1,1),(1002,101,2,2),(1003,102,3,1),(1004,103,4,1),(1005,104,1,1);

select * from OrderDetails;

create table Employes(EmployeeID int, EmployeeName varchar(20),DepartmentID int);
insert into Employes(EmployeeID,EmployeeName,DepartmentID)
values (1,'Eve',101),(2,'Frank',102),(3,'Grace',101),(4,'Harry',103);
select * from Employes;

create table Departmentss(DepartmentID int,DepartmentName varchar(10));

insert into Departmentss(DepartmentID,DepartmentName) values (101,'Sales'),
(102,'Marketing'),(103,'IT');

select * from Departmentss;

-- 1. Using the Customers and Orders tables, write an INNER JOIN query to find all orders along with
-- the corresponding customer names.
select Customers.CustomerID,Customers.CustomerName,Orderss.OrderID
 from Customers INNER JOIN Orderss on Customers.CustomerID=Orderss.CustomerID;
 
-- 2. Write a LEFT JOIN query to find all customers and their orders, including customers who have not
-- placed any orders.


select Customers.CustomerID,Customers.CustomerName,Orderss.OrderID
 from Customers Left JOIN Orderss on Customers.CustomerID=Orderss.CustomerID;
 
 -- 3. Using the Products and OrderDetails tables, write a RIGHT JOIN query to find all products,
-- including those that have not been ordered.

select Products.ProductID,Products.ProductName,OrderDetails.OrderDetailID
 from Products RIght JOIN OrderDEtails on Products.ProductID=OrderDetails.OrderDetailID;

-- 4. Write a query using a FULL OUTER JOIN to find all employees and their respective departments,
-- including those with no department assigned

  select Employes.Customerid,Customer.CustomerName,Orders.Orderid
 from Customer FULL JOIN Orders on Customer.CustomerId=Orders.Customerid;

-- 5. Write a query using a SELF JOIN on the Employees table to find pairs of employees who work in
-- the same department.

 Select Employes1.EmployeeID,Employes2.EmployeeName from Employes 
 As Employes1 Inner join Employes as Employes2 on Employes1.EmployeeID=Employe2.EmployeeID;

-- 6. Using the Orders and OrderDetails tables, write a query to find the total quantity of each product
-- ordered.
select * from OrderDetails;
select * from Orderss;

SELECT ProductID,SUM(Quantity)
FROM OrderDetails  GROUP BY ProductID ORDER BY Quantity DESC;

-- 7. Write a query using a CROSS JOIN between the Customers and Products tables to find all possible
-- combinations of customers and products.

select Customers.CustomerID,Customers.CustomerName,Products.ProductID
 from Customers CROSS JOIN Products;

-- 8. Write a query using a LEFT JOIN to find all orders and include the corresponding product names. If
-- an order doesn’t have a product, display &quot;No Product&quot;

 select Orderss.OrderID,Products.ProductName,Products.ProductID
 from Orderss LEFT JOIN Products on Orderss.OrderID=Products.ProductID;


-- 9. Use a RIGHT JOIN to find all products along with the details of the orders they were included in,
-- including products that were never ordered.
 select Orderss.OrderID,Products.ProductName,Products.ProductID
 from Orderss right join  Products on Orderss.OrderID=Products.ProductID;


-- 10. Write a query using INNER JOIN and WHERE clause to find the customers who have placed orders
-- totaling more than $300.
-- SUBQUERIES QUESTIONS
-- 11. Write a subquery to find the names of customers who have placed an order in 2024.

SELECT Customers.CustomerName FROM Customers 
WHERE Customers.CustomerID IN (SELECT Orderss.CustomerID FROM Orderss  WHERE YEAR(Orderss.OrderDate) = 2024);
-- 12. Using a subquery, find the products that have never been ordered.

SELECT Products.ProductID, Products.ProductName
FROM Products  WHERE Products.ProductID NOT IN (SELECT Orderss.OrderID
FROM Orderss);

-- 13. Write a subquery to find the customer who placed the most expensive order.

SELECT Customers.CustomerID,Customers.CustomerName
FROM Customers  JOIN Orderss ON Customers.CustomerID= Orderss.OrderID
WHERE TotalAmount = (SELECT MAX(TotalAmount)FROM Orderss);

-- 14. Using a subquery, find the employees who work in the same department as &quot;Eve&quot;.
SELECT EmployeeID, EmployeeName FROM Employes WHERE DepartmentID = (SELECT DepartmentID FROM Employes
WHERE EmployeeName = 'Eve');


-- 15. Write a subquery to find the department name where the maximum number of employees work.

SELECT DepartmentID, COUNT(*) AS employee_count
FROM Employes GROUP BY DepartmentID;


-- 16. Using a subquery, find the names of customers who have ordered all available products.
SELECT Products.ProductID FROM Products WHERE NOT EXISTS 
(SELECT 1 FROM Orderss WHERE Orderss.CustomerID = Products.ProductID
AND Orderss.CustomerID = Products.CustomerID);

-- 17. Write a subquery to find the order that contains the highest number of products.
SELECT OrderID, COUNT(ProductID) AS product_count FROM OrderDetails GROUP BY OrderID;

-- 18. Using a subquery, find the average order amount of the orders placed by &quot;Bob&quot;.
select * from Customers;
select * from Orderss;
select * from OrderDetails;

SELECT AVG(TotalAmount) AS average_order_amount
FROM Orderss WHERE CustomerID = (SELECT CustomerID
FROM Customers WHERE CustomerName = 'Bob');

-- 19. Write a subquery to find the second-highest total amount spent by a customer.
SELECT SUM(TotalAmount) AS total_amount FROM Orderss GROUP BY CustomerID;

-- 20.Using a subquery, find the product with the lowest price that has been ordered
select * from Products;

SELECT MIN(Products.Price)
FROM Products JOIN Orderss ON Products.ProductID = Products.ProductID;
