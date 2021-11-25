USE master ;
IF EXISTS(select * from sys.databases where name='project')
BEGIN
   ALTER DATABASE project
   SET RESTRICTED_USER 
   WITH ROLLBACK IMMEDIATE ;
   DROP DATABASE project ;
END
CREATE DATABASE project ;

USE project;

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'allItem')
    drop table allItem;

create table allItem(
	itemId  int primary key not null, 
)
insert into allItem
values(10001),(10002),(10003)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'users')
    drop table users;

create table users(
userId int primary key identity(1,1) not null,
account varchar(12) not null,
userPassword varchar(12) not null,
userIdentity int,
userName nvarchar(50) not null,
email varchar(20) not null,
tel varchar(20) not null,
userAddress nvarchar(50) not null,
registerDate smalldatetime

)

insert into users(
account,
userPassword,
userIdentity,
userName,
email,
tel,
userAddress,
registerDate
)
values('admin', 'admin', '0', 'admin','admin@test.com', '7777777','test7777',convert(datetime,GETDATE(),120))

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'yarnItem')
    drop table yarnItem;

create table yarnItem(
itemId int primary key  identity(10001,1) not null,
itemName nvarchar(50) not null,
material nvarchar(50) not null,
size nvarchar(50) not null,
color nvarchar(50) not null,
itemDescription nvarchar(max) not null,
addDate smalldatetime,
qty int not null,
price int not null,

)

insert into yarnItem(
itemName,
material,
size,
color,
itemDescription,
addDate,
qty,
price
)
values('線','羊毛','3m','紅','紅紅的毛線',convert(datetime,GETDATE(),120),50,100),
('線','羊毛','3m','綠','綠綠的毛線',convert(datetime,GETDATE(),120),50,100),
('線','羊毛','10m','紅','紅紅的毛線',convert(datetime,GETDATE(),120),50,100)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'toolsItem')
    drop table toolsItem;

create table toolsItem(
itemId int primary key  identity(20001,1) not null,
itemName nvarchar(50) not null,
specification nvarchar(50) not null,
itemDescription nvarchar(max) not null,
addDate smalldatetime,
qty int not null,
price int not null,
)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'booksItem')
    drop table booksItem;

create table booksItem(
itemId int primary key  identity(30001,1) not null,
itemName nvarchar(50) not null,
publisher nvarchar(50) not null,
author nvarchar(50) not null,
itemDescription nvarchar(max) not null,
addDate smalldatetime,
qty int not null,
price int not null,

)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'kitsItem')
    drop table kitsItem;

create table kitsItem(
itemId int primary key  identity(40001,1) not null,
itemName nvarchar(50) not null,
itemDescription nvarchar(max) not null,
addDate smalldatetime,
qty int not null,
price int not null,

)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'userItem')
    drop table userItem;

create table userItem(
itemId int primary key identity(50001,1) not null,
userId int /*references Users(userId)*/ not null,
itemName nvarchar(50) not null,
itemDescription nvarchar(max) not null,
addDate smalldatetime,
qty int not null,
price int not null,

)



if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'orderData')
    drop table orderData;

create table orderData(
orderId int primary key not null,
userId int references Users(userid) not null,
recipient nvarchar(50) not null,
tel varchar(20) not null,
shippingAddress nvarchar(50) not null,
orderDate nvarchar(50) not null,
payState nvarchar(20) not null,
orderState nvarchar(20) not null,
total int not null
)



if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'orderItem')
    drop table orderItem;

create table orderItem(
id int primary key identity(1,1) not null,
orderId int  references orderData(orderId) not null,
itemId int references allItem(itemId) not null,
qty int not null
)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'shoppingCart')
    drop table shoppingCart;

create table shoppingCart(
id int primary key identity(1,1) not null,
userId int  references users(userId) not null,
itemId int references allItem(itemId) not null,
qty int not null
)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'itemImg')
    drop table itemImg;

create table itemImg(
id int primary key identity(1,1) not null,
itemId int references allItem(itemId) not null,
img nvarchar(max) not null
)
insert into itemImg
values(10001,'img/yarn/jemilli-01-750x750.jpg')

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'itemKeyword')
    drop table itemKeyword;

create table itemKeyword(
id int primary key identity(1,1) not null,
itemId int references allItem(itemId) not null,
keyword nvarchar(100)
)
