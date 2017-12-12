USE db_2012
SELECT * FROM student WHERE Sno='201109008'	--查询修改前的表
BEGIN TRANSACTION update_data				--开始事务
	UPDATE student SET Sname='赵雪'			--修改数据
	WHERE Sno='201109008'					
COMMIT TRANSACTION update_data				--结束事务
SELECT * FROM student WHERE Sno='201109008'	--查询修改后的表
