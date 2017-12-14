UPDATE db_2012.dbo.employee4 SET 性别 ='女' 
DECLARE cur1 CURSOR  --声明游标cur1
FOR SELECT 编号,姓名,性别,年龄,电话号码	--游标结果集
FROM db_2012.dbo.employee4--依赖表employee4
where 编号=5	--约束编号下记录为5
FOR UPDATE OF 姓名,性别	--更新游标中指定的姓名，性别字段
OPEN cur1	--打开游标
GO
FETCH NEXT FROM cur1  --读取当前行之后的结果行的数据
GO
UPDATE db_2012.dbo.employee1 SET 姓名 ='刘小明'	--更新表中的姓名字段
WHERE CURRENT OF cur1
GO
CLOSE cur1	--关闭游标
DEALLOCATE cur1	--释放游标
GO
