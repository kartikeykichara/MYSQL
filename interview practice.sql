create database kk;
use kk;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice', 101, NULL, '2020-01-15'),
(2, 'Bob', 101, 1, '2021-03-12'),
(3, 'Charlie', 102, 1, '2022-06-25'),
(4, 'David', 102, 2, '2019-11-10'),
(5, 'Eve', 103, 2, '2023-05-01'),
(6, 'Frank', 101, 3, '2021-09-19');

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Sales');


CREATE TABLE salaries (
    emp_id INT,
    salary INT,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO salaries VALUES
(1, 90000),
(2, 60000),
(3, 75000),
(4, 50000),
(5, 65000),
(6, 80000);

CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(50),
    dept_id INT
);

INSERT INTO projects VALUES
(201, 'AI System', 101),
(202, 'Recruitment Portal', 102),
(203, 'Tax Audit', 103);



-- Level 1: Basic Queries

-- Select all employees from the employees table.

select * from employees;

-- Get names of employees whose salary is greater than 50,000.
select *from salaries;
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>50000;

-- Find employees who joined after 2022-01-01.
select emp_name
from employees
where hire_date>'2022-01-01';

-- Get employees who do not have a manager.
select * from employees;
select distinct e1.emp_name
from employees as e1 join employees as e2
on e1.emp_id=e2.manager_id
where e1.manager_id  is null;

-- Find employees from the Finance department.
select emp_name
from employees as  e join departments as d
on e.dept_id=d.dept_id
where d.dept_name='Finance';													



-- Show all distinct department names.
select distinct(dept_name)
from departments ;

-- Count the total number of emplo
select count(emp_id) as total_employees
from employees;

-- List employees and their salaries in descending order.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
order by salary desc;


-- 🔹 Intermediate

-- Find the highest salary in the company.
select max(salary) from salaries;

-- Find the second highest salary
select max(salary)
from salaries
where salary<(select max(salary) from salaries);

-- Show the top 3 highest salaries.
select salary
from salaries
order by salary desc
limit 3;
-- Find the minimum salary in each department.

-- Show the average salary per department.

-- List departments having more than 2 employees.

-- Show employees earning more than the company average salary.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>(select avg(salary) from salaries);

-- Find duplicate salaries (if any).

-- List employees whose salary is between 60,000 and 80,000.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>60000 and salary<80000;

-- Find employees who work in a department with at least one project.

select emp_name
from employees as e join departments as d
on e.dept_id=d.dept_id
where dept_name in (select dept_name
from departments as d join projects as p
on d.dept_id=p.dept_id
group by dept_name
having count(project_id)>=1);