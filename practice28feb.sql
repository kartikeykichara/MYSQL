use kk;
show tables;

select * from employess;

select FNAME,count(dept) from employess
group by FNAME;


select DEPT,sum(SALARY) from employess
group by DEPT;

select * from employess;


SELECT FNAME,COUNT(DESIG) FROM employess
group by FNAME;

SELECT DEPT,count(DESIG) FROM employess
group by DEPT;

select * from employess;


USE SAKILA;

SELECT * FROM PAYMENT;

SELECT customer_id,sum(amount) from payment
group by customer_id;

SELECT customer_id,avg(amount) from payment
group by customer_id;

SELECT * FROM PAYMENT;

select amount,count(amount) from payment
group by amount;

select * from payment;

select customer_id,count(customer_id) from payment
group by customer_id;

select * from payment;

select month(payment_date) ,sum(amount) from payment
group by month(payment_date);

select * from payment;

select staff_id,sum(amount) from payment
group by staff_id;

select * from payment;

select * from payment
where amount>(select amount from payment
where payment_id=1);

select * from actor;

select  * from payment;

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

select * from Employees;

select Name,Salary from Employees
where Department='IT';

select * from Employees
where JoinDate>'2020-01-01';

select Name from Employees
where Salary>60000;

select Department,count(Name) from Employees
group by Department;

select avg(Salary) from Employees
where Department='Finance';

select max(Salary) from Employees;


select * from Employees
where Name like 'A%';

select * from Employees
where age>30 and age<40;

select sum(Salary) from Employees;

select * from Employees
order by JoinDate;

select count(Name) from Employees
where Department='IT';

select max(Salary) from Employees
where Salary<(select max(Salary) from Employees);

select * from Employees
where year(JoinDate)='2020';

select * from Employees
order by age
limit 1;

select * from Employees
where Department='HR' or Department='Finance';

select * from Employees
where EmpID%2=0;

drop table Employees;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age > 18),
    DepartmentID INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE SET NULL
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO Employees (EmpID, Name, Age, DepartmentID, Salary, JoinDate) VALUES
(1, 'John', 30, 1, 50000, '2020-05-10'),
(2, 'Alice', 25, 2, 60000, '2021-06-15'),
(3, 'Bob', 35, 2, 70000, '2019-03-20'),
(4, 'David', 40, 3, 80000, '2018-07-25'),
(5, 'Emma', 28, 1, 55000, '2022-01-05'),
(6, 'Michael', 32, 2, 65000, '2020-09-17'),
(7, 'Sara', 45, 3, 90000, '2017-11-30');

select * from Employees;

select * from Departments;

select e.name,d.DepartmentName
from Employees as e join Departments as d
on e.DepartmentID=d.DepartmentID;


select * 
from Employees as  e left join Departments as d
on e.DepartmentID=d.DepartmentID;

select d.DepartmentName
from Employees as e right join Departments as d
on e.DepartmentID=d.DepartmentID
where e.EmpID is null;

select d.DepartmentName,sum(e.Salary)
from Employees as e join Departments as d
on e.DepartmentID=d.DepartmentID
group by d.DepartmentName;

