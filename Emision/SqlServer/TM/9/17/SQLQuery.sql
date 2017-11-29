USE db_2012
SELECT * FROM Student
join SC
join Course
on SC.Cno=Course.Cno
on Student.Sno=SC.Sno