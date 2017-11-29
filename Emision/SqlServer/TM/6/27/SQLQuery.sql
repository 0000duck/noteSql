use db_2012
go
declare @name varchar(10)
declare @sex varchar(20)
set @name='赵小小'
set @sex='女'
if exists(select * from dbo.Employee where Sex=@sex and Name=@name)
begin 
  print '存在该人员信息'
end
else if not exists(select * from dbo.Employee  where Sex=@sex and Name=@name)
begin 
  print '不存在该人员信息'
end

