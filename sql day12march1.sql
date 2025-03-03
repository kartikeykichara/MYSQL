use sakila;

select  max(amount) from payment
where amount<(select max(amount) from payment);

#DDL statement 
-- data definition language

-- create,drop,alter

-- DML 
-- inserting ,update,delete

create database march3;

use march3;

create table regex(id int ,name varchar(20));

insert into regex values(1,'kk');

select * from regex;

insert into regex values('sohan');

insert into regex(name) values('sohan');

select * from regex;

insert into regex(name) values('sohan'),('rohan');


-- ctas 
create table y2 as select * from sakila.actor;

select * from y2;
drop table y3;
create table y3 as select  actor_id ,first_name from sakila.actor;

select * from y3;

create table y4 as select  actor_id as new_actor_id ,first_name as First_Name from sakila.actor;

select * from y4;

-- delete 
select * from y3;

delete from y3;


delete from y3 where actor_id in(2,4);

select * from y3;

-- update 
update y3 set first_name="regex";

select * from y3;

update y3 set first_name="kk" 
where actor_id>2 and actor_id<10;

select * from y3;

-- ddl > drop,truncate

select * from y3;  -- drop does not take any condition  and it  delete whole data of table and table
drop table y3;


s
create table y3 as select  actor_id as new_actor_id ,first_name as First_Name from sakila.actor;

create table y5 as select * from sakila.payment;

create table y6 as select  actor_id as new_actor_id ,first_name as First_Name from sakila.actor;

select * from y6;
select * from y5;

truncate table y6; 

select * from y6;

create table companies(id int);

insert into companies(id) values(10);
select * from companies;
desc companies;

alter table companies
add column phone varchar(15);

select * from companies;

desc companies;

alter table companies
add column emp_id int not null;

select * from companies;


alter table companies
drop column emp_id;

select * from companies;


-- rename table

rename table companies to new_companies;

select * from companies;
select * from new_companies;


alter table new_companies 
rename to companies;

select * from companies;

alter table companies
rename column phone to mobile_no ;

select * from companies;

update companies set mobile_no="kk" where id=10;

alter table companies
add column company_name varchar(15);

alter table companies add  constraint march3_company unique(company_name);


alter table companies modify mobile_no int ;


update companies set mobile_no=0;

alter table companies modify mobile_no int;


