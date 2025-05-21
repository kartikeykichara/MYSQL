use ajay;
show tables;

use jupy;
show tables;
select * from employees;

-- Find employees who work in the same department as 'Alice'.
select e.name
from employees as e join departments as d
on e.dept_id=d.dept_id
where d.dept_name in (select d.dept_name from departments as d join  employees  as e
							on e.dept_id=d.dept_id
							where e.name='Alice');


-- List employees whose salary is greater than any employee in the HR department.
select e.name
from employees as e join departments as d
on e.dept_id=d.dept_id
where e.salary >any(
SELECT salary
    FROM employees
    WHERE dept_id = (
        SELECT dept_id 
        FROM departments 
        WHERE dept_name = 'HR'
    )
);


-- List project names where the employee has more hours than any project done by employee 'David'.
select *  from projects;
select p.project_name 
from projects  as p join employees as e
on p.emp_id=e.emp_id
where hours>any(select 
hours from projects as p join employees as e
on p.emp_id=e.emp_id
where e.name ='David');

SELECT p.project_name
FROM projects p
JOIN employees e ON p.emp_id = e.emp_id
WHERE p.hours > ANY (
    SELECT p2.hours
    FROM projects p2
    JOIN employees e2 ON p2.emp_id = e2.emp_id
    WHERE e2.name = 'David'
);

select project_name 
from employees as e join projects as p
on e.emp_id=p.emp_id
where hours>any(select 
hours from projects as p join employees as e
on e.emp_id=p.emp_id
where e.name =(select name from employees where name='David'));


 