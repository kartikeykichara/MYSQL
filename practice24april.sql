use bank_db;

-- GROUP BY and HAVING
-- Show total salary paid per department.
select department,sum(salary) 
from employee
group by department;


-- Find projects that have at least 2 employees assigned.
select p.projectname,count(e.empid)
from project as p join employeeproject as e
on p.projectid=e.projectid
group by p.projectname
having count(e.empid)>=2;


-- Count employees per department having an average salary greater than 60000.
select department,count(empid)
from employee
group by department
having avg(salary)>60000;


-- Retrieve departments with more than 2 employees.
select department,count(empid)
from employee
group by department
having count(empid)>2;


-- Get employees who are the only ones in their department.
select department,count(empid)
from employee
group by department
having count(empid)=1;

-- Find project names that have a total budget greater than 200000.
select * from project;
select projectname,sum(budget)
from project
group by projectname
having sum(budget)>200000;


-- Get department names that have at least one employee earning above 70000.
select department,count(empid)
from employee
group by department
having max(salary)>70000;


-- Count the number of employees working in each project.
select p.projectname,count(e.empid)
from project as p join employeeproject as e
on p.projectid=e.projectid
group by projectname;


-- Retrieve projects that have employees from more than one department.

SELECT ep.ProjectID, p.ProjectName
FROM EmployeeProject ep
JOIN Employee e ON ep.EmpID = e.EmpID
JOIN Project p ON ep.ProjectID = p.ProjectID
GROUP BY ep.ProjectID, p.ProjectName
HAVING COUNT(DISTINCT e.Department) > 1;


-- List departments that have employees with salaries between 50000 and 80000.
SELECT Department, COUNT(*) AS NumEmployees
FROM Employee
WHERE Salary BETWEEN 50000 AND 80000
GROUP BY Department;
