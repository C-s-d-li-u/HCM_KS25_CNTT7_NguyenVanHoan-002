create database hackathon;
use hackathon;

create table category (
category_id varchar(10) primary key,
category_name varchar(100) unique,
description text 
);

create table product (
product_id varchar(10) primary key,
product_name varchar(150),
price decimal(10,2),
status varchar(50),
category_id varchar(10),
foreign key(category_id) references category(category_id)
);


create table orders(
order_id int primary key auto_increment ,
order_date datetime,
total_amount decimal(10,2),
customer_name varchar(100)
); 

create table order_detail(
detail_id int primary key auto_increment,
order_id int ,
product_id varchar(10),
quantity int,
subtotal decimal(12,2),
foreign key(order_id) references orders(order_id),
foreign key (product_id) references product(product_id)
); 

insert into category(category_id,category_name , description )
values
('c01' ,'coffee', 'all types of coffee beans ands brews'),
('c02','tea & fruit','fresh fruit juices and tea ' ),
('c03','bakery', 'cakes and pastries');

insert into products (product_id ,product_name, price , status,category_id )
values
('p001','espresso','35000','available','c01'),
('p002','matcha latte','35000','available','c02'),
('p003','tiramisu','55000','available','c03'),
('p004','cold brew','55000','out of stock','c01'),
('p005','croissant','30000','available','c03');

insert into orders ( order_date,total_amount,costomer_name )
values
('2025-01-01 08:30:00','80000','mr.an'),
('2025-01-01 09:15:00','45000','ms.hoa'),
('2025-01-02 14:00:00','14000','mr.binh'),
('2025-01-03 10:00:00','35000','anonymous'),
('2025-01-03 11:20:00','90000','ms.lan');

insert into order_detail(detail_id,order_id,product_id,quantity,subtotal)
values
('1','1','p001','1','35000'),
('2','2','p002','1','50000'),
('3','3','p003','3','135000'),
('4','4','p004','2','70000'),
('5','5','p005','2','110000');
-- Phần 2

-- Câu 3
update product 
set status = 'available'
where  product_id = 'p004';
-- Câu 4
update product 
set price = price * 1.1
where category_id = 'c03';
-- Câu 5
delete from order_detail
where detail_id between 0 and 50000;
-- Câu 6
select product_id ,product_name,price from product
where price > '40000' and status = 'available' ;
-- Câu 7 
select order_id , order_date , customer_name from orders
where customer_name  like 'M%';
-- Câu 8
select product_name , price from product
order by price desc ;
-- Câu 9
select order_date,total_amount,customer_name from orders
where order_date >= '2025-01-01 08:30:00'
limit 3;
-- Câu 10
select * from product
limit 3 offset 2 ;
 -- Phần 3
 
 -- Câu 11
select p.product_name, p.price,c.category_name 
from product p 
inner join category c 
on p.category_id = c.category_id;

-- Câu 12



