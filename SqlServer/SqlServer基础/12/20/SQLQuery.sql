CREATE TRIGGER mr--创建一个触发器mr
ON employee3--依赖于表employee3
AFTER INSERT--执行insert操作之后
AS 
Print ('正在向表中插入数据');--打印提示信息	
go
Insert into employee3 values(5,'触发器trigger',25)
