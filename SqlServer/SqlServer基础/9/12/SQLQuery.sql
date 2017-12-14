USE db_2012
SELECT * FROM Student
LEFT JOIN SC 
ON  Student.Sno=SC.Sno