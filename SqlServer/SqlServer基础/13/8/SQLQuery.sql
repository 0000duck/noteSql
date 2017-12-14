
USE db_2012
GO
DECLARE Cur_Employee CURSOR FOR
SELECT Name
FROM Employee
WHERE Name LIKE 'Íõ%'
OPEN Cur_Employee
DECLARE @Report CURSOR
EXEC master.dbo.sp_cursor_list @cursor_return = @Report OUTPUT,
      @cursor_scope = 2
FETCH NEXT from @Report
WHILE (@@FETCH_STATUS <> -1)
BEGIN
   FETCH NEXT from @Report
END
CLOSE @Report
DEALLOCATE @Report
GO
CLOSE Cur_Employee
DEALLOCATE Cur_Employee
GO


