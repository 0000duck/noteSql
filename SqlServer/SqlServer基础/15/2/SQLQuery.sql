USE db_2012	--打开数据局
SELECT * FROM Employee
BEGIN TRANSACTION INSERT_DATA      	--开始事务
  INSERT INTO Employee 
  VALUES('16','门闻双','女','22')
COMMIT TRANSACTION INSERT_DATA    	--结束事务
GO
IF @@ERROR = 0 
  PRINT '插入新记录成功！'			--输出插入成功的信息
GO
