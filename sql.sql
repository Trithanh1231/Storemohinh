create database assignment_java5
go
use assignment_java5
create table customers(
	customerid integer IDENTITY (1, 1)  primary key,
	name nvarchar(50),
	email varchar(150),
	password varchar(30),
	phone varchar(10),
	registereddate Date,
	status integer
) 
create table orders(
	orderid integer IDENTITY (1, 1)  primary key,
	orderdate Date,
	customerid integer references customers(customerid),
	amount float,
	status integer
) 
create table orderdetails(
	orderdetailid integer IDENTITY (1, 1)  primary key,
	orderid integer references orders(orderid),
	productid integer references products(productid),
	quality integer,
	unitprice float
) 
create table products(
	productid integer IDENTITY (1, 1)   primary key,
	name nvarchar(200),
	unitprice float,
	image varchar(255),
	description text,
	entereddate Date,
	categoryid integer references categories(categoryid)
)
create table categories(
	categoryid integer IDENTITY (1, 1) primary key,
	name nvarchar(100)
) 
create table account(
	username varchar(30) primary key,
	password varchar(30),
	admin bit 
) 
insert into account values
('Dang','123',1),
('Thanh','123',1),
('Na','123',0),
('HHA','123',0)

insert into categories values
('Lu'),
('Kill'),
('Silent'),
('add')

insert into products(name,unitprice,image,description,entereddate,categoryid) values ('nono',2,'h1.png','adassda','12/02/2022',00)
insert into products(name,unitprice,image,description,entereddate) values ('till',3,'h1.png','adassda','11/02/2022')
insert into products(name,unitprice,image,description,entereddate) values ('hkq',1,'h1.png','adassda','10/02/2022')
insert into products(name,unitprice,image,description,entereddate) values ('ahz',5,'h1.png','adassda','9/02/2022')




insert into customers values
('Dang','dang@gmail.com','123','0788092341','12/02/2022',1),
('Toan','toan@gmail.com','123','0783422341','2/02/2022',2),
('Hung','hung@gmail.com','123','0781252341','11/02/2022',1)

insert into orders values
('02/01/2021',001,2,2),
('02/01/2021',002,1,2),
('02/01/2021',003,3,2)

insert into orderdetails(quality,unitprice) values (1,2)
insert into orderdetails(quality,unitprice) values (2,3)
insert into orderdetails(quality,unitprice) values (3,4)
