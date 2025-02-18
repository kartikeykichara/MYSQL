#functions
#numeric functions
#data functions
use sakila;
#single row category functions
select * from actor;
select first_name,substr(first_name,2) from actor;

#numeric
#round, truncate,mod,pow

select round(12.8) from dual;

select round(12.8),round(12.41,1) from dual;

select round(12.8),round(12.41,2) from dual;

select round(847.41,-1) from dual;

select round(857.41,-2) from dual;

select round(857.41,-3) from dual;

select round(357.41,-3) from dual;

select round(57.41,-3) from dual;

select round(279.46,1) from dual;

select truncate(279.41,1) from dual;

#to display the values after the decimal  
select truncate(279.45,2) from dual;

select truncate(279.45,-1) from dual;

select truncate(279.45,1) from dual;

select mod(20,2) from dual;

select mod(20,2),
21%2 from dual;

select truncate(279.45,1),
mod(21,2),21%2,pow(2,3) from dual;


#date functions

select curdate() from dual;

select curtime() from dual;

select current_timestamp() from dual;

select now() from dual;

select adddate(curdate(),1) from dual;

select curdate(),adddate(curdate(),1) from dual;

select curdate(),adddate(curdate(),interval 1 month) from dual;

select curdate(),adddate(curdate(),interval 1 week) from dual;

select
 datediff(curdate(),adddate(curdate(),interval -1 week) )
from dual;

select now(),last_day(now()) from dual;

select last_day(now()) from dual;

select month(now()),last_day(now()) from dual;

select date_format(now(),'%a') from dual;

select date_format(now(),'%M') from dual;

select date_format(now(),'%a') as current_month from dual;

select date_format(now(),'%M') as current_month from dual;

select curdate() from dual;

select curdate(),
str_to_date('17 2025 02','%d %Y %m') from dual;












