/*23/06/2022*/

create database swatiSuppliers;
use swatiSuppliers;

create table suppliers( sid int primary key, sname varchar(20), address varchar(50));

insert into suppliers values(10001, 'supplier1', 'address1');
insert into suppliers values(10002, 'supplier2', 'address2');
insert into suppliers values(10003, 'supplier3', 'address3');
insert into suppliers values(10004, 'supplier4', 'address4');
insert into suppliers values(10005, 'supplier5', 'address5');
select * from suppliers;

create table parts(pid int primary key, pname varchar(20), color varchar(20));

insert into parts values(20001, 'part1', 'blue');
insert into parts values(20002, 'part2', 'magenta');
insert into parts values(20003, 'part3', 'yellow');
insert into parts values(20004, 'part4', 'green');
insert into parts values(20005, 'part4', 'red');
select * from parts;

create table catalog(sid int, pid int, cost int,
primary key(sid, pid),
foreign key(sid) references suppliers(sid) on delete cascade,
foreign key(pid) references parts(pid) on delete cascade);

insert into catalog values(10001, 20001, 40000);
insert into catalog values(10002, 20002, 9700);
insert into catalog values(10003, 20003, 54777);
insert into catalog values(10004, 20004, 2000);
insert into catalog values(10005, 20005, 67999);
select * from catalog;

/*pnames of parts for which there is some supplier.*/
select pname 
from parts 
where pid IN 
  (select pid
  from catalog
  where exists
    (select * 
    from suppliers));

/*snames of suppliers who supply every part.*/

/*snames of suppliers who supply every red part.*/

/*pnames of parts supplied by Acme Widget Suppliers and by no one else.*/

/*sids of suppliers who charge more for some part than the average cost of that part (averaged over
all the suppliers who supply that part).*/

/*For each part, find the sname of the supplier who charges the most for that part.*/

/*sids of suppliers who supply only red parts.*/



