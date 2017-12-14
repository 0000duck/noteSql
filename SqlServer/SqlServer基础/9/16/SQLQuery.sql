USE db_20012
SELECT * FROM Student,Course,SC
WHERE Student.Sno=SC.Sno
AND SC.Cno=Course.Cno