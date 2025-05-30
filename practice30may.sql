drop database ajay;
create database ajay;
use ajay;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice', 101, 60000, '2021-01-15'),
(2, 'Bob', 102, 55000, '2021-03-10'),
(3, 'Charlie', 101, 75000, '2020-11-05'),
(4, 'David', 103, 50000, '2022-07-20'),
(5, 'Eve', 102, 70000, '2020-09-25'),
(6, 'Frank', 101, 62000, '2021-06-01'),
(7, 'Grace', 103, 52000, '2022-01-11');

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments VALUES
(101, 'Engineering'),
(102, 'Marketing'),
(103, 'Sales');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

INSERT INTO projects VALUES
(1001, 'Apollo', '2021-01-01', '2021-12-31'),
(1002, 'Zeus', '2021-05-01', '2022-04-30'),
(1003, 'Hermes', '2022-01-01', '2022-12-31'),
(1004, 'Athena', '2020-06-01', '2021-06-30');

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    assigned_date DATE,
    PRIMARY KEY (emp_id, project_id)
);

INSERT INTO employee_projects VALUES
(1, 1001, '2021-01-20'),
(1, 1002, '2021-06-01'),
(2, 1001, '2021-02-10'),
(3, 1003, '2022-01-10'),
(4, 1002, '2022-07-25'),
(5, 1004, '2020-10-15'),
(6, 1003, '2022-02-01'),
(6, 1001, '2021-07-01'),
(7, 1003, '2022-03-10');



CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY,
    emp_id INT,
    review_date DATE,
    score INT
);

INSERT INTO performance_reviews VALUES
(1, 1, '2021-12-15', 85),
(2, 1, '2022-12-15', 88),
(3, 2, '2021-11-20', 70),
(4, 3, '2022-03-18', 92),
(5, 4, '2022-08-10', 75),
(6, 5, '2021-09-15', 80),
(7, 6, '2022-06-01', 83),
(8, 7, '2023-01-05', 78);


-- Get employees whose salary is higher than the company average.
select * from employees;
select emp_name from employees
where salary>(select avg(salary) from employees);


-- Find departments with more than 2 employees.

select department_name,count(*) from 
employees as e join departments as d
on e.department_id=d.department_id
group by department_name
having count(*)>2;

-- List employees with the highest salary in their department.
-- select emp_name,salary from employees
-- where salary>(select max(salary) from 
-- 						employees as e join departments as d
-- on e.department_id=d.department_id
-- group by department_name);

SELECT e.emp_name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);




-- Get employees who have worked on more projects than the average.
-- Get employees who have worked on more projects than the average.
SELECT e.emp_id, e.emp_name, COUNT(ep.project_id) AS project_count
FROM employees e
JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING COUNT(ep.project_id) > (
    SELECT AVG(project_count)
    FROM (
        SELECT COUNT(project_id) AS project_count
        FROM employee_projects
        GROUP BY emp_id
    ) AS emp_project_counts
);


-- Find employees who have the maximum review score.
show tables;
select * from performance_reviews;

select emp_name,score 
from employees as e join performance_reviews as p
on e.emp_id=p.emp_id
where score =(select max(score) from performance_reviews);


-- List all departments with total salary above average department salary.
select sum(salary) from employees;
select department_name, sum(salary) 
from employees as e join departments as d
on e.department_id=d.department_id
group by department_name
having sum(salary)>(select avg(salary) from employees);


SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) > (
    SELECT AVG(dept_total)
    FROM (
        SELECT SUM(salary) AS dept_total
        FROM employees
        GROUP BY department_id
    ) AS dept_totals
);


-- Show employees who joined after the earliest hire date in their department.

-- Get all projects where at least 2 employees are assigned.

-- List employees whose review score is greater than their department average.

-- Find employees who don’t have any reviews yet.

-- Get departments without any employees.

-- List employees who never worked on project 'Hermes'.

-- Find the name of the project with the highest number of assignments.

-- Find the department with the highest total salary.

-- Get the second highest salary in each department.




