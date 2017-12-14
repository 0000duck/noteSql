use db_2012
go
if OBJECT_ID('books2') is not null drop table books2
create table books2
( 
  书号 varchar(30),
  书名 varchar(50),
  作者 varchar(50),
  出版社 varchar(50),
  单价 money,
  简介 text
)
--将一表中的数据插入到新表
insert into books2
select * from books where 出版社 ='人邮'
--查询数据表
select * from books2
