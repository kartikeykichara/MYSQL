use ajay;

-- What is the average salary of all employees?
select avg(salary) from employees;

-- What is the total salary paid to all employees?
select sum(salary) from employees;

-- What is the minimum and maximum salary among employees?
select * from employees
where salary=(select max(salary) from employees);

-- Which employee has the highest salary?
select * from employees
where salary=(select max(salary) from employees);

-- Which department has the lowest average salary?
select department,min(salary) from employees
group by department
order by min(salary)
limit 1;


-- Total hours worked by all employees.
select sum(hours_worked) from projects;


-- Average project hours per employee.
select avg(hours_worked) from projects
group by emp_id;


-- Count of distinct departments.
select distinct(count(department)) from employees;


-- Count of distinct project names.
select distinct(count(project_name)) from projects;


-- Find sum of salaries paid in Jan.
select sum(salary_paid) from salaries
where month='Jan';

-- Find sum of salaries paid in Feb.
select sum(salary_paid) from salaries
where month='FEb';


-- Find employees with salary above average.
select name from employees
where salary>(select avg(salary) from employees);


-- Find employee with least total hours worked.
select emp_id from projects
order by hours_worked
limit 1;