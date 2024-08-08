use customers;
show databases;
use customers;
CREATE TABLE Student(id int,Sname varchar(45)NOT NULL,age int,city varchar(25) NOT NULL); 

INSERT INTO Student(id,Sname,age,city)       
VALUES (3354,'selena', 13,'Texas'),       
(2135, 'david',15, 'Alaska'),       
(4321, 'john', 14,'California'),    
(4213,'joy',17,'New York'),       
(5112, 'Rokky', 16, 'Florida'),  
(6113, 'tom', 15, 'Arizona'),    
(7555,'smith',14,'New York'),       
(8345, 'jack',13,'California');  
select * from Student;

CREATE TABLE Fee(id int,course varchar(45) NOT NULL,amount_paid int);

INSERT INTO Fee (id, course, amount_paid)       
VALUES (3354,'Java', 20000),       
(7555, 'Android', 22000),       
(4321, 'Python', 18000),    
(8345,'SQL', 15000),       
(5112, 'Machine Learning', 30000);
 
 select * from Fee;
 
-- inner join 
select Student.id,Student.SName,Fee.id from Student inner JOIN Fee on Student.Id=Fee.id;
  
-- left join
select Student.id,Student.SName,Fee.id from Student LEFT JOIN Fee on Student.Id=Fee.id;
  
-- right join 
select Student.id,Student.SName,Fee.id from Student Right JOIN Fee on Student.Id=Fee.id;

 -- union join
select Student.id,Student.SName,Fee.id from Student LEFT JOIN Fee on Student.Id=Fee.id
UNION 
select Student.id,Student.SName,Fee.id from Student Right JOIN Fee on Student.Id=Fee.id;

-- cross join
select Student.id,Student.SName,Fee.id from Student Cross JOIN Fee;
 
-- natural join
select Student.id,Student.SName,Fee.id from Student Natural JOIN Fee;
 
 -- semi join
 select Student.* from Student Where Exists (Select 1 From Fee Where Student.id=Fee.id);
 
-- anti join 
select Student.* from Student Where Not Exists (Select 1 From Fee Where Student.id=Fee.id);

-- self join
 Select Student1.id,Student2.SName from Student 
 As Student1 Inner join Student as Student2 on Student1.id=Student2.id;
 
 
 



 
