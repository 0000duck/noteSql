USE db_2012
GO
CREATE  INDEX IX_Stu_Sname ON Student(Sname)
WITH  FILLFACTOR=80
GO
