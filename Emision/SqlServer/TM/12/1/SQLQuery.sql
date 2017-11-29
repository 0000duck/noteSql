CREATE TRIGGER T_DML_Emp3--创建触发器T_DML_Emp3
ON employee3	--依赖于表employee3
AFTER INSERT	--执行插入语句之后
AS 
RAISERROR ('正在向表中插入数据', 16, 10); --提示信息
