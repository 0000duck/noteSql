CREATE TRIGGER T_DDL_DATABASE	--创建DDL触发器
ON DATABASE	--将该触发器应用于当前数据库
FOR DROP_TABLE, ALTER_TABLE	--对表修改时，提示信息
AS
PRINT '只有“T_DDL_DATABASE”触发器无效时，才可以删除或修改表。'
ROLLBACK		--回滚操作
