use ajay;
-- Show all employees with their department names.
select * from departments;
select emp_name,dept_name 
from employees as e join departments as d
on e.dept_id=d.dept_id;

-- List all projects along with their department names.
select * from projects;
select project_name ,dept_name
from projects as p join departments as d
on p.dept_id=d.dept_id;

-- Get employee names and salaries by joining employees and salaries tables.
select * from employees;
select * from salaries;
select emp_name,salary
from employees as e join salaries as s
on  e.emp_id=s.emp_id;


-- Find employees working in the IT department.
select emp_name
from employees as e join departments as d
on e.dept_id=d.dept_id
where d.dept_name='IT';

-- List all employees with their department and project names.
select emp_name,dept_name,project_name
from employees as e join departments as d
on e.dept_id=d.dept_id
join projects as p
on d.dept_id=p.dept_id;

-- Show departments that have no employees.
select dept_name 
from departments as d join employees as e
on d.dept_id=e.dept_id
group by dept_name
having count(emp_id)=0;

-- List all employees who don’t have a salary record.
select emp_name 
from employees as e left join salaries as s
on e.emp_id = s.emp_id
where s.emp_id is null;

-- Get all employees and their departments, including those without departments.
select emp_name,dept_name
from employees as e left join departments as d
on e.dept_id=d.dept_id;

-- Show all projects along with employees working in that department.
select * from projects;
select project_name,emp_name,dept_name
from projects as p join departments as d
on p.dept_id=d.dept_id
join employees as e
on d.dept_id=e.dept_id;

-- List employees and their salaries where salary is above 60,000.
select emp_name,salary
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>60000;

