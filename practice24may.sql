use ajay;
drop database ajay;

create database ajay;
use ajay;

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice', 101, 70000, '2020-01-15'),
(2, 'Bob', 102, 50000, '2019-03-10'),
(3, 'Charlie', 101, 80000, '2021-07-23'),
(4, 'David', 103, 45000, '2022-11-12'),
(5, 'Eva', 102, 60000, '2018-08-30'),
(6, 'Frank', 101, 75000, '2020-05-14');

CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'Engineering'),
(102, 'Marketing'),
(103, 'HR');


CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(50),
    department_id INT
);

INSERT INTO projects VALUES
(1, 'AI Research', 101),
(2, 'Ad Campaign', 102),
(3, 'Employee Engagement', 103),
(4, 'Cloud Migration', 101);


CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    hours_worked INT
);

INSERT INTO employee_projects VALUES
(1, 1, 120),
(1, 4, 60),
(2, 2, 100),
(3, 1, 140),
(4, 3, 80),
(5, 2, 90),
(6, 4, 100);

select * from employees;
select * from departments;
-- Rank employees within each department by salary.

select *,
rank() over(partition by d.department_name order by salary)
from employees as e join departments as d
on e.department_id=d.department_id;


-- Rank employees company-wide by hire date.
select * from employees;

select * ,
rank() over(order by hire_date)
from employees;


-- Calculate the running total of salary per department.
select *,
sum(salary) over(partition by department_name order by salary)
from employees as e join departments as d
on e.department_id=d.department_id;


-- Show the average salary in a department for each employee (without grouping).
select *,
avg(salary) over(partition by department_name order by emp_name)
from employees as e join departments as d
on e.department_id=d.department_id;


-- Find the difference in salary from the department average for each employee.

-- Get the employee with the highest salary per department using window function.

-- Assign row numbers to employees ordered by salary within each department.

-- Show cumulative salary sorted by hire date.

-- Calculate percentage of total department salary each employee contributes.

-- Calculate lag in salary between current and previous employee by department.

-- Calculate lead salary per department.





