USE db_2012						  --引入数据库
DECLARE ReadCursor CURSOR FOR			 --声明一个游标
SELECT * FROM Student
OPEN ReadCursor							 --打开游标
FETCH NEXT FROM ReadCursor				  --执行取数操作
WHILE @@FETCH_STATUS=0				   --检查@@FETCH_STATUS，以确定是否还可以继续取数
BEGIN
  FETCH NEXT FROM ReadCursor
END
