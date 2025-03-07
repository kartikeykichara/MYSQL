use sakila;
use employees;

select * from employees;

show tables;


select salary from  salaries
where salary <all(select salary from salaries
where emp_no=10003);

select e.emp_no,e.first_name,e.last_name,t.title
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title="manager";

select e.emp_no,e.first_name,e.last_name,t.title
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title="manager"or ;