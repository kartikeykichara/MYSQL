use kk;
show tables;

drop table employees,departments,employess;

show tables;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoinDate DATE
);

INSERT INTO Employees (EmpID, Name, Age, Department, Salary, JoinDate) VALUES
(1, 'John', 30, 'HR', 50000, '2020-05-10'),
(2, 'Alice', 25, 'IT', 60000, '2021-06-15'),
(3, 'Bob', 35, 'IT', 70000, '2019-03-20'),
(4, 'David', 40, 'Finance', 80000, '2018-07-25'),
(5, 'Emma', 28, 'HR', 55000, '2022-01-05'),
(6, 'Michael', 32, 'IT', 65000, '2020-09-17'),
(7, 'Sara', 45, 'Finance', 90000, '2017-11-30');

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

CREATE TABLE Employees1 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age > 18),
    DepartmentID INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE SET NULL
);
INSERT INTO Employees1 (EmpID, Name, Age, DepartmentID, Salary, JoinDate) VALUES
(1, 'John', 30, 1, 50000, '2020-05-10'),
(2, 'Alice', 25, 2, 60000, '2021-06-15'),
(3, 'Bob', 35, 2, 70000, '2019-03-20'),
(4, 'David', 40, 3, 80000, '2018-07-25'),
(5, 'Emma', 28, 1, 55000, '2022-01-05'),
(6, 'Michael', 32, 2, 65000, '2020-09-17'),
(7, 'Sara', 45, 3, 90000, '2017-11-30');

select * from employees1;
select * from departments;

select e.EmpID 
from Employees1 as e join Departments as d
on e.DepartmentId=d.DepartmentId
where e.salary> (select avg(e.salary)
from Employees1 as e join Departments as d
on e.DepartmentId=d.DepartmentId);


select max(e.salary)
from Employees1 as e join Departments as d
on e.DepartmentId=d.DepartmentId 
where e.salary<(select max(e.salary)
from Employees1 as e join Departments as d
on e.DepartmentId=d.DepartmentId);


select max(salary) from employees1;


select e.name
from Employees1 as e join Departments as d
on e.DepartmentId=d.DepartmentId
where e.salary =(select max(e.salary)
from Employees1 as e join Departments as d
on e.DepartmentId=d.DepartmentId);

SELECT e.Name, e.DepartmentID, e.Salary
FROM Employees1 AS e
WHERE e.Salary = (
    SELECT MAX(e1.Salary)
    FROM Employees1 AS e1
    WHERE e1.DepartmentID = e.DepartmentID
);
