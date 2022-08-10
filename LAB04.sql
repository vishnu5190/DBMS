/*30/06/2022*/

create database studentFaculty;
use studentFaculty;

create table student (
  snum int primary key,
  sname varchar(50), 
  major varchar(50),
  levels varchar(50),
  age int);

create table class (
  name varchar(50), 
  meets_at time,
  room varchar(50),
  fid int);

alter table class 
add primary key(fid);

create table enrolled (
  snum int,
  cname varchar(50),
  primary key(snum, cname),
  foreign key (snum) references student(snum) on delete cascade);

create table faculty(
  fid int, 
  fname varchar(50), 
  deptid int,
  primary key(fid),
  foreign key (fid) references class(fid));
  

