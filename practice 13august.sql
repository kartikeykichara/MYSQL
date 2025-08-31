use ajay;
-- 3. Aggregate Functions – 10 Questions
-- Find the highest salary.
select max(salary) from salaries;

-- Find the lowest salary.
select min(salary) from salaries;
-- Find the total number of employees.
select count(emp_id) from employees;

-- Calculate the total salary paid.
select sum(salary) from salaries;


-- Calculate the average salary.
select avg(salary) from salaries;

-- Count how many employees are in each department.
select dept_name,count(emp_id) from departments as d
join employees as e
on d.dept_id=e.dept_id
group by dept_name;

-- Find the sum of salaries in the IT department.
select * from salaries;
select sum(salary) from salaries as s
join employees as e
on e.emp_id=s.emp_id
join departments as d
on e.dept_id=d.dept_id
where d.dept_name='IT';

-- Find the department with the maximum total salary.
select dept_name,sum(salary) 
from salaries as s join employees as e
on s.emp_id=e.emp_id
join departments as d
on e.dept_id=d.dept_id
group by d.dept_name
order by sum(salary) desc
limit 1;

-- Find the number of projects in each department.
select * from projects;
select dept_name,count(project_id)
from projects as p join departments as d
on p.dept_id=d.dept_id
group by d.dept_name;

-- Calculate the difference between the highest and lowest salary.

select max(salary)-min(salary) as difference from salaries;

