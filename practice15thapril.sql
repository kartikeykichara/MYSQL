use bank_db;
show tables;
-- Subqueries
-- Get employees earning more than the average salary.
select * from employee
where salary>(select avg(salary) from employee);

-- Find employees who work on at least one project.
select e.empid ,count(p.projectid)
from employeeproject as e join project as p
on e.projectid= p.projectid
group by e.empid
having count(p.projectid)>=1;


-- List employees who earn the second highest salary.
select * from employee
where salary=(select max(salary) from employee
				where salary =(select max(salary) from employee));


-- Retrieve employees who are older than the youngest employee in the IT department.
select * from employee
where department='IT' and age>(select min(age) from employee);


-- Get departments where employees have an average salary of more than 60000.
select department ,avg(salary) from employee
group by department
having avg(salary)>60000;


-- Find employees who work in a department with fewer than 3 employees.
select * from employee
where department in (select department from employee group by department having count(*)<3);

select * from project;
-- Retrieve the project with the lowest budget.
select * from project 
where budget=(select min(budget) from project);

-- Get employees who are working on multiple projects.
select * from project;
select * from employeeproject;
select e.empid ,count(p.projectid)
from employeeproject as e join project as p
on e.projectid= p.projectid
group by e.empid
having count(p.projectid)>1;
SELECT ep.EmpID, e.Name, COUNT(ep.ProjectID) AS ProjectCount
FROM EmployeeProject ep
JOIN Employee e ON ep.EmpID = e.EmpID
GROUP BY ep.EmpID, e.Name
HAVING COUNT(ep.ProjectID) > 1;


-- Find employees with salaries above the average salary of their department.
select * from employee as e
where salary>(select avg(salary) from employee
				where department=e.department);

