show  databases;
use customers;

create table  employe1(employee_id int,employe_name 
varchar(20),salary int(10),department_id int(2), manager_id int(2));
insert into employe1(employee_id ,employe_name,salary,department_id, manager_id) values(1,'John',50000,1,null),
(2,'Jane',60000,1,1),(3,'Jack',55000,1,1),(4,'Jill',70000,2,2),(5,'Mike',65000,2,2),(6,'Sara',52000,3,null);
select * from employe1;

create table department1(department_id int,department_name varchar(10));
insert into department1(department_id,department_name)values(1,'HR'),(2,'Sales'),(3,'IT');
select * from department1;

-- Single row Subquery (jo single line main output dega)
select employee_id,employe_name from employe1 where salary <(select max(salary) from employe1); 

-- Multiple Row Subquery(jo 1 se jayada row main output dega)
-- Q list department  more than one employee
select  department_id ,department_name from department1 where department_id IN (select department_id from
 employe1 Group by department_id Having Count(*)>1);
 
 -- The subquery finds department with more than one employee
 
 -- MULTIPLE COLUMN SUBQUERY 
 -- Q Find the employee with the hieghest salary in each department .
 
 select employee_id,employe_name,department_id,salary from employe1
 where (department_id,salary ) IN (Select department_id,MAX(salary)
 FRom employe1 Group by department_id);
 -- 

 -- CORRELATED Subqueris 
 -- A subquery that reference a column from the outer query
  -- A subquery that references a column 
 select e1.employe_name from employe1 e1  where e1.salary > (select avg(e2.salary) from employe1 e2 
 where e1.department_id =e2.department_id);
 
-- non corrrealated Subquerise
  select employe_name from employe1 where department_id=(select department_id from department1 where
  department_name ='Sales');
  
  
  -- Subquery in SELCET Cluase
  Select employe_name, (Select department_name from department1 where department1.department_id=employe1.department_id)
  AS department_name11 from employe1;
  
  
  -- Subquery in from cluase
  select department_name,avg_salary from(select department_id,AVG(salary) AS avg_salary from employe1
   Group by department_id) AS dept_avg JOIN department1 ON dept_avg.department_id=department1.department_id;
   
   