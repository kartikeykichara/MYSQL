use sakila;

#--- in operator 
#--- between 

select * from actor;


#--functions

select * 
from actor where actor_id>2 and 
first_name='JOHNNY';



select * from actor
where first_name='ED' or first_name='NICK'; 

select * from actor
where first_name='ED' or first_name='NICK'
and actor_id>2; 

select * from actor
where (first_name='ED' or first_name='NICK')
and actor_id>2;

select * from actor
where first_name='NICK' or first_name='ED'
and actor_id>2;

#functions

#---block of code==>code reusable

#code redable

#pre-defined function

#string function

select first_name from actor;


select first_name,lower(first_name) from actor;

select first_name,upper(first_name) from actor;

select first_name,lower(first_name),
upper(lower(first_name)) from actor;

select first_name,last_name,
concat(first_name,last_name)
from actor;

select first_name,last_name,
concat(first_name,'-',last_name)
from actor;

select first_name,last_name,
concat(first_name,'-',last_name,'xyz')
from actor;

select first_name,last_name,
concat_ws(':',first_name,last_name)
from actor;

select first_name,last_name,
concat_ws('-',first_name,last_name)
from actor;

select * from actor
where concat(first_name,last_name)='EDCHASE';

#substr

select first_name,
substr(first_name,3) from actor;

select first_name,
substr(first_name,1,3) from actor;

select first_name,
substr(first_name,-3),
substr(first_name,1,3) from actor;

#instr
select first_name,
instr(first_name,'E') from actor;

#locate
select first_name,
locate('E',first_name,3) from actor;


select first_name,
char_length(first_name),
char(first_name),
locate('E',first_name,3) from actor;

#length

#dual table

select  length( '大') , char_length('大') 
from dual;

select amount from payment ;

select first_name,lpad(first_name,3,'$') from actor;

select first_name,
rpad(first_name,3,'$') from actor;

select ' hey ',
trim(' hey ' )from dual;

select ' hey ',
trim(leading 'z' from 'zzzheyzz' )from dual;



select ' hey ',
trim(trailing  'z' from 'zzzheyzz' )from dual;

select ' hey ',
trim(both 'z' from 'zzzheyzz' )from dual;

select first_name ,replace(first_name,'E','X')
from actor;




select ' hey ',
trim(leading 'z' from 'zzzheyzz' )from dual;

select ' hey ',
trim(leading 'z' from 'zzzheyzz' )from dual





