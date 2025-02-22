use sakila;

select * from actor;

select first_name from actor
where actor_id=2;

select * from actor where first_name='NICK';


select * from actor where first_name='ED';

select * from actor where
first_name=(select first_name from actor
where actor_id=2);

select * from payment;

select * from payment where rental_id=1185;

select * from payment where
amount>(select amount from payment where rental_id=1185);

select * from payment 
where month(payment_date)=(select month(payment_date) from payment 
where payment_id=3);


select amount,count(amount) from payment
group by amount
having count(amount)>(select 
count(amount) from payment where amount=0.99);


select sum(amount) from payment 
where customer_id=9;

select customer_id,sum(amount) from payment 
group by customer_id
having sum(amount)>(select sum(amount) from payment 
where customer_id=9);

#multirow subquery

select amount from payment
where payment_id in (1,3);


select * from payment
where amount=(select amount from payment 
where payment_id in (1,3));

select * from payment
where amount in (select amount from payment 
where payment_id in (1,3));


# 2.99 and 5.99
select * from payment
where amount =any (select amount from payment 
where payment_id in (1,3));

select * from payment
where amount >any (select amount from payment 
where payment_id in (1,3));

select * from payment
where amount <any (select amount from payment 
where payment_id in (1,3));

select * from payment
where amount >all (select amount from payment 
where payment_id in (1,3));

select * from payment
where amount <all (select amount from payment 
where payment_id in (1,3));