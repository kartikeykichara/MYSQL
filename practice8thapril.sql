show databases;
use person;
use bank_db;
show tables;
-- Retrieve all records from the Employee table.
select * from employee;

-- Select names of all employees.
select name from employee;

-- Fetch employees whose salary is greater than 60000.
select * from employee
where salary >60000;

-- Find employees who joined after 2019.
select * from employee
where year(joiningDate)>'2019';

-- List employees from the HR department.
select * from employee
where department='HR';

-- Count the total number of employees.
select count(*) from employee;

-- Find the highest salary in the Employee table.
select * from employee
where salary=(select max(salary) from employee);

-- Find the average salary of employees.
select round(avg(salary),2) from employee;

-- Retrieve the lowest salary.
select * from employee
where salary=(select min(salary) from employee);

-- List employees sorted by salary in descending order.
select * from employee
order by salary desc;

-- Joins and Relationships
-- Get employee names along with their department names.
select * from department;
show tables;
select name,department
from employee;

-- Retrieve all employees and their project names.
select * from employeeproject;
select * from project;
select e.empid,p.projectname
from employeeproject as e join project as p
on e.projectID=p.projectid;

-- Find employees working on 'Project A'.
select e.empid 
from employeeproject as e join project as p
on e.projectID=p.projectid
where p.projectname='Project A';

-- Get departments with their respective managers.
select * from employee;
select * from department;
select distinct(department ),manager
from employee as e join department as d
on e.department=d.deptname;

-- Show employees who are not assigned to any project.
select * from employeeproject;
select e.empid
from employeeproject as e join project as p
on e.projectID=p.projectid
where p.projectid is null;
SELECT e.EmpID, e.Name
FROM Employee e
LEFT JOIN EmployeeProject ep ON e.EmpID = ep.EmpID
WHERE ep.ProjectID IS NULL;



-- Get projects that have more than one employee working on them.
select * from employeeproject;
select p.projectid
from employeeproject as e join project as p
on e.projectID=p.projectid
group by e.projectid
having count(empid)>1;

-- Retrieve employees and their roles in projects.
select e.empid,e.role
from employeeproject as e join project as p
on e.projectID=p.projectid;

-- Find employees working in IT and their assigned projects.
-- select * from employeeproject;
-- select * from department;
-- select * from project;
select e.empid,p.projectname
from employee as e join department as d
on e.department=d.deptname
join employeeproject as e1  on e1.empid=e.empid
join project as p on p.projectid=e1.projectid
where d.deptname='IT';


-- List projects along with total employees assigned to each.
select p.projectname,count(empid)
from employeeproject as e join project as p
on e.projectID=p.projectid
group by p.projectname;

-- Fetch employees along with department and project details.
select e.name,e.department,p.projectname
from employee as e join department as d
on e.department= d.deptname
join employeeproject as e1 on e1.empid=e.empid
join project as p on e1.projectid=p.projectid;

-- Aggregate Functions
-- Count employees in each department.
select count(empid)
from employee
group by department;

-- Find the total salary expense of the company.
select sum(salary) from employee;

-- Find the department with the highest number of employees.
select department,count(empid)as total_employee
from employee
group by department;

-- Calculate the average age of employees.
select avg(age) from employee;

-- List the total number of projects.
select count(projectname) from project;

-- Find employees who have the same salary.
select e1.name
from employee as e1 join employee as e2
where e1.salary=e2.salary AND e1.EmpID < e2.EmpID;

-- Retrieve the sum of salaries of employees working in Finance.
select sum(salary) 
from employee
where department='Finance';

-- Get the employee with the longest tenure.
select (max(year(joiningdate))-min(year(joiningdate))) as maximum_tenure
from employee;
SELECT Name, JoiningDate
FROM Employee
ORDER BY JoiningDate ASC
LIMIT 1;


-- Find the maximum budget allocated to a project.
select * from project;
select projectname
from project
where budget=(select max(budget) from project);

-- Count the number of employees assigned to each project.
select projectname,count(empid)
from employeeproject as e join project as p
on e.projectid=p.projectid
group by projectname;

-- Subqueries
-- Get employees earning more than the average salary.
select * from employee
where salary>(select avg(salary) from employee);

-- Find employees who work on at least one project.
select  


-- List employees who earn the second highest salary.

-- Retrieve employees who are older than the youngest employee in the IT department.

-- Get departments where employees have an average salary of more than 60000.

-- Find employees who work in a department with fewer than 3 employees.

-- Retrieve the project with the lowest budget.

-- Get employees who are working on multiple projects.

-- Find employees with salaries above the average salary of their department.

-- List employees who joined before any employee in the Finance department.

-- GROUP BY and HAVING
-- Show total salary paid per department.

-- Find projects that have at least 2 employees assigned.

-- Count employees per department having an average salary greater than 60000.

-- Retrieve departments with more than 2 employees.

-- Get employees who are the only ones in their department.

-- Find project names that have a total budget greater than 200000.

-- Get department names that have at least one employee earning above 70000.

-- Count the number of employees working in each project.

-- Retrieve projects that have employees from more than one department.

-- List departments that have employees with salaries between 50000 and 80000.

-- Advanced Queries
-- Find the top 3 highest-paid employees.

-- Get employees who are not in the HR department but earn more than 60000.

-- Fetch employees working in both IT and Finance.

-- Retrieve project names along with the employees working on them.

-- Get employees who are working in a project that started before 2023.

-- Find employees who joined in the same year.

-- List all employees who are working on projects ending in 2024.

-- Get projects that have the highest budget.

-- Find employees who are earning a salary equal to any employee in the IT department.

-- Fetch the department having the lowest average salary.

-- UPDATE and DELETE
-- Increase the salary of all IT employees by 10%.

-- Update the role of employee Bob to ‘Senior Developer’.

-- Delete employees who have no assigned projects.

-- Remove projects that ended before 2022.

-- Increase salaries of employees in Finance by 5%.

-- Update the manager of the HR department.

-- Delete employees who earn less than 45000.

-- Increase the budget of 'Project C' by 15%.

-- Update joining date of Alice to '2020-01-10'.

-- Remove employees who have been in the company for more than 10 years.

-- Complex Queries
-- Find employees who are working on more than one project.

-- Get employees who are assigned to the same project as 'Charlie'.

-- Retrieve employees who have a salary greater than their manager.

-- Fetch all employees with even Employee IDs.

-- Get the department with the highest total salary expense.

-- Find employees who are in departments that do not have a manager assigned.

-- Retrieve projects that have employees from only one department.

-- Get employees who joined between 2018 and 2020.

-- Fetch employees whose names start with 'A'.

-- List employees who have been assigned to more than 2 projects.

