use ajay;
show tables;

select id from table_1
union all
select id from table_2
where id !=0;

-- Find employees whose salary is equal to any salary in the IT department.
select emp_name from 
employees as e join salaries as s
on e.emp_id=s.emp_id
where salary in (select salary 
from salaries as s join employees as e
on s.emp_id=e.emp_id
join departments as d
on e.dept_id=d.dept_id
where dept_name='IT');


-- Find employees who earn more than all employees in the HR department.

select emp_name,salary
from employees as e join salaries as s
on e.emp_id=s.emp_id
where salary >all(select salary 
from salaries as s join employees as e
on s.emp_id=e.emp_id
join departments as d
on e.dept_id=d.dept_id
where dept_name='HR');

-- Show employees whose salary matches one of the top 3 highest salaries.
select emp_name
from employees as e join salaries as s
on e.emp_id=s.emp_id
where s.salary in (select t.salary from(select distinct salary
from salaries 
order by salary desc
limit 3) as t);

-- Show employees who are in departments that have at least one project.
select emp_name
from employees 
where dept_id in(select d.dept_id
from departments as d join projects as p
on d.dept_id=p.dept_id
group by dept_id
having count(project_id)>=1);

-- Find employees whose department has more than 1 employee.
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
JOIN departments d 
  ON e.dept_id = d.dept_id
WHERE e.dept_id IN (
    SELECT dept_id
    FROM employees
    GROUP BY dept_id
    HAVING COUNT(emp_id) > 1
);
