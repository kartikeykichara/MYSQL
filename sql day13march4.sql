use kk; 

show tables;

create table emp(eid int primary key , name varchar(20));

insert into emp values (1,"aman"),(2,"shubham"),(3,"abc");

select * from emp;
drop table emp_family;

create table emp_family(eid int , name varchar(20),father varchar(20));

insert into emp_family values (1,"aman","raj"),(2,"shubham","kamal"),(3,"abc","aman"),(4,"ujjwal","kaluram");
select * from emp_family;


select * from emp;





create table empp(eid int primary key ,name varchar(20),salary int ,department_id int);

insert into empp values(1,"tushar",900,10),
(2,"shubham",100,10),(3,"aman",50,10),
(4,"shakshi",200,11),(5,"naina",300,11);

select * from empp;

select department_id,avg(salary)
from empp
group by department_id;

select * from empp where
salary>(select avg(salary) from empp as e 
where empp.department_id=e.department_id
group by department_id);


insert into empp values(6,"isha",350,12);


create table product1 (pid int primary key ,product_name varchar(20));

insert into product1 values(10,"cosmetic"),(20,"facewash"),(30,"cream");

drop table order1;
create table order1 (oid int,cust_name varchar(20),pid int);

insert into order1 values(101,"rohan",40),(102,"sohan",50),(103,"ajay",60);


select * from product1
where exists (select oid from  order1 where  product1.pid=order1.pid);

select * from product1
where not exists (select oid from  order1 where  product1.pid=order1.pid);


