show databases;

use sakila;
show tables;
select * from actor;
select actor_id from actor;
select first_name,actor_id,substr(first_name,1,1),
if(mod(actor_id,2)=0,actor_id*10) if(mod(actor_id,5)=0,actor_id*20,actor_id*100))
as 'new' from actor;
select * from actor;
show databases;
select actor_id ,first_name,
 case first_name
 when 'NICK' then actor_id+10;
  end as 'newid'
  from actor;
/*  
  actor actorid 10 se jeyada hui toh print best  actor id 
  20 se 35 very best agr actor id 36 se 50 pruint excellent agr 
  50 se jatyada good luck otherwise return same actor id
*/
select actor_id,
 case actor_id
  when actor_id>10 and actor_id <=20 then good
   actor_id >=20 and actor_id <=35  then best
    actor_id >=36 and actor_id<=50 then excellent 
    actor_id >=50 then good luck
   end as 'print'
   from actor;
   
   /* nullif (exp1,exp2)
   exp1=exp2(return null other wise return null) */
   /* coalescase*/
   select address_id, address2, coalesce (address2,address_id,10) from 
address;


