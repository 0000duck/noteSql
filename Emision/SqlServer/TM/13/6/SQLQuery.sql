USE db_2012					 --引入数据库
DECLARE CloseCursor Cursor FOR		 --声明游标
SELECT * FROM  Student
FOR READ ONLY
OPEN CloseCursor					 --打开游标
CLOSE CloseCursor					  --关闭游标
