create database swatiBankEnterprise;
use swatiBankEnterprise;

create table branch (branch_name varchar(50), branch_city varchar(50), assets int);
alter table branch 
add primary key(branch_name);

insert into branch values ('Koramagala', 'Bangalore', 54956);
insert into branch values ('Basavangudi', 'Bangalore', 12345);
insert into branch values ('Jaynagar', 'Gulbarga', 777890);
insert into branch values ('OldRTO', 'Gulbarga', 234511);
insert into branch values ('ShahabadCross', 'Gulbarga', 98374);
insert into branch values ('ShivajiUdyam', 'Kolhapur', 8579);
insert into branch values ('Ichalkaranji', 'Kolhapur', 223456);

select * from branch;

create table accounts (accno int, 
branch_name varchar(50), 
balance int,
primary key(accno));
alter table accounts 
add foreign key (branch_name) references branch(branch_name) on delete cascade;

insert into accounts values (123001, 'Koramagala', 120056);
insert into accounts values (123002, 'Koramagala', 12670);
insert into accounts values (123003, 'Koramagala', 265356);
insert into accounts values (123004, 'OldRTO', 120056);
insert into accounts values (123005, 'OldRTO', 456976);
insert into accounts values (123006, 'Basavangudi', 223445);
insert into accounts values (123007, 'Ichalkaranji', 89684);
insert into accounts values (123008, 'ShivajiUdyam', 561463);
insert into accounts values (123009, 'Jaynagar', 2903445);
insert into accounts values (123010, 'Basavangudi', 612487);
insert into accounts values (123011, 'ShahabadCross', 7798);

select * from accounts;

create table depositor (accno int, customer_name varchar(50), customer_street varchar(50), customer_city varchar(50));
alter table depositor
add primary key(accno);

insert into depositor values (123001, 'Sourabh', 'ITILayout', 'Bangalore');
insert into depositor values (123002, 'Srikanth', 'BullTempleRoad', 'Bangalore');
insert into depositor values (123003, 'Srikanth', 'MountJoyRoad', 'Bangalore');
insert into depositor values (123004, 'Trupti', 'SedamRoad', 'Gulbarga');
insert into depositor values (123005, 'Sourabh', 'SedamRoad', 'Gulbarga');
insert into depositor values (123006, 'Abhi', 'RVilas', 'Bangalore');
insert into depositor values (123007, 'Harsh', 'StadiumRoad', 'Kolhapur');
insert into depositor values (123008, 'Harsh', 'CMenonRoad', 'Kolhapur');
insert into depositor values (123009, 'Harsh', 'RingRoad', 'Gulbarga');
insert into depositor values (123010, 'Shiv', 'BullTempleRoad', 'Bangalore');
insert into depositor values (123011, 'Kiran', 'OmNagarRoad', 'Gulbarga');

select * from depositor;

create table loan (loan_no int primary key, branch_name varchar(50), amount int,
foreign key(branch_name) references branch(branch_name) on delete cascade);

insert into loan values(22001, 'Koramagala', 12344);
insert into loan values(22002, 'Jaynagar', 12344);
insert into loan values(22003, 'OldRTO', 12344);
insert into loan values(22004, 'OldRTO', 12344);
insert into loan values(22005, 'Ichalkaranji', 12344);
insert into loan values(22006, 'OldRTO', 12344);

select * from loan;

create table borrower (customer_name varchar(50), loan_no int,
primary key(customer_name, loan_no),
foreign key (customer_name) references depositor(customer_name) on delete cascade,
foreign key (loan_no) references loan(loan_no) on delete cascade);

insert into borrower values('Sourabh', 22001);
insert into borrower values('Trupti', 22002);
insert into borrower values('Kiran', 22003);
insert into borrower values('Sourabh', 22004);
insert into borrower values('Harsh', 22005);
insert into borrower values('Harsh', 22006);

select * from borrower;

select *
from depositor d, accounts a, branch b
where b.branch_city='Bangalore'
group by d.customer_name
having count(distinct b.branch_name) = (select count(branch_name) from branch where branch_city='Bangalore');

