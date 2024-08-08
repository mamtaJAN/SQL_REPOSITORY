-- check =>
 -- condition accoirding
 use sakila;
 use regex1234;
-- create table yash (id int check (id>5))
-- insert into yash values 
 
 create table yash2(name varchar (20) check (name=reverse(name)));
 insert into yash2 values ("naman");
 select * from yash2;
 use sakila;
 select * from actor ;
 desc actor;
 select * from film_actor;
 desc film_actor;
 
  -- select oid,city,id,pname from orders
 -- inner join products
--  on (oeders,id=products.pid);
 
 
 select actor.actor_id,actor.first_name,film_actor.actor_id,film_actor.film_id
 from actor  join  film_actor where (actor.actor_id=film_actor.actor_id);
 
 select f.film_id ,fm.title from film_actor as f
 
 join film as fm where(f.film_id=fm.film_id)
 
 
  select f.film_id ,fm.title from film_actor as f
 join film as fm where(f.film_id=fm.film_id);
 
  select  a.actor_id f.film_id ,fm.title from film_actor as f
 
 join film as fm where(f.film_id=fm.film_id)