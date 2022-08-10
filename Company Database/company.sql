create database company;
use company;

create table employee (
  emp_id INT PRIMARY KEY,
  first_name varchar(40), 
  last_name varchar(40),
  birth_day DATE,
  sex varchar(1),
  salary INT,
  super_id int,
  branch_id int);

create table branch (
  branch_id int primary key,
  branch_name varchar(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) references employee(emp_id) on delete set null);
  


