USE db_2012   	--打开数据库
SELECT * FROM Employee		--显示Employee表数据
BEGIN TRANSACTION UPDATE_DAT			        --开始事务
  UPDATE Employee SET Name = '闻双'  	        --修改员工信息
  WHERE ID = 16
  DELETE Employee WHERE ID = 16	        	    --删除指定的员工记录
COMMIT TRANSACTION UPDATE_DATA			           --提交事务

