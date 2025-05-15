show databases;
use ajay;
show tables;
drop database ajay;
create database ajay;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice', 'HR', 50000, '2020-01-15'),
(2, 'Bob', 'IT', 70000, '2019-03-22'),
(3, 'Charlie', 'IT', 80000, '2021-07-01'),
(4, 'David', 'Finance', 75000, '2018-11-12'),
(5, 'Eva', 'HR', 52000, '2022-04-10'),
(6, 'Frank', 'Finance', 76000, '2020-06-05');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(100),
    hours_worked INT
);

INSERT INTO projects VALUES
(101, 1, 'Onboarding', 20),
(102, 2, 'Migration', 35),
(103, 2, 'CyberSecurity', 40),
(104, 3, 'CloudInfra', 50),
(105, 4, 'Audit', 30),
(106, 5, 'Recruitment', 25),
(107, 6, 'BudgetAnalysis', 45);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR', 'Delhi'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Mumbai');

CREATE TABLE salaries (
    emp_id INT,
    month VARCHAR(10),
    salary_paid INT
);

INSERT INTO salaries VALUES
(1, 'Jan', 50000),
(1, 'Feb', 50000),
(2, 'Jan', 70000),
(2, 'Feb', 70000),
(3, 'Jan', 80000),
(3, 'Feb', 80000),
(4, 'Jan', 75000),
(5, 'Jan', 52000),
(6, 'Jan', 76000);

-- Show total salary per department.
select * from employees; 
select department,sum(salary) as total_salry from employees
group by department;

-- Count number of employees per department.
select department , count(emp_id) from employees
group by department;

-- Average salary per department.
select department, avg(salary) from employees
group by department;



-- Highest salary per department.
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;


-- Number of projects per employee.
select * from projects;
select count(p.project_id)
from employees as e join projects as p
on e.emp_id=p.emp_id
group by e.emp_id;


-- Total hours worked per employee.
select * from projects;


-- Total salary paid per employee from salaries table.
select * from salaries;
select e.emp_id,sum(s.salary_paid)
from employees as e join salaries as s
on e.emp_id=s.emp_id
group by e.emp_id;


-- Average hours worked per employee.

-- Count how many employees joined each year.

-- Average salary per year of joining.

-- Number of employees per location using departments + employees.

-- Total salary paid per month.

-- Count of employees receiving salary in each month.





