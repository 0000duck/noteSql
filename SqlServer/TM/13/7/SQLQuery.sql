
USE db_2012
DECLARE FreeCursor Cursor FOR			--声明游标
SELECT * FROM Student
OPEN FreeCursor							 --打开游标
Close FreeCursor						 --关闭游标
DEALLOCATE FreeCursor					--释放游标

