create database jupy;

use jupy;
select * from youtube_stats;

use jupy;
-- Table: employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Table: departments
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Table: projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(50),
    hours INT

);

-- Insert into departments
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales');

-- Insert into employees
INSERT INTO employees VALUES
(101, 'Alice', 2, 80000),
(102, 'Bob', 2, 75000),
(103, 'Charlie', 1, 50000),
(104, 'David', 3, 60000),
(105, 'Eve', 2, 90000),
(106, 'Frank', 4, 70000),
(107, 'Grace', 3, 55000);

-- Insert into projects
INSERT INTO projects VALUES
(1, 101, 'Project X', 100),
(2, 102, 'Project Y', 120),
(3, 103, 'Project A', 80),
(4, 105, 'Project Z', 90),
(5, 106, 'Project B', 70),
(6, 107, 'Project C', 100),
(7, 104, 'Project D', 110);

select * from employees;
select * from departments;

select * from projects; 

-- Find employees who work in the 'Engineering' department.
select emp_id from employees
where dept_id !=(select dept_id from departments 
					where dept_name='Engineering');

-- Get names of employees whose salary is higher than the average salary.
select emp_id from employees
where salary > (select avg(salary) from employees);

-- Find the department name of the employee with the highest salary
select dept_name 
from departments as d join employees as e
on d.dept_id=e.dept_id
where salary=(select max(salary) from employees);

-- Find the name of the employee who has worked the maximum hours.
select e.name 
from employees as e join projects as p
on e.emp_id=p.emp_id
where hours=(select max(hours) from projects);



-- Find employees who work in the same department as 'Alice'.
select emp_id 
from employees as e join departments as d
on e.dept_id=d.dept_id
where d.dept_name in (select dept_name from departments as d join employees as e
							on e.dept_id=d.dept_id
							where e.name='alice');

