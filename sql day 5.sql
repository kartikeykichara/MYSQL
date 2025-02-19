use sakila;

select * from payment;

select sum(amount) ,count(amount)
from payment where amount=2.29;

select amount,sum(amount) from payment
group by amount;

#subquery   

# query withim a query

#  1phone

select * from payment;
select amount from payment
where payment_id=2;


select * from payment where amount=9.99;

select * from payment
 where amount=(select amount from payment where payment_id=5);
 
 select * from payment
 where amount=(select amount from payment where payment_id=3);




select amount,sum(amount) from payment
where amount!=0.99
group by amount 
having sum(amount)>8000;

select amount,sum(amount) from payment
where amount!=0.99
group by amount 
having sum(amount)>8000;

select amount,sum(amount) from payment
group by amount 
having amount!=0.99;

#group by having

# order by
#alias 

select amount, amount*10 from payment;

select amount, amount*10  as new from payment;

select amount, amount*10 as `select` from payment;

select * from payment;

select * from payment 
order by amount;

select * from payment 
order by amount desc,rental_id;

select * from payment 
order by amount desc,rental_id desc;

#order by and alias

# subquery 
#case statement
#condition?True,False

select amount,
if(amount=0.99,'correct','incorrect')
from payment;

select amount,
if(amount=0.99,'correct',
   if( amount=2.99,'yes','incorrect'))
from payment;

-- '''
-- select  col,
-- 	case
-- 		when condtio  then statement
--         when condition then statement 
-- 	end
--     '''

select * from payment;
select amount,
case 
	when amount =0.99 then 'value is 0.99'
    when amount=2.99 then 'yes'
    else amount
end as conditon
from payment;

select amount,
case 
	when amount =3.99 then 'value is 3.99'
    when amount=2.99 then 'yes'
    else amount
end as conditon
from payment;


select amount,count(amount) ,
case
	when count(amount)>1000 then 'amount is '
    else 'count is less than 1000'
end
 from payment
 group by amount;

select amount ,
case 
	when amount>1 then 'amount is amount greater than 1'
    when amount>3 then 'amount is greater than 3 '
    when amount>7 then 'amount is grater than 7'
    else 'amount less than 1'
end 
from payment;
