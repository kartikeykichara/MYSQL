use ajay;



 -- Find average salary per department.
 
 select dept_name,avg(salary) 
from salaries as s join employees as e
on s.emp_id=e.emp_id
join departments as d
on e.dept_id=d.dept_id
group by d.dept_name;

 -- Show departments where the average salary is greater than 60,000.
  select dept_name,avg(salary) 
from salaries as s join employees as e
on s.emp_id=e.emp_id
join departments as d
on e.dept_id=d.dept_id
group by d.dept_name 
having avg(salary)>60000;

-- Count employees per department and only show departments with more than 1 employee.

-- Find total salary per department and only show where it exceeds 100,000.

-- Show average salary per department, ordered by average salary descending.
 select dept_name,avg(salary) 
from salaries as s join employees as e
on s.emp_id=e.emp_id
join departments as d
on e.dept_id=d.dept_id
group by d.dept_name
order by avg(salary) desc ;

-- List departments with exactly 1 employee.
select dept_name,count(emp_id)
from employees as e join departments as d
on e.dept_id=d.dept_id
group by dept_name
having count(emp_id)=1;


-- Find departments where the highest salary is above 65,000
select dept_name,max(salary)
from departments as d join employees as e
on d.dept_id=e.dept_id
join salaries as s
on s.emp_id=e.emp_id
group by dept_name
having max(salary)>65000;
-- Show total projects per department, only if there are more than 0 projects.

-- Find departments where total salary is between 50,000 and 130,000.

-- Find departments with the smallest average salary.

