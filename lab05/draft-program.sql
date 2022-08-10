create database swatiAirline;
use swatiAirline;

create table flights (
flno int primary key,
origin varchar(50),
destination varchar(50),
distance int,
departs time,
arrives time,
price int);

create table aircraft (
aid int primary key,
aname varchar(50),
cruising_range int);

create table employee (
eid int primary key,
ename varchar(50),
salary int);

create table certified (
eid int,
aid int,
primary key(eid, aid),
foreign key (aid) references aircraft(aid) on delete cascade,
foreign key (eid) references employee(eid) on delete cascade);

create table emp_flight(
flno int,
eid int,
aid int,
primary key(flno, eid, aid),
foreign key (flno) references flights(flno) on delete cascade,
foreign key (eid) references employee(eid) on delete cascade,
foreign key (aid) references aircraft(aid) on delete cascade);

drop table emp_flight;

insert into emp_flight values(1001, 701, 101);
insert into emp_flight values(1002, 702, 102);
insert into emp_flight values(1003, 703, 103);
insert into emp_flight values(1004, 704, 104);
insert into emp_flight values(1005, 705, 105);
insert into emp_flight values(1006, 706, 106);
insert into emp_flight values(1007, 707, 107);

drop table certified;

insert into aircraft values(109, '747', 3000);
insert into aircraft values(102, 'Boeing', 900);
insert into aircraft values(103, '647', 800);
insert into aircraft values(104, 'Dreamline', 4000);
insert into aircraft values(105, 'Boeing', 3000);
insert into aircraft values(106, '707', 307);
insert into aircraft values(107, 'Dream', 308);
select * from aircraft;

insert into employee values(701, 'a', 40000);
insert into employee values(702, 'b', 50000);
insert into employee values(703, 'c', 30000);
insert into employee values(704, 'd', 90000);
insert into employee values(705, 'e', 20000);
insert into employee values(706, 'f', 70000);
insert into employee values(707, 'g', 80000);
insert into employee values(708, 'h', 80000);
insert into employee values(709, 'h', 800);

insert into certified values(701, 101);
insert into certified values(702, 102);
insert into certified values(703, 103);
insert into certified values(704, 104);
insert into certified values(705, 104);
insert into certified values(706, 106);
insert into certified values(707, 107);
insert into certified values(708, 107);
insert into certified values(707, 106);
insert into certified values(709, 105);


insert into flights values(1001, 'bangalore', 'delhi', 2500, timestamp '2005-05-13 07:15:00', timestamp '2005-05-13 17:15:00', 5000);
insert into flights values(1002, 'city1', 'city2', 2500, timestamp '2005-05-13 07:15:00', timestamp '2005-05-13 12:15:00', 800);
insert into flights values(1003, 'city2', 'city4', 2500, timestamp '2005-05-13 08:15:00', timestamp '2005-05-13 15:15:00', 870);
insert into flights values(1004, 'city3', 'city6', 2500, timestamp '2005-05-13 06:15:00', timestamp '2005-05-13 13:15:00', 500);
insert into flights values(1005, 'city4', 'city6', 2500, timestamp '2005-05-13 08:15:00', timestamp '2005-05-13 11:15:00', 4000);
insert into flights values(1006, 'city5', 'city1', 2500, timestamp '2005-05-13 10:15:00', timestamp '2005-05-13 16:15:00', 6000);
insert into flights values(1007, 'city6', 'city2', 2500, timestamp '2005-05-13 11:15:00', timestamp '2005-05-13 17:15:00', 2000);
insert into flights values(1008, 'city1', 'city6', 2500, timestamp '2005-05-13 08:15:00', timestamp '2005-05-13 15:15:00', 8700);
insert into flights values(1009, 'city1', 'city4', 2500, timestamp '2005-05-13 08:15:00', timestamp '2005-05-13 15:15:00', 8750);

SELECT DISTINCT a.aname
FROM aircraft a, certified c, employee e
WHERE c.eid=e.eid and e.salary in  (
SELECT e1.salary
    FROM employee e1, employee e
WHERE e1.salary > 75000);
   
   
select aname
from aircraft
where aid IN (
select c.aid
from certified c, employee e
where e.eid= c.eid and e.salary > 75000
group by c.aid
);


select c.eid, MAX(cruising_range)
FROM aircraft a, certified c, employee e
where c.eid= e.eid and ename =(
 select ename
 from employee
 where eid in (
   select eid
   from certified
   group by eid
   having count(eid)> 2));
   
   
select distinct a.aname
from aircraft a, certified c, employee e
where a.aid = c.aid and e.eid = c.eid and e.salary in (
select e1.salary
    from employee e1
    where e1.eid = c.eid and e1.salary > 50000);

select * from aircraft;    
 
   
select aname
from  aircraft
where aid =(
select aid
from certified
where eid = (
select eid
from employee
where salary <
( select min(price)
  from flights
  where origin='bangalore' and destination='delhi' )));

select a.aname, avg(salary)
from aircraft a, certified c, employee e
where a.aid = c.aid and e.eid = c.eid and c.aid in
( select aid
from aircraft
where cruising_range> 3500);


select e.ename
from aircraft a, certified c, employee e
where a.aid = c.aid and e.eid = c.eid and a.aname = 'Boeing' ;

create view flight1
as
select origin, destination
from flights
where origin = 'city1' and arrives< '2005-05-13 18:00:00';

create view flight2
as
select origin, destination
from flights
where destination = 'city2' and arrives< '2005-05-13 18:00:00';

select * from flight1;
select * from flight2;

select origin, destination
from flight1 f1, flight2 f2
where f1.destination = f2.origin  ;
