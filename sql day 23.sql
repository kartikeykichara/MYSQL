create user test identified by 'test123';

select user from mysql.user;

select * from mysql.user;

grant all privileges on sakila.* to  test;
#username  @01932.156.56.7.10.1
show grants for test;




revoke all privileges on sakila.* from test;

grant select  on sakila.* to test;

use sakila;

grant select (staff_id,first_name) on sakila.staff to test;



alter user 'test' identified by 'regex';

alter user 'test' account lock;

alter user 'test' account unlock ;




-- creating role

create role sales3;
grant select on sakila.* to sales3;


create user 'isha' identified by 'isha';

show grants for 'isha';


-- grant role to usetr

grant sales3 to isha;

set default role all to isha;
