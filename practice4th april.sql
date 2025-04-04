show databases;
use test1;
show tables;
drop table orders;
drop table product;

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    manager_id INT,
    department_id INT,
    hire_date DATE,
    birth_date DATE
);

-- Insert Sample Employees
INSERT INTO employees VALUES
(1, 'Alice', 80000, NULL, 1, '2015-06-01', '1990-05-20'),
(2, 'Bob', 60000, 1, 1, '2018-07-15', '1992-11-10'),
(3, 'Charlie', 70000, 1, 2, '2016-09-23', '1988-01-30'),
(4, 'David', 50000, 2, 2, '2019-04-10', '1994-08-12'),
(5, 'Emma', 90000, NULL, 3, '2014-01-05', '1985-07-05');

-- Create Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

-- Insert Sample Departments
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Insert Sample Orders
INSERT INTO orders VALUES
(1, 101, 1, '2024-01-10', 200),
(2, 102, 2, '2024-02-05', 150),
(3, 103, 3, '2024-03-15', 300),
(4, 101, 2, '2024-04-01', 180);

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Insert Sample Products
INSERT INTO products VALUES
(1, 'Laptop', 1000),
(2, 'Phone', 800),
(3, 'Tablet', 500);

select * from employees;
select * from products;
select * from departments;
select * from orders;

select max(salary) from employees
where salary<(select max(salary) from employees);

select e1.name,e2.name
from employees as e1 join employees as e2
where e1.manager_id=e2.emp_id;

(select * from employees
order by hire_date
limit 1) 
union
(select * from employees
order by hire_date desc
limit 1 );

select * from orders
where order_date=(select max(order_date) from orders);

select * from orders
order by order_date desc
limit 1;

select sum(salary) as total_salary from 
employees as e join departments as d
on e.department_id=d.department_id
group by d.dept_name
having sum(salary)>100000;


select *,sum(amount)
over(partition by customer_id order  by order_date)
from orders;