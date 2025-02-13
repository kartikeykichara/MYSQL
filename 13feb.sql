show databases;

use sakila;

show tables;

desc actor;

select * from actor;

select actor_id, first_name,ACTOR_ID from actor;

select first_name,actor_id from actor;

select first_name ,actor_id,ACTOR_id*100 from actor;

select * from actor;

select * from actor
  where actor_id=2;
  
#operators -->,<,>=,<=,=,!=,<>

select * from actor
where actor_id<>2;

#operator ==> between ,in, and like operator
#between => range of values

select * from actor
	where actor_id between 1 and 5;
    
select * from actor
	where actor_id in(2,5,500);
    
select actor_id,first_name from actor
	where first_name in('Nick','ed');
    
#like opeartor==>pattern dhundhna

#wildcard character==> % => zero or more character

#_==> only one character

select * from actor
	where first_name='E';
    
select * from actor
	where first_name like 'E%';
    
select * from actor
	where first_name like '%E';
    
select * from actor
	where first_name like '%Y';
    
select * from actor
	where first_name like 'S%Y';
    
select * from actor
	where first_name like '%A';
    
select * from actor
	where first_name like '%A%';
    
select * from actor
	where first_name like '%SA%';
    
select * from actor
	where first_name like 'E%';
    
select * from actor
	where first_name like 'E_';
    
select * from actor
	where first_name like '_A';
    
select * from actor
	where first_name like '_A%';
    
select * from actor
	where first_name like '____';
    
select * from  actor
	where first_name like '%EE%';
    
select * from  actor
	where first_name like '%EE%';
    
select * from  actor
	where first_name like '%_e_%';
    
select * from  actor
	where first_name like '%EE%';
    
select * from  actor
	where first_name like '%_R___';
    
select * from  actor
	where first_name like '_H%z_';
    
select * from  actor
	where first_name like '%I__';