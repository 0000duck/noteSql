USE db_2012
GO
SET SHOWPLAN_ALL ON
GO
SELECT Sname,Sex,Sage FROM Student WHERE Sex='ÄÐ' AND Sage >23
GO

