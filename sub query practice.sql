-- 📌 Employee–Salary Based
use ajay;

-- Find employees whose salary is above the average salary of their own department.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>(select avg(salary)
from employees as e2 join salaries as s2
on e2.emp_id=s2.emp_id
where e.dept_id=e2.dept_id);
-- Find employees who are the highest paid in their department.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary=(select max(salary) 
from employees as e2 join salaries as s2
on e2.emp_id=s2.emp_id
where e.dept_id=e2.dept_id);

-- Find employees who are the lowest paid in their department.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary=(select min(salary) 
from employees as e2 join salaries as s2
on e2.emp_id=s2.emp_id
where e.dept_id=e2.dept_id);

-- Find employees whose salary is greater than the salary of at least one other employee in the same department.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>any(select (salary) 
from employees as e2 join salaries as s2
on e2.emp_id=s2.emp_id
where e.dept_id=e2.dept_id);

-- Find employees whose salary is less than the salary of all other employees in their department.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary<all(select (salary) 
from employees as e2 join salaries as s2
on e2.emp_id=s2.emp_id
where e.dept_id=e2.dept_id);

-- Find employees who joined earlier than the average hire date of their department.
select emp_name
from employees as e1
where e1.hire_date<(select avg(e2.hire_date) 
from employees as e2
join employees as e1
on e1.emp_id=e2.emp_id
where e1.dept_id=e2.dept_id);

-- List employees whose salary is greater than the overall average salary but still below the max salary in their department

select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary>(select avg(salary) from 
employees as e2 join salaries as s2
on e2.emp_id=s2.emp_id)
AND salary<(select max(salary)
from employees as e3 join salaries as s3
on e3.emp_id=s3.emp_id
where e.dept_id=e3.dept_id);

SELECT e.emp_name, s.salary, e.dept_id
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.salary > (
          SELECT AVG(s2.salary)
          FROM salaries s2
)
AND s.salary < (
          SELECT MAX(s3.salary)
          FROM employees e3
          JOIN salaries s3 ON e3.emp_id = s3.emp_id
          WHERE e3.dept_id = e.dept_id
);
