/*creating a database called 'Insurance' which contains 'person', 'car', 'accident', 'owner', 'participated' tables.*/
create database Insurance;

/*shows the database*/
show databases;

/*selects the database for creating table*/
use Insurance;

/*creates a table 'person' with driver_id as primary key*/
create table person (driver_id char(10) primary key, name varchar(20), address varchar(50));

/*displays the metadata of the table person
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| driver_id | char(10)    | NO   | PRI | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| address   | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
*/
desc person;

/*inserts rows in the table*/
insert into person values ('di001', 'abc', 'abc');
insert into person values ('di002', 'acc', 'acc');
insert into person values ('di003', 'adc', 'adc');
insert into person values ('di004', 'aec', 'aec');
insert into person values ('di005', 'afc', 'afc');

/*displays the contents of the table 'person'
+-----------+------+---------+
| driver_id | name | address |
+-----------+------+---------+
| di001     | abc  | abc     |
| di002     | acc  | acc     |
| di003     | adc  | adc     |
| di004     | aec  | aec     |
| di005     | afc  | afc     |
+-----------+------+---------+
*/
select * from person;

/*creates a table'car' with 'regno' as primary key*/
create table car (regno char(10) primary key, model varchar(20), year int);

/*displays the metadata of the table 'car'
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| regno | char(10)    | NO   | PRI | NULL    |       |
| model | varchar(20) | YES  |     | NULL    |       |
| year  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
*/
desc car;
insert into car values ('cn001', 'a', 2020);
insert into car values ('cn002', 'b', 2020);
insert into car values ('cn003', 'c', 2020);
insert into car values ('cn004', 'd', 2021);
insert into car values ('cn005', 'e', 2021);

/*displays the contents of the table 'car'
+-------+-------+------+
| regno | model | year |
+-------+-------+------+
| cn001 | a     | 2020 |
| cn002 | b     | 2020 |
| cn003 | c     | 2020 |
| cn004 | d     | 2021 |
| cn005 | e     | 2021 |
+-------+-------+------+
*/
select * from car;

/*creates a table 'accident' with 'report_no' as primary key*/
create table accident (report_no int primary key, date date, location varchar(50));

/*displays the metadata of the table 'accident'
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| report_no | int         | NO   | PRI | NULL    |       |
| date      | date        | YES  |     | NULL    |       |
| location  | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
*/
desc accident;
insert into accident values (00101, '2020-06-02', 'pqr');
insert into accident values (00102, '2020-06-02', 'pqr1');
insert into accident values (00103, '2020-06-02', 'pqr2');
insert into accident values (00104, '2020-06-03', 'pqr3');
insert into accident values (00112, '2020-06-03', 'pqr4');

/*displays the contents of the table accident
+-----------+------------+----------+
| report_no | date       | location |
+-----------+------------+----------+
|       101 | 2020-06-02 | pqr      |
|       102 | 2020-06-02 | pqr1     |
|       103 | 2020-06-02 | pqr2     |
|       104 | 2020-06-03 | pqr3     |
|       112 | 2020-06-03 | pqr4     |
+-----------+------------+----------+
*/ 
select * from accident;

/*creates a table called 'owns' with 'driver_no' as primary key, and 'driver_no' from table 'person' & 'regno' from table 'car' as Foreign Keys*/
create table owns (driver_id char(10) primary key, regno char(10),
foreign key(driver_id) references person(driver_id) on delete cascade,        /*foreign key for 'driver_no' column from 'person' table*/
foreign key (regno) references car(regno) on delete cascade);                 /*foreign key for 'regno' cloumn from 'car' table*/

/*displays the metadata of the table 'owner'
+-----------+----------+------+-----+---------+-------+
| Field     | Type     | Null | Key | Default | Extra |
+-----------+----------+------+-----+---------+-------+
| driver_id | char(10) | NO   | PRI | NULL    |       |
| regno     | char(10) | YES  | MUL | NULL    |       |
+-----------+----------+------+-----+---------+-------+
*/
desc owns;
insert into owns values ('di001', 'cn001');
insert into owns values ('di002', 'cn002');
insert into owns values ('di003', 'cn003');
insert into owns values ('di004', 'cn004');
insert into owns values ('di005', 'cn005');

/*displays the contents of the table 'car'
+-----------+-------+
| driver_id | regno |
+-----------+-------+
| di001     | cn001 |
| di002     | cn002 |
| di003     | cn003 |
| di004     | cn004 |
| di005     | cn005 |
+-----------+-------+
*/
select * from owns;

/*creates a table 'participated' with 'driver_id', 'regno', 'report_no' as Foreign keys*/
create table participated (driver_id char(10) , regno char(10), report_no int, damage_amount int,
foreign key(driver_id) references person(driver_id) on delete cascade,        /*foreign key for 'driver_no' column from 'person' table*/
foreign key (regno) references car(regno) on delete cascade,                  /*foreign key for 'regno' column from 'car' table*/
foreign key (report_no) references accident(report_no) on delete cascade);    /*foreign key for 'report_no' column from 'accident' table*/

/*displays the metadata of the table 'participated'
+---------------+----------+------+-----+---------+-------+
| Field         | Type     | Null | Key | Default | Extra |
+---------------+----------+------+-----+---------+-------+
| driver_id     | char(10) | YES  |     | NULL    |       |
| regno         | char(10) | YES  |     | NULL    |       |
| report_no     | int      | YES  |     | NULL    |       |
| damage_amount | int      | YES  |     | NULL    |       |
+---------------+----------+------+-----+---------+-------+
*/
desc participated;
insert into participated values ('di001', 'cn001', 00101, 1000);
insert into participated values ('di002', 'cn002', 00102, 5000);
insert into participated values ('di003', 'cn003', 00103, 6000);
insert into participated values ('di004', 'cn004', 00104, 4000);
insert into participated values ('di005', 'cn005', 00112, 8000);

/*displays the contents of the table 'participated'.
+-----------+-------+-----------+---------------+
| driver_id | regno | report_no | damage_amount |
+-----------+-------+-----------+---------------+
| di001     | cn001 |       101 |          1000 |
| di002     | cn002 |       102 |          5000 |
| di003     | cn003 |       103 |          6000 |
| di004     | cn004 |       104 |          4000 |
| di005     | cn005 |       112 |          8000 |
+-----------+-------+-----------+---------------+
*/
select * from participated;

/*update the damage amount for the car with a specific Regno in the accident with report number 12 to 25000.*/
update participated
set damage_amount = 25000
where report_no = 00112;

/*add a new accident to the database.*/
select * from participated;
select * from accident;

insert into accident values ('00113', '2020-06-05', 'pqr5');
select * from accident;

/*find the total number of people who owned cars that involved in accidents in 2008.*/
select count(*) 
from owns
where regno IN
  (select regno
   from participated
   where report_no IN
    (select report_no 
     from accident
     where date > '2008-01-01' and date < '2008-12-31'));
/*
+----------+
| count(*) |
+----------+
|        0 |
+----------+
*/
     
/*find the number of accidents in which cars belonging to a specific model were involved.*/
/*ERROR*/
select count(report_no) 
from accident
where regno IN
  (select regno 
   from participated
   where model IN 
    (select model 
     from car
     where model = 'b'));



