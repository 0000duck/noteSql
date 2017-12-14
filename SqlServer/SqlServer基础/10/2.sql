use db_2012
go
--创建视图
create view v1
as
--定义select语句
select ID,Name,Sex,Age from 
Employee
go
--查询所创建的视图中数据
select * from v1
