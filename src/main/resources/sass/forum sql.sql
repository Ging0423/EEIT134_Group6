Use project

create table article(
	articleId int not null primary key identity(10000,1),
	title nvarchar(50) not null,
	categoryId int not null,
	content text not null,
	authorId int not null,
	postDate date not null,
	clickNum int not null,
	likeNum int not null,
	shareNum int not null
);

select * from article;

create table reply(
	replyId int not null primary key identity(10000,1),
	articleId int not null,
	content text not null,
	authorId int not null,
	replyDate date not null,
	likeNum int not null
);

select * from reply;

create table forumCategory(
	categoryId int not null primary key identity(1,1),
	title nvarchar(10) not null
);

select * from forumCategory