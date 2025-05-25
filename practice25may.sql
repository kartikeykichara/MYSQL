use ajay;

select * from employees;
select * from departments;
select * from projects;
show tables;
select * from employee_projects;

-- List all employees with their department names.
select * from employees;
select emp_name,department_name
from employees as e join departments as d
on e.department_id=d.department_id;



-- Show all employees and their projects.
select  * from employee_projects;
select * from projects;
select emp_name,project_name
from employees as e join departments as d
on e.department_id=d.department_id
join projects as p
on d.department_id=p.department_id;


-- List all projects with department names.
select project_name,department_name
from projects as p join departments as d 
on p.department_id=d.department_id;




-- Find employees who have not been assigned to any project.
select * from employee_projects;
select e.emp_id
from employee_projects as e left join  employees as ep
on e.emp_id=ep.emp_id
where e.emp_id is null;



-- List projects with no employees assigned.

select p.project_id
from employee_projects as ep join projects as p
on ep.project_id=p.project_id
where p.project_id is null;

