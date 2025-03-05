use employees;

select * from employees;

select * from departments;

select * from salaries;

select * from titles;

select * from salaries
where salary <all (select salary from salaries 
where emp_no=10003);


select * from employees;

select * from titles;

desc employees;

desc titles;

select e.emp_no,e.first_name,t.title
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title="manager";

select e.emp_no,e.first_name,t.title
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title!="manager";

select e.emp_no,e.first_name,e.last_name,t.title
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title="manager";

SELECT DISTINCT m.emp_no, e.first_name, e.last_name, m.title
FROM employees AS e
JOIN titles AS m ON e.emp_no = m.emp_no AND m.title = 'manager'
JOIN titles AS t ON e.emp_no = t.emp_no AND t.title != 'manager';

select emp_no,year(from_date) from titles
where title="Manager" and (emp_no,year(from_date)) in (select emp_no,year(from_date) from  titles 
where title!="manager");


																						
select e.emp_no,e.first_name,e.last_name,t.title,e.hire_date
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title="Assistant Engineer" and hire_date<any(select e.hire_date
from employees as e join titles as t
on e.emp_no=t.emp_no 
where t.title="Manager");


select e.emp_no,t.title,year(e.hire_date)
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title="Manager" and (e.emp_no,year(hire_date) =any(select e.emp_no,year(hire_date) from employees as e join titles as t
on e.emp_no=t.emp_no);

select e.emp_no,e.first_name,e.last_name,t.title,e.hire_date
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title="Assistant Engineer";


select e.hire_date,e.emp_no
from employees as e join titles as t
on e.emp_no=t.emp_no 
where (t.title="Manager", ;



-- select distinct emp_no,first_name,last_name
-- from employees as e join ;

-- select * from empl

