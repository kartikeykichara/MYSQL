show databases;
use ajay;
show tables;
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    publication_year INT NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_name VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Books (book_id, title, author, genre, price, publication_year) VALUES
(1, 'The Silent Patient', 'Alex Michaelides', 'Thriller', 15.99, 2019),
(2, 'Where the Crawdads Sing', 'Delia Owens', 'Mystery', 18.99, 2018),
(3, 'Atomic Habits', 'James Clear', 'Self-help', 21.50, 2018),
(4, 'The Midnight Library', 'Matt Haig', 'Fiction', 17.25, 2020),
(5, 'Educated', 'Tara Westover', 'Memoir', 14.75, 2018),
(6, 'Becoming', 'Michelle Obama', 'Biography', 22.99, 2018),
(7, 'The Alchemist', 'Paulo Coelho', 'Fiction', 12.99, 1988);


INSERT INTO Orders (order_id, book_id, customer_name, order_date, quantity, total_price) VALUES
(101, 1, 'John Doe', '2023-01-15', 2, 31.98),
(102, 2, 'Jane Smith', '2023-02-10', 1, 18.99),
(103, 3, 'Alice Johnson', '2023-03-05', 3, 64.50),
(104, 4, 'David Brown', '2023-04-12', 1, 17.25),
(105, 1, 'Sophia Wilson', '2023-05-25', 4, 63.96),
(106, 6, 'Michael Lee', '2023-06-08', 2, 45.98),
(107, 3, 'Emma Davis', '2023-07-19', 1, 21.50),
(108, 5, 'Olivia Taylor', '2023-08-01', 2, 29.50),
(109, 7, 'Daniel Martinez', '2023-09-05', 3, 38.97),
(110, 2, 'Lucas White', '2023-10-20', 2, 37.98);


select * from orders;
select * from books;

select customer_name from orders
where total_price=(select max(total_price) from orders);

select title,publication_year from books 
order by publication_year
limit 1;


INSERT INTO Books (book_id, title, author, genre, price, publication_year) VALUES
(9 ,'killer ', 'Alex Michaelides', 'Comedy', 18.99, 2020);

select * from books 
where price in (select price from books group by price having 
count(*)>1);

select customer_name from orders
where book_id=(select book_id from orders where 
customer_name='John Doe');

INSERT INTO Orders (order_id, book_id, customer_name, 
order_date, quantity, total_price) VALUES
(111, 2, 'John Doe', '2023-01-15', 2, 50.25);

select * from orders;

INSERT INTO Orders (order_id, book_id, customer_name, 
order_date, quantity, total_price) VALUES
(112, 2, 'Jane smith', '2023-02-10', 2, 51.25);

select * from orders
where order_date in (select distinct(order_date) from 
orders);

select *
from orders where book_id in(
select book_id,count(distinct(order_date)) from orders
group by book_id
having count(distinct order_date)>1);

select title from books
where price =(select max(price) from books
where price<(select max(price) from books));


select * from books 
where book_id =(select book_id from orders
group by book_id
order by sum(quantity)
limit 1);

select * from orders;

-- select book_(select book_id from orders
-- group by book_id
-- having count(customer_name)>1;)

select *
from orders where book_id in(
select book_id,count(distinct(customer_name)) from orders
group by book_id
having count(distinct customer_name)>1);