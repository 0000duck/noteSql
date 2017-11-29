--创建视图
create view v_ware
as
--定义只显示指定信息的查询语句
select sno ,sname ,sage from student
go
--查询视图中的数据
select * from v_ware