use sakila;

select * from payment;

select sum(amount) from payment;

select count(amount) from payment;

select avg(amount) from payment;

select * from payment;

select amount from payment;

select distinct(amount) from payment;

select count(distinct(amount)) from payment;

select * from payment;

select count(amount) from payment
where amount=0.99;

select count(amount) from payment
where amount=2.99;


#group by--collecting similar values

select amount from payment
group by amount;

select amount,count(amount) from payment
group by amount;

select amount,count(payment_id) from payment
group by amount;

select amount,count(payment_id),sum(amount) from payment
group by amount;


select payment_date,month(payment_date) from payment;

select month(payment_date) from payment
group by month(payment_date) ;

select month(payment_date),sum(amount) from payment
group by month(payment_date) ;

select customer_id,sum(amount),avg(amount) from payment
group by customer_id;

select staff_id ,max(amount),min(amount) from payment
group by staff_id;

select payment_id,staff_id from payment
group by staff_id; 


select customer_id,sum(amount),avg(amount) from payment
 group by customer_id;

select customer_id,sum(amount),avg(amount) from payment
group by customer_id
having  sum(amount)>5000;
 
