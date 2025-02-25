use test1;

create table staff(eid int ,ename varchar(20),manager_id int);

insert into staff values(10,'tushar',null),(11,'aman',13),
(12,'sakshi',10),(13,'shubham',11),(14,'ujjwal',12);

desc staff;

select * from staff;

select emp.eid,emp.ename,emp.manager_id,mng.ename


from staff as emp join staff as mng
where emp.manager_id=mng.eid;


#set operators

use sakila;
select * from actor where actor_id=2;

select * from actor where actor_id=3;

select * from actor where actor_id=2
union
select * from actor where actor_id in(3,5);

select * from actor where actor_id in(2,3)
union
select * from actor where actor_id in(3,5);

select * from actor where actor_id in(2,3)
union
select actor_id,first_name,last_name from actor 
where actor_id  in(3,5);

select * from actor where actor_id in(2,3)
union
select *from actor 
where actor_id  in(3,5);


select * from actor where actor_id in(2,3)
union all
select *from actor 
where actor_id  in(3,5);

select * from actor where actor_id in(2,3)
except
select *from actor 
where actor_id  in(3,5);

select * from actor where actor_id in(2,3,4)
except
select *from actor 
where actor_id  in(3,5);


select * from actor where actor_id in(2,4,8,9,3,5)
except
select *from actor 
where actor_id  in(3,5);

select * from actor where actor_id in(2,4,8,9,3,5,4)
except
select *from actor 
where actor_id  in(3,5);


select a.actor_id,a.first_name,fa.film_actor
from actor as a join film_actor as fa
where a.actor_id=fa.actor_id;

select a.actor_id,a.first_name,count(fa.film_id) as movies
from actor as a join film_actor as fa
where a.actor_id=fa.actor_id
group by a.actor_id
order by movies;

select a.actor_id,a.first_name,a.last_name,count(fa.film_id) as movies
from actor as a join film_actor as fa
where a.actor_id=fa.actor_id
group by a.actor_id
order by movies;


#data types in sql
