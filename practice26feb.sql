show databases;

use kk;

create table tinyblob_test(
column_1 tinyblob
);

insert into tinyblob_test(column_1) values('kartikey');

select * from tinyblob_test;

create table blob_test(
column_1 blob
);

insert into blob_test(column_1) values('kartikey');

select * from blob_test;

create table mediumblob_test(
column_1 blob
);


insert into mediumblob_test(column_1) values('kartikey');

select * from mediumblob_test; 


create table longblob_test(
column_1 blob
);

insert into longblob_test(column_1) values('kartikey');

select * from longblob_test; 

create table image1(
id int,
img longblob);

insert into image1(id,img) values(1,load_file("E:\\kartikey\\kartikey phone\\photo camera\\k.jpg"));

select * from image1;