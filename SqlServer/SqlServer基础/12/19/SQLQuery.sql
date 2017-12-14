use db_2012--打开数据库
if EXISTS (SELECT name 	--判断触发器是否已经存在
	FROM   sysobjects 
	WHERE  name = 'delete_employee' --名字是delete_employee
	AND type = 'TR')--类型是DDL触发器
drop trigger delete_employee--如果已经存在则删除
go
  create trigger delete_employee--重新创建delete_employee触发器
   on employee3	--依赖于表employee3
    after delete as --删除记录语句
       declare @rowcount int --声明一个整型变量
       select @rowcount = @@rowcount --给@rowcount变量赋值
  if @rowcount>1 --如果删除记录超过1条，
       begin
		print('当前删除的记录条数大于一条，一次只允许删除一条')
          rollback transaction	--结束事务
       end
  if @rowcount=1 --删除记录为1条
      begin
          declare @Name varchar(50) 		
          select @Name = Name from deleted	--提取要删除的姓名
      	delete from employee3 where Name = @Name --删除对应姓名的记录
      end
go
