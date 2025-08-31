use ajay;
-- C. Correlated Subqueries


-- Find employees whose salary is above the average salary of their own department.

select emp_name 
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>(select avg(salary)
from employees as e2 join salaries as s2
on e2.emp_id=s2.emp_id
where e.dept_id=e2.dept_id);

-- Find employees whose salary is above the average salary of their own department
SELECT e.emp_name, s.salary
FROM employees e
JOIN salaries s 
  ON e.emp_id = s.emp_id
WHERE s.salary > (
    SELECT AVG(s2.salary)
    FROM salaries s2
    JOIN employees e2 ON s2.emp_id = e2.emp_id
    WHERE e2.dept_id = e.dept_id   -- correlate with outer query
);

-- List departments where at least one employee earns more than 60,000.
select dept_id,salary
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>60000;

-- Find employees who are the highest paid in their department.
select emp_name
from employees as e join salaries  as s
on e.emp_id=s.emp_id
where salary in (select max(salary) 
from employees as e2 join salaries  as s2
on e2.emp_id=s2.emp_id
where e.dept_id=e2.dept_id);
--  Find employees who joined before the average hire date of all employees.
select emp_name
from employees 
where hire_date<(select avg(hire_date)
from employees);


-- Show employees whose salary is greater than the salary of at least one other employee in the same department.

select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>(select min(salary) 
from employees as e2 join salaries  as s2
on e2.emp_id=s2.emp_id
where e.dept_id=e2.dept_id);