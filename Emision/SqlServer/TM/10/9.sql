use db_2012
go
--创建视图
create view vv1
as
--定义SELECT查询语句
select s.sname,s.sage ,b.grade from student as s inner join Sc as b on s.Sno=b.Sno
go
--获取视图的信息
exec sp_helptext 'vv1'
