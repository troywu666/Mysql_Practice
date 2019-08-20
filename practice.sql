create database if not exists dalba;
drop database if exists dalba;
show databases;
show tables;
show variables like 'char%';
show databases;
use dalba;
CREATE DATABASE IF NOT EXISTS dalba;
DROP DATABASE IF EXISTS dalba;
use dalba;
show tables;
create table products(
	primary key (product_id),
	product_id int(11) not null auto_increment,
	product_name varchar(100) default null,
	image_url varchar(255) default null,
    sales_status enum('new','deprecated') default 'new',
    price decimal(9,2) default null,
    create_date datetime
	-- modified_date datetime
); 
show tables;
insert into products
values
(1,'香辣鸡腿堡人气餐A',
'http://img.mp.itc.cn/upload/20170424/4349e424649342c3b7227b5cde643902_th.jpeg',
'NEW',36,'2014-11-20 08:20:00'),
(2,'海苔岩烧大鸡腿饭套餐A2','','NEW',37,'2014-12-20 08:20:00'),
(3,'夏日缤纷桶','','NEW',88,'2016-11-20 10:20:00'),
(4,'新奥尔良烤鸡腿堡人气餐B','','NEW',36,'2016-11-20 10:20:00'),
(5,'过气套餐','','DEPRECATED',999,'2018-11-20 10:20:00');
show tables;
insert into products(product_name, price, create_date)
values
('超级塔可午餐套餐',27, now());
select * from products;
select count(price), count(product_id), count(image_url) from products;

drop table if exists products;
show tables;

use dalba;
create table orders(
	primary key (order_id),
    order_id int(11) not null auto_increment,
    order_no varchar(100) default null,
    user_name varchar(100) not null,
    product_name varchar(100) not null,
    order_status enum('CART','DRAFT','NEW','IN_PROCESS','COMPLETED','FAILED') DEFAULT 'CART',
	create_date datetime not null default current_timestamp comment '注册时间'
);
alter table orders add column unit_price decimal(9,2) null default 0.0 after product_name; 
select * from orders;
alter table orders add column quantity int not null default 0 after order_id;
select * from orders;
describe orders;

insert into orders(
order_no,
user_name,
product_name,
unit_price,
quantity)
values
('KFC123','joshua','香辣鸡腿堡人气餐A',36,1),
('KFC321','joshua','海苔岩烧大鸡腿饭套餐A2',37,2),
('KFC234','jane','夏日缤纷桶',88,1);

select * from orders;

drop table if exists products;
create table products(
primary key (product_id),
product_id int(11) not null auto_increment,
product_name varchar(100) default null,
image_url varchar(255) default null,
sales_status enum('NEW','DEPRECATED') default 'new',
price decimal(9,2) default null,
create_date datetime);

describe products;

alter table products add column description varchar(255) not null after product_name;
select * from products;
alter table products add column title varchar(100) not null first;
select * from products;
alter table products add column test varchar(100) not null;
select * from products;
alter table products change column description `desc` varchar(200) not null;
select * from products;
alter table products change column `desc` `desc` varchar(100) not null;
select * from products;
alter table products change column `desc` `desc` varchar(200) not null;
select * from products;
alter table products drop column test;
alter table products drop column title;
alter table products drop column `desc`;
select * from products;
insert into products
values
(1,'香辣鸡腿堡人气餐A',
'http://img.mp.itc.cn/upload/20170424/4349e424649342c3b7227b5cde643902_th.jpeg',
'NEW',36,'2014-11-20 08:20:00'),
(2,'海苔岩烧大鸡腿饭套餐A2','','NEW',37,'2014-12-20 08:20:00'),
(3,'夏日缤纷桶','','NEW',88,'2016-11-20 10:20:00'),
(4,'新奥尔良烤鸡腿堡人气餐B','','NEW',36,'2016-11-20 10:20:00');
select * from products;
update products
set product_id = 10
where product_id = 1;
select * from products;
delete from products where product_id = 10;
select * from products;
insert into products(product_name, price, create_date)
values('超级塔可午餐套餐',27, now());
select product_name as name from products;
select distinct product_name from products;
select product_id, product_name, price from products limit 3;
create table product_info as (select product_id, product_name, price from products);
show tables;
select * from product_info;
create table product_info2 as (select product_id, product_name, price, now() as report_time from products);
select * from product_info2;
SELECT DISTINCT
    sales_status
FROM
    products;
SELECT 
    COUNT(DISTINCT sales_status)
FROM
    products;
select price, product_id from products;
select price, product_id from products limit 0, 4;
select price from products order by price desc;
select * from products order by price, create_date desc;
select * from products;
select * from products where product_name like "%超级%";
select * from products where product_name like "_____鸡腿堡%";
select price, price + 10 as adjusted_price from products;
select image_url, if (image_url is null, 'missing', image_url) from products;
select * from products where product_name <> 'chjk';
select product_name, price from products where price between 30 and 40;
select product_name, price from products where price in (37, 30);
drop table products;
insert into products(product_name, price, create_date)
values('超级塔可午餐套餐',27, now());
SELECT 
    *,
    CASE
    when image_url is null then 'missing'
        WHEN image_url = '' THEN 'miss'
        ELSE image_url
    END AS url
FROM
    products;
describe products;
use dalba;
select group_concat(distinct price order by price asc separator '<<<') from products group by sales_status, price;
use dalba;
show tables;
select count(employee_id) from employees;

use hr;
show tables; 
select concat(e.first_name, " ", e.last_name) as full_name, e.department_id, d.department_name 
from employees as e inner join departments as d on d.department_id = e.department_id;
select concat(e.first_name ," ", e.last_name) as full_name, d.department_name, l.city, c.country_name
from employees as e 
left join departments as d on e.department_id = d.department_id
left join locations as l on l.location_id = d.location_id
left join countries as c on l.country_id = c.country_id;
select * from employees as e where e.first_name like "Kim%";
select concat(e.first_name, " ", e.last_name) as full_name, j.job_title, j.max_salary
from employees as e 
join jobs as j on e.job_id = j.job_id;
use employees;
select
(case 
when e.salary between 1000 and 2999 then "#A"
when e.salary between 3000 and 5999 then "#B"
WHEN e.salary BETWEEN 6000 AND 9999 THEN '#C'
WHEN e.salary BETWEEN 10000 AND 14999 THEN '#D'
WHEN e.salary BETWEEN 15000 AND 24999 THEN '#E'
WHEN e.salary BETWEEN 25000 AND 40000 THEN '#F'
else "#G"
end)
as job_grades
from employees as e order by job_grades desc;
select distinct (case salary
when 1000 then "1000"
else "G"
end)
as jobgrades from employees order by jobgrades;
select e.first_name, e.last_name, e.department_id, d.department_name 
from employees as e inner join departments as d on e.department_id = d.department_id where d.department_id in (40, 80) order by last_name;
select e.first_name, d.department_name, l.state_province, l.city
from employees as e 
left join departments as d on e.department_id = d.department_id 
left join locations as l on d.location_id = l.location_id
where e.first_name like "%z%";
select concat(e.first_name, " ", e.last_name) as full_name, d.department_name, d.department_id 
from employees as e right join departments as d using (department_id) order by full_name desc;
select first_name, last_name,salary from employees where salary <(select salary from employees where employee_id = 182);
select e1.last_name as employee_name, e2.last_name as manager_name from employees as e1 left join employees as e2 on e2.manager_id = e1.employee_id;