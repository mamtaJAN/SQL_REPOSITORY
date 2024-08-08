use sakila;
select * from actor;
select length('mamta jangid') from dual;
select char_length('mamta jangid') from dual;

select * from payment;
select payment_date from payment;
SELECT sum(amount) from payment where( (payment_id  between 3 and 300));

select * from address;
select district from address where district  between 1 and 3;
select amount from payement where customer_id between (3,300) and customer_id not in (4);