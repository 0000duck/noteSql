USE db_2012
IF object_id('insert_student') is not null 	--判断该触发器是否存在
DROP TRIGGER insert_student
GO
CREATE TRIGGER insert_student--创建触发器
ON Student--基于学生表
FOR INSERT--约束INSERT操作
AS
DECLARE @Age INT--定义局部变量
SELECT @Age = Sage FROM INSERTED--存储插入的年龄	
IF(@Age > 50 OR @Age < 10)--约束年龄范围
BEGIN
	PRINT '年龄不符，重新插入'
	ROLLBACK TRANSACTION--回滚事务
END
GO
--INSERT INTO STUDENT VALUES(201109010,'XX','DF',100)
