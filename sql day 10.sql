#constraint 

-- set of rules & regulation ==? invalid data
-- declaration of table 

use regex;

create table employee01(id int);

insert into employee01 values(10);

insert into employee01 values(10),(20),(30),(null),(40);

select * from employee01;

select count(id) from employee01;

create table employee02(id int not null);

insert into employee02 values(10),(20),(30),(40);
select * from employee02;

insert into employee02 values(null);


create table employee03(id int ,salary int default 0);
insert into employee03 values(10,20),(30,40);
insert into employee03(id) values (50);
insert into employee03(id,salary) values (50,null);
select * from employee03;


create table employee04(id int ,salary int unique );
insert into employee04 values(10,20),(30,40);
insert into employee04 values(30,40);
insert into employee04(id,salary) values (50,null);
select * from employee04;


-- primary key
create table employee05(id int primary key ,salary int unique );
insert into employee05 values(10,20),(30,40);
insert into employee05 values(30,40);
insert into employee05 values(null,40);
insert into employee05(id,salary) values (50,null);
select * from employee05;

drop table employee05;
create table employee05(id int primary key ,fname varchar(20),
salary int, constraint regex_emp_salary_uk unique (salary) );
insert into employee05 values (10,'a',99);
insert into employee05 values (20,'d',89);
select * from employee05;


create table students(id int ,s_name varchar(20) ,fees int not null ,
clg_name varchar(20)default 'regex', phone_no int,
constraint regex_stu_id_fname_pk primary key(id,s_name),
constraint regex_stu_phone_no  unique(phone_no));

desc students;


