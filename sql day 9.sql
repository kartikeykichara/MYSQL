#datatype in Sql

create database regex;
use regex;

#ddl statement (data definition language)
create table employee(eid int);
insert into employee values(-2147483648);
select * from employee;

create table employee2 (eid int(4));
insert into employee2 values(100);


create table employee3 (eid int(4) zerofill);
insert into employee3 values(12);
select * from employee3;


create table employee4 (eid int unsigned);
insert into employee4 values(4294967294);
select * from employee4;

#int =4 
#big int => 8
#tinyint=> 1 byte=-128 to 127

create table employee5 (id tinyint);
insert into employee5 values(False);
select * from employee5;

#decimal => float and double

create table emp1(salary float);
insert into emp1 values(12.3);
select * from emp1;

create table emp2(salary float(4,2));
insert into emp2 values(124);
select * from emp2;

-- varchar
-- char

create table ep (name1 char(4));
insert into ep values('rgfd');
select name1,length(name1) from ep;

create table ep1 (name1 varchar(4));
insert into ep1 values('X');
select name1,length(name1) from ep1;

#date  and time format
-- yyy-mm-dd     hh:mm:ss

create table test(dob date);
insert into test values (