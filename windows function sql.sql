use ajay;


-- Rank employees by salary (highest first).
select emp_name,salary,
rank() over( order by salary desc)
from employees as e join salaries as s
on e.emp_id=s.emp_id;

-- Rank employees by hire date (oldest first).
select * from employees;
select emp_id,hire_date,
rank() over(order by hire_date)
from employees;

-- Show salary of each employee and the average salary of all employees.
select emp_name,salary,avg(salary),
rank() over(partition by e.emp_id order by  salary)
from employees as e join salaries as s
on e.emp_id=s.emp_id;

-- Calculate the running total of salaries ordered by hire date.
select sum(salary)
over(order by hire_date)
from employees as e join salaries as s
on e.emp_id=s.emp_id;


-- Show each employee’s salary and the difference from the highest salary.
-- select emp_id,salary
-- from employees as e join salaries as s
-- -- on e

-- Show dense rank of employees based on salary.
select emp_name,salary,
dense_rank() over(order by salary)
from employees as e join salaries as s
on e.emp_id=s.emp_id;

-- For each department, rank employees by salary.
select emp_name,dept_name,salary,
rank () over(partition by dept_name order by salary)
from departments as d join employees as e
on d.dept_id=e.dept_id
join salaries as s
on e.emp_id=s.emp_id;


-- Show employees with cumulative salary sum in their department.
select emp_name,dept_name,sum(salary),
rank () over(partition by dept_name order by salary)
from departments as d join employees as e
on d.dept_id=e.dept_id
join salaries as s
on e.emp_id=s.emp_id;

-- Show each salary and the percentage of the total salary pool it represents.

-- Find the first hire date in each department.