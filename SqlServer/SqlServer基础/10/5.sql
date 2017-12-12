ALTER VIEW View_Student(Sname,Sage)			--修改已存在的视图
AS
SELECT Sname,Sage FROM Student WHERE sno='201109002'
go
EXEC sp_helptext 'View_student'				--查看视图定义
