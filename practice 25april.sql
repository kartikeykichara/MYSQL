use bank_db;

-- Increase the salary of all IT employees by 10%.
update employee
set salary=salary+salary*.10
where department='IT';
select * from employee;

select * from employeeproject;
-- Update the role of employee Bob to ‘Senior Developer’.
select e.name,e1.role,e.empid
from employee as e join employeeproject as e1
on e.empid=e1.empid
join project as p
on e1.projectid=p.projectid;

update employeeproject
set role='Senior Developer'
where empid=2;

-- Delete employees who have no assigned projects.

DELETE FROM Employee
WHERE EmpID NOT IN (
    SELECT DISTINCT EmpID FROM EmployeeProject
);


-- Remove projects that ended before 2022.



-- Increase salaries of employees in Finance by 5
update employee
set salary=salary+salary*.5
where department='Finance';
select * from employee;


-- Update the manager of the HR department.
UPDATE Department
SET Manager = 'New Manager Name'
WHERE DeptName = 'HR';


-- Delete employees who earn less than 45000.
DELETE FROM Employee
WHERE Salary < 45000;




-- Increase the budget of 'Project C' by 15%.
UPDATE Project
SET Budget = Budget * 1.15
WHERE ProjectName = 'Project C';


-- Update joining date of Alice to '2020-01-10'.

UPDATE Employee
SET JoiningDate = '2020-01-10'
WHERE Name = 'Alice';


-- Remove employees who have been in the company for more than 10 years.

DELETE FROM Employee
WHERE JoiningDate < DATE_SUB(CURDATE(), INTERVAL 10 YEAR);
