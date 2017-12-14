USE db_2012
if exists(select name from sysindexes where name='ind_em')
drop index employee.ind_em	--如果索引存在，将其删除
GO
create index ind_em		--创建索引	
on employee(Name,Age)		--为employee表的Name和Age字段创建
GO
Select * from Employee
With (index(ind_em))		--强制使用第一个找到的索引
GO
