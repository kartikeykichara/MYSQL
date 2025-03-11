-- views
-- cte 
-- common table expression
-- table => query=> name
-- query ko readble
-- expression
-- again use kr skta hu

-- temporary table

-- view => 
/*virtual table

user> queries interact kr paye
- do not store data on disk
-- refrence to your original table
-- using query

table(test) =>select * from table
test=> select * from table join test
*/
use regex;
show tables;

-- ctas create table as select 
create table  payment as select * from sakila.payment;
select * from payment;

create view pay_view
as select payment_id,customer_id from payment;

select * from pay_view;



create table  payment2 as 
	select payment_id,customer_id from sakila.payment where 
		payment_id<5;
  
create view payment_v as select * from payment2;

select * from payment_v;

insert into payment_v values(5,10);
select * from payment_v;
	
select * from payment2;

create view payment_v4 as select payment_id from payment2;
select * from payment_v4;

insert into payment_v4 values(5);

select database();
select * from sakila.actor;

select * from sakila.film_actor ;
select * from sakila.actor join sakila.film_actor 
on actor.actor_id=film_actor.actor_id;

create view common_view as select actor.actor_id , first_name ,film_id from sakila.actor join sakila.film_actor 
on actor.actor_id=film_actor.actor_id;

select * from common_view;




CREATE TABLE t1 (a INT);
CREATE VIEW v1 AS SELECT * FROM t1 WHERE a < 2
WITH CHECK OPTION;
CREATE VIEW v2 AS SELECT * FROM v1 WHERE a > 0
WITH LOCAL CHECK OPTION;
INSERT INTO v2 VALUES (2);

CREATE VIEW v3 AS SELECT * FROM v1 WHERE a > 0
WITH CASCADED CHECK OPTION;

INSERT INTO v3 VALUES (2);

