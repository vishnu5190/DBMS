create database bookDealer;
use bookDealer;

create table author (author_id int, name varchar(50), city varchar(50), country varchar(50),
      primary key(author_id));
      
create table publisher (publisher_id int, name varchar(50), city varchar(50), country varchar(50),
      primary key(publisher_id));
      
create table category (category_id int, description varchar(50),
      primary key(category_id));
      
create table catalogue (book_id int, title varchar(50), author_id int, publisher_id int, category_id int, year int, price int,
      primary key(book_id),
      foreign key(author_id) references author(author_id),
      foreign key(publisher_id) references publisher(publisher_id),
      foreign key(category_id) references category(category_id) );
      
 create table order_detail (order_id int, book_id int, quantity int,
      primary key(order_id),
      foreign key(book_id) references catalogue(book_id));
      
 insert into author (author_id, name, city, country) values
          (1001,'JK Rowling','London','England'),
          (1002,'Chetan Bhagat','Mumbai','India'),
          (1003,'John McCarthy','Chicago','USA'),
          (1004,'Dan Brown','California','USA') ;
          
insert into publisher (publisher_id, name, city, country) values
          (2001,'Bloomsbury','London','England'),
          (2002,'Scholastic','Washington','USA'),
          (2003,'Pearson','London','England'),
          (2004,'Rupa','Delhi','India') ;
          
insert into category (category_id, description) values
          (3001,'Fiction'),
          (3002,'Non-Fiction'),
          (3003,'thriller'),
          (3004,'action'),
          (3005,'fiction') ;
          
insert into catalogue (book_id, title, author_id, publisher_id, category_id, year, price) values
          (4001,'HP and Goblet Of Fire',1001,2001,3001,2002,600),
          (4002,'HP and Order Of Phoenix',1001,2002,3001,2005,650),
          (4003,'Two States',1002,2004,3001,2009,65),
          (4004,'3 Mistakes of my life',1002,2004,3001,2007,55),
          (4005,'Da Vinci Code',1004,2003,3001,2004,450),
          (4006,'Angels and Demons',1004,2003,3001,2003,350),
          (4007,'Artificial Intelligence',1003,2002,3002,1970,500) ;
          
insert into orderdetails1 (order_id,book_id,quantity) values
          (5001,4001,5),
          (5002,4002,7),
          (5003,4003,15),
          (5004,4004,11),
          (5005,4005,9),
          (5006,4006,8),
          (5007,4007,2),
          (5008,4004,3) ;
          
 SELECT * FROM author
          WHERE author_id IN
          (SELECT author_id FROM catalogue
          WHERE year>2000 AND price>
          (SELECT AVG(price) FROM catalogue)
          GROUP BY author_id HAVING COUNT(*)>1);
          
SELECT author_name 
FROM author a,catalogue c 
WHERE a.author_id = c.author_id AND book_id IN (
  SELECT book_id 
  FROM orderdetails
  WHERE quantity = (
    SELECT MAX(quantity) 
    FROM orderdetails));
    
update catalogue SET price = 1.1*price
          WHERE publisher_id IN
          (SELECT publisher_id FROM publisher WHERE
         name='pearson');
