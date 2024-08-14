show databases;
use customers;
create database Employee123;
use Employee123;
create table Employeess1(employeeId INT PRIMARY KEY,
firstname VARCHAR(50),
lastname VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10,2));
insert into Employeess1(employeeId,firstname,lastname,department,salary) 
values(1,'David','Davis','HR',70000.00),
(2,'Emma','Evans','IT',80000.00),
(3,'Frank','Foster','Finance',90000.00),
(4,'Grace','Green','IT',85000.00),
(5,'Helen','Harris','Marketing',100000.00),
(6,'Ian','Irwin','Fianance',72000.00),
(7,'Jack','Johnson','HR',72000.00);
select * from Employeess1;

-- ROW() -- ORDER by
select employeeId,firstname,lastname,department,salary,
row_number() over(order by salary desc) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
row_number() over(order by salary) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
row_number() over(partition by department  order by salary desc) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
row_number() over(partition by department  order by salary desc) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
rank() over(order by salary desc) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
rank() over(order by salary ) as rankingofsalary 
from Employeess1;
-- rank() partition
select employeeId,firstname,lastname,department,salary,
rank() over(partition by department  order by salary ) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
rank() over(partition by department  order by salary desc ) as rankingofsalary 
from Employeess1;

-- dense rank -- desc
select employeeId,firstname,lastname,department,salary,
dense_rank() over(order by salary desc) as rankingofsalary 
from Employeess1;
-- dense rank -- asc
select employeeId,firstname,lastname,department,salary,
dense_rank() over(order by salary ) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
dense_rank() over(partition by department  order by salary desc ) as rankingofsalary 
from Employeess1;


select employeeId,firstname,lastname,department,salary,
dense_rank() over(partition by department  order by salary  ) as rankingofsalary 
from Employeess1;


-- NTILE() 

select employeeId,firstname,lastname,department,salary,
ntile(3) over(  order by salary desc ) as rankingofsalary 
from Employeess1;


select employeeId,firstname,lastname,department,salary,
ntile(5) over(  order by salary desc ) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
ntile(3) over(  order by salary  ) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
ntile(5) over(  order by salary  ) as rankingofsalary 
from Employeess1;

-- LAG 
select employeeId,firstname,lastname,department,salary,
LAG(salary) over(  order by salary desc ) as previoussalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
LAG(salary) over(  order by salary ) as previoussalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
LAG(salary) over( partition by department  order by salary desc ) as rankingofsalary 
from Employeess1;
-- Lead()
select employeeId,firstname,lastname,department,salary,
lead(salary) over(  order by salary desc ) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
lead(salary) over(  order by salary) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
lead(salary) over(partition by department  order by salary desc ) as rankingofsalary 
from Employeess1;

select employeeId,firstname,lastname,department,salary,
lead(salary) over(partition by department  order by salary  ) as rankingofsalary 
from Employeess1;


