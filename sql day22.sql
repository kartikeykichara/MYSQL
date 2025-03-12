use sakila;


select * from payment;


select avg(amount) from payment;
select  amount,count(amount) ,sum(amount) from payment
group by amount;


-- windows => aggregate apply har row ke sath  

-- over() -- har row ke sath dikhna

select payment_id,amount,
avg(amount) over () from payment;

-- rumnnig ke sath ke kuch aggregate krna hia

select payment_id,amount,
avg(amount) over (order by amount desc) from payment;

select payment_id,amount,
sum(amount) over (order by amount desc) from payment;

select payment_id,amount,
sum(amount) over (partition by amount) from payment;

select payment_id,amount,
sum(amount) over (partition by amount order by amount desc) from payment;


select * from payment
where payment_id<10;


-- similar values sum hoke club
select payment_id,staff_id,amount,sum(amount) over(order by amount) from payment
where payment_id<10;

select payment_id,staff_id,amount,sum(amount) over(order by payment_id) from payment
where payment_id<10;

select payment_id,staff_id,amount,sum(amount) over(order by staff_id) from payment
where payment_id<10;

select payment_id,staff_id,amount,sum(amount) over(partition by payment_id) from payment
where payment_id<10;


select payment_id,staff_id,amount,sum(amount) over(partition by staff_id) from payment
where payment_id<10;

select payment_id,staff_id,amount,sum(amount) over(partition by amount) from payment
where payment_id<10;


select payment_id,staff_id,amount,sum(amount) over(partition by staff_id order by amount) from payment
where payment_id<10;

use regex;

create table customers23(customer_id int , customer_name varchar(20));

insert into customers23 values(10,"rohan"),(11,"shaym"),(12,"mohan");

create table oder (oder_id int ,price int ,customer_id int );

insert into oder values(1,200,10),(2,300,10),(3,400,11);

select * from customers23;

select c.customer_id,count(o.customer_id)
from customers23 as c  left join oder as o
on c.customer_id=o.customer_id
group by c.customer_id;

select customer_name,customer_id 
from customers23
where (select count(oder.customer_id) from oder
			where customers23.customer_id=oder.customer_id)>1;


--  we need to identify customer name and customer