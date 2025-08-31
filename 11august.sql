create database ajay;
use ajay;
-- Drop tables if already exist
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS projects;

-- Create tables
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10,2),
    effective_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    start_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert departments
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

-- Insert employees
INSERT INTO employees VALUES
(101, 'Alice', 1, '2020-01-15'),
(102, 'Bob', 2, '2019-03-12'),
(103, 'Charlie', 3, '2021-06-10'),
(104, 'David', 3, '2018-07-01'),
(105, 'Eve', 4, '2020-10-20');

-- Insert salaries
INSERT INTO salaries VALUES
(101, 50000, '2020-01-15'),
(102, 60000, '2019-03-12'),
(103, 55000, '2021-06-10'),
(104, 70000, '2018-07-01'),
(105, 65000, '2020-10-20');

-- Insert projects
INSERT INTO projects VALUES
(201, 'Recruitment Drive', 1, '2021-01-01'),
(202, 'Budget Planning', 2, '2021-03-15'),
(203, 'Website Development', 3, '2021-05-20'),
(204, 'Ad Campaign', 4, '2021-07-10');

-- 1. Basic SELECT & WHERE – 10 Questions
-- Select all columns from employees.
select * from employees;


-- Show only the emp_name and dept_id from employees.

select emp_name,dept_id from employees;

-- Show employees hired after 2020-01-01.
select * from employees
where hire_date>'2020-01-01';

-- Find employees with salary greater than 60000.
select * from salaries
where salary>60000;

-- Find employees working in department 3.
select * from employees
where dept_id=3;



-- Get details of employee named Alice.
select * from employees
where emp_name='Alice';

-- Show all employees not in the HR department.

-- Find employees hired in the year 2019.

-- Show all employees whose name starts with “D”.
select * from employees
where emp_name like 'D%';

-- Find employees with salary between 55,000 and 65,000.
select * from salaries
where salary between 55000 and 65000;
