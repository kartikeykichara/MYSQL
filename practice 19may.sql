use ajay;

-- Join employees and projects to list employee names and their projects.
select * from employees;
select * from projects;
select e.name , p.project_name
from employees as e join projects as p
on e.emp_id=p.emp_id;

-- Join employees and salaries to show monthly salaries.
select * from salaries;
select e.name , s.salary_paid,s.month
from employees as e join salaries as s
on e.emp_id=s.emp_id;


-- Join employees and departments using department name.
select * from departments;
select e.name,d.department_name
from employees as e join departments as d
on e.department=d.department_name;


-- Get names of employees and their department location.

select e.name,d.department_name,d.location
from employees as e join departments as d
on e.department=d.department_name;



-- List all employees with their total salary using join with salaries.

select e.name, sum(salary_paid)
from employees as e join salaries as s
on e.emp_id = s.emp_id
group by  e.name;


-- List employees and total hours worked from projects.
select * from projects;
select e.name, sum(hours_worked)
from employees as e join projects as p
on e.emp_id =p.emp_id
group by e.name;


-- Get employee name and number of projects.
select e.name, count(project_id)
from employees as e join projects as p
on e.emp_id =p.emp_id
group by e.name;

-- Find employees who haven’t worked on any project (LEFT JOIN).
select e.name
from employees as e left join projects as p
on e.emp_id =p.emp_id
where p.emp_id is null;


-- Find projects with no matching employee (RIGHT JOIN).
select e.name
from employees as e right join projects as p
on e.emp_id =p.emp_id
where e.emp_id is null;


-- Join all four tables to show a full salary + project + department report.

select * from employees;
select * from projects;
select * from departments;
select * from salaries;


select *
from employees as e join departments as d
on e.department=d.department_name
join salaries as s
on e.emp_id=s.emp_id
join projects as p
on e.emp_id=p.emp_id;