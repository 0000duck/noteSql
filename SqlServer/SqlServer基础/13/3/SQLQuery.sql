USE db_2012
DECLARE Cur_Emp_02 CURSOR FOR
SELECT Name,Sex,Age FROM Employee
FOR UPDATE    --�����α�
GO
