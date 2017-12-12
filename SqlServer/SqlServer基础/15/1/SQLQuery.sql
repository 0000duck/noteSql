USE db_2012			--引入数据库
SELECT * FROM Employee WHERE ID = 001
BEGIN TRANSACTION update_data 	--开始事务
  UPDATE Employee SET Name = '张婷'	            --修改数据
    Where ID = 1 		    --条件 
	COMMIT TRANSACTION update_data 	
	SELECT * FROM Employee  WHERE ID =001