-- Drop database if exits
-- Drop Database if Exits supercars_db;
-- create database
create database supercars_db;
show databases;
use supercars_db;
-- create table
create table supercars(supercar_id INT AUTO_INCREMENT 
PRIMARY KEY,model VARCHAR(50)NOT NULL,
 make VARCHAR(50) NOT NULL,
 price_in_dollars DECIMAL(10,2) NOT NULL ,
 horsepower INT NOT NULL,
 torque INT NOT NULL,
 top_speed INT NOT NULL ,
 acceleration DECIMAL (4,2) NOT NULL,
 engine_type VARCHAR (50) NOT NULL,
 luxury_level ENUM('low','medium','high') NOT NULL,
 weight INT NOT NULL,
 num_gears INT NOT NULL ,
 brand_ambassador VARCHAR(50),
 launch_date DATE,
 is_available BOOLEAN DEFAULT true,
 created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE
 CURRENT_TIMESTAMP);
 
 -- Insert sample data
 INSERT INTO supercars(model,make,price_in_dollars,horsepower,
  torque,top_speed,
 acceleration,engine_type,
 luxury_level, weight,
 num_gears , brand_ambassador,
 launch_date,is_available)
 values('Aventador','Lamborgini',500000.00,730,690,217,2.9,'V12',
 'high',3472,7,'Lewis Hamilton','2011-03-01',true),
 ('458 Italia','Ferrari',250000.00,562,398,210,3.4,'V8',
 'medium',3384,7,'Sebastian Vettel','2010-01-01',true),
 ('GT','Ford',150000.00,647,550,216,3.0,'V6','medium',3526,7,
 NULL,'2017-01-01',true),
 ('HUracan','Lamborgini',300000.00,610,413,202,3.2,'V10',
 'high',3135,7,'Kylian Mbappe',NULL,false),
 ('Senna','McLaren',1000000.00,789,590,208,2.8,'V8','high',
2641,7,'Fernando Alonso',NULL ,true),
('Chiron','Bugatti',3000000.00,1500,1180,261,2.5,'W16',
'high',4398,7,'Cristiano Ronaldo','2016-03-01',true);
select * from supercars;
select * from supercars order by top_speed desc;
select distinct * from supercars;
select * from supercars limit 5,5;
select * from supercars order by top_speed desc;
select distinct * from supercars;
select distinct make as manufacturer from supercars;
select  * from supercars where brand_ambassador is not null;
select count(*) from supercars;
select count(make) from supercars;
select count(distinct make ) as cont_of_unimakers from supercars;
select sum(top_speed)as sum_of_top_speed from supercars;
select sum(top_speed) from supercars where make="lamborgini";
select avg(torque) from supercars;
select distinct(luxury_level),avg(price_in_dollars) from supercars group by 
luxury_level;
select distinct(num_gears),avg(price_in_dollars) 
from supercars group by num_gears;
select * from supercars where price_in_dollars
 between 2000000 and 2500000;
select luxury_level ,avg(top_speed) from supercars
 group by luxury_level having avg(top_speed);
select luxury_level ,avg(top_speed),avg(horsepower) from supercars 
group by luxury_level having avg(top_speed)>200 or avg(horsepower)>100;

-- Add a column 
-- ALTER COMMAND
Alter table supercars ADD color VARCHAR(20);

-- Modify a column
Alter Table supercars MODIFY price_in_dollars 
DECIMAL(12,2)NOT NULL;


 -- Rename a column 
 
Alter Table supercars CHANGE horsepower power_output 
INT NOT NULL;
-- Drop a column 
Alter Table supercars Drop column brand_ambassador;
 
 