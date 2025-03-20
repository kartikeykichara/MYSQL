use person;
show tables;
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO department (department_id, department_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT'),
(104, 'Marketing');

CREATE TABLE employee1 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO employee1 (employee_id, first_name, last_name, department_id, salary, hire_date) VALUES
(1, 'John', 'Doe', 101, 50000, '2020-01-15'),
(2, 'Jane', 'Smith', 102, 60000, '2019-03-10'),
(3, 'Michael', 'Brown', 101, 55000, '2021-07-01'),
(4, 'Emily', 'Davis', 103, 70000, '2018-11-20'),
(5, 'David', 'Wilson', 102, 62000, '2020-09-12');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO projects (project_id, project_name, department_id, start_date, end_date) VALUES
(1, 'Project Alpha', 101, '2023-01-01', '2023-06-30'),
(2, 'Project Beta', 102, '2022-05-15', '2023-05-15'),
(3, 'Project Gamma', 103, '2021-03-10', '2023-12-31');

SELECT * FROM department;
SELECT * FROM employee1;
SELECT * FROM projects;

select first_name,salary from employee1;

select * from employee1;

select distinct(department_id) from employee1;

select employee_id,first_name
from employee1
where salary>60000;

select * from employee1
where hire_date>'2020-01-01';

select * from employee1
where last_name like 'S%';

select * from employee1
where first_name like '%a%';

select * from employee1
where salary >55000 and salary<65000;

select * from employee1
order by salary desc;

select * from department;
select d.department_name,count(e.employee_id)
from department as d join employee1 as e
on d.department_id=e.department_id
group by d.department_name
having d.department_name='Finance';


select e.first_name,d.department_name
from department as d join employee1 as e
on d.department_id=e.department_id;

select * from projects;

select p.project_name ,d.department_name
from projects as p join department as d
on p.department_id=d.department_id;

select *
from department as d join employee1 as e
on d.department_id=e.department_id
where d.department_name ='HR';

select *
from department as d left join employee1 as e
on d.department_id=e.department_id
where e.employee_id is null;

select 	* 
from employee1 as e join projects as p join department as d
on p.department_id=d.department_id 
on e.department_id=p.department_id;

select * 
from projects as p join employee1 as e
on p.department_id = e.department_id;

select e.first_name
from employee1 as e join department as d
on e.department_id = d.department_id
where d.department_name !='IT';

(select d.department_name
from employee1 as e join department as d
on e.department_id = d.department_id 
where e.first_name='John');