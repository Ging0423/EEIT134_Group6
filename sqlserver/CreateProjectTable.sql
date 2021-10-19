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
	id  int primary key not null, 
	categoryId int not null
)

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
userAddress nvarchar(50) not null

)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'yarnItem')
    drop table yarnItem;

create table yarnItem(
itemId int primary key  identity(10001,1) not null,
itemName nvarchar(50) not null,
material nvarchar(50) not null,
size nvarchar(50) not null,
color nvarchar(50) not null,
itemDescription nvarchar(max) not null,
qty int not null,
price int not null,
img nvarchar(max) not null,


)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'toolsItem')
    drop table toolsItem;

create table toolsItem(
itemId int primary key  identity(20001,1) not null,
itemName nvarchar(50) not null,
specification nvarchar(50) not null,
itemDescription nvarchar(max) not null,
qty int not null,
price int not null,
img nvarchar(max) not null,
)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'booksItem')
    drop table booksItem;

create table booksItem(
itemId int primary key  identity(30001,1) not null,
itemName nvarchar(50) not null,
publisher nvarchar(50) not null,
author nvarchar(50) not null,
itemDescription nvarchar(max) not null,
qty int not null,
price int not null,
img nvarchar(max) not null,

)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'packageItem')
    drop table packageItem;

create table packageItem(
itemId int primary key  identity(40001,1) not null,
itemName nvarchar(50) not null,
itemDescription nvarchar(max) not null,
qty int not null,
price int not null,
img nvarchar(max) not null,

)

if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'userItem')
    drop table userItem;

create table userItem(
itemId int primary key identity(50001,1) not null,
userId int /*references Users(userId)*/ not null,
itemName nvarchar(50) not null,
itemDescription nvarchar(max) not null,
qty int not null,
price int not null,
img nvarchar(max) not null,


)



if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'orderData')
    drop table orderData;

create table orderData(
orderId int primary key not null,
userId int references Users(userid) not null,
orderDate nvarchar(50) not null,
payState nvarchar(20) not null,
orderState nvarchar(20) not null,
total int not null
)



if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'orderItem')
    drop table orderItem;

create table orderItem(
orderId int  references orderData(orderId) not null,
itemId int references allItem(itemId) not null,
qty int not null
)

