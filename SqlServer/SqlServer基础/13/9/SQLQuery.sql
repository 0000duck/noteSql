
USE db_2012
GO
DECLARE Cur_Employee CURSOR STATIC FOR
SELECT Name
FROM Employee
OPEN Cur_Employee

DECLARE @Report CURSOR

EXEC master.dbo.sp_describe_cursor @cursor_return = @Report OUTPUT,
        @cursor_source = N'global', @cursor_identity = N'Cur_Employee'
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
 



