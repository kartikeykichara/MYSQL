use employees;
show tables;

select  * from salaries;

use kk;
show databases;


show tables;

select * from employees1;

select d.departmentName
from employees1 as e right join departments as d
on e.departmentid=d.departmentid
where e.empid is null ;



use sakila;
show tables;

select * from payment;

select payment_id
from payment
where amount in (select min(amount) from payment);