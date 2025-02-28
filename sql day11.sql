-- foreign key constraint
-- realationship define krna=> entity
-- parent child

use regex;
create table product123(pid int primary key ,amount int);
insert into product123 values (101,8616),( 102,4686);
select * from product123;

create table order123(oid int ,city varchar(20),
product_id int,
foreign key (product_id) references product123
(pid));

insert into order123 values(9632,'jaipur',101);
insert into order123 values(5425,'bhilwara',107);
insert into order123 values(5425,'bhilwara',102);

select * from order123;

create table product1(pid int primary key ,amount int);

insert into product1 values(101,5466),(102,5456),
(103,15466);

select * from product1;

create table order1(oid int ,city varchar(20),
product_id int,
foreign key (product_id) references 
product1(pid) on update cascade on delete cascade);

insert into order1 values(9632,'jaipur',101),(5425,'bhilwara',102);

delete from product1 where pid=101;

select * from order1;

UPDATE product1 SET pid = 101 WHERE pid = 102;

