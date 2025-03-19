-- indexes 

-- index==> sequential searching

-- index => a reference of yu

-- primary key , unique key (column ) 
-- identifier
-- select * from where column (unique column)=> val

-- index=> BStree
-- clustured index

-- index()
-- for rows chalani h to good but if you want to write is nt n[-goof


use regex;
drop table users;
create table users (id int primary key,fname varchar(20));

insert into users values (10,"tushar"),(11,"aman"),
(12,"naina"),(13,"raj"),(14,"shubham"),(15,"om"),(16,"tushar");

explain select * from users where id=11;

show indexes from users;


create index user_f on users (fname);
explain select * from users where fname="tushar";

drop index `PRIMARY` on users;
drop index user_f on users;
show indexes from users;



create table kk(id int, fname varchar(20),lname varchar(20));

insert into kk values(1,"rohan","khare"),(2,"ajay","jain"),(3,"rohit","sharma"),
(4,"kartikey","kichara");

select * from kk;

explain select * from kk
where fname="kartikey" and lname="kichara";

create index user_f on kk(fname,lname);

explain select * from kk
where fname="kartikey" and lname="kichara";

explain select * from kk
where lname="kichara";

explain select * from kk
where fname="kartikey";

create table kk1(id int, fname varchar(30),lname varchar(30));

insert into kk1 values(1,"rohan","khare"),(2,"rohan5446","jain"),(3,"rohit","sharma"),
(4,"kartikey","kichara");

create index user_f on kk1(fname(5));


explain select * from kk1
where fname="kartikey";
