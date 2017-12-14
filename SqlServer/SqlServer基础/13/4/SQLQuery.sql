USE db_2012
DECLARE Emp_01 CURSOR FOR     --声明游标
SELECT * FROM Employee
WHERE ID = '1'
OPEN Emp_01                   --打开游标
GO
