USE db_2012
GO
DBCC DBREINDEX('db_2012.dbo.Student',MR_Stu_Sno, 100)
GO
