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

select 