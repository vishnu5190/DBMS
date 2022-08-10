create database OrderProcess;
use OrderProcess;

drop database OrderProcess;

create table customer (cust_id int primary key, cname varchar(50), city varchar(50));

create table orders (order_id int, odate date, cust_id int, order_amt int,
primary key(order_id, cust_id),
foreign key (cust_id) references customer(cust_id) on delete cascade);

create table item (item_id int primary key, unit_price int);

create table order_item (order_id int, item_id int, qty int,
primary key(order_id, item_id),
foreign key (order_id) references orders(order_id) on delete cascade,
foreign key (item_id) references item(item_id) on delete cascade);

create table warehouse (ware_house int, city varchar(50),
primary key(ware_house));

create table shipment (order_id int, ware_house int, shipdate date,
primary key(order_id, ware_house),
foreign key (order_id) references orders(order_id) on delete cascade,
foreign key (ware_house) references warehouse(ware_house) on delete cascade);

select * from item; 

insert into customer values (1001, 'customer1', 'city1');
insert into customer values (1002, 'customer2', 'city2');
insert into customer values (1003, 'customer3', 'city3');
insert into customer values (1004, 'customer4', 'city4');
insert into customer values (1005, 'customer5', 'city5');
insert into customer values (1006, 'customer6', 'city6');

select * from customer;

insert into orders values (101, '2022-03-12', 1001, 1234); 
insert into orders values (102, '2012-04-22', 1002, 35464); 
insert into orders values (103, '2011-01-02', 1002, 12446); 
insert into orders values (104, '2010-12-03', 1001, 12686); 
insert into orders values (105, '2021-11-23', 1003, 12643); 

select * from customer;

insert into item values (201, 45656);
insert into item values (202, 31156);                                             
insert into item values (203, 58756);
insert into item values (204, 9956);
insert into item values (205, 19956);

select * from customer;

insert into order_item values(101, 201, 2);
insert into order_item values(102, 202, 0);
insert into order_item values(103, 203, 1);
insert into order_item values(104, 204, 3);
insert into order_item values(105, 205, 4);

select * from customer;

insert into warehouse values(1, 'city7');
insert into warehouse values(2, 'city6');
insert into warehouse values(3, 'city5');
insert into warehouse values(4, 'city3');
insert into warehouse values(5, 'city2');
insert into warehouse values(6, 'city7');
insert into warehouse values(7, 'city8');

select * from customer;

insert into shipment values(101, 1, '2022-04-01');
insert into shipment values(102, 3, '2020-03-30');
insert into shipment values(103, 5, '2022-11-21');
insert into shipment values(104, 4, '2022-10-23');
insert into shipment values(105, 7, '2022-09-17');

select * from customer;


