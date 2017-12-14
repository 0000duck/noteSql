
USE db_2012
SELECT * FROM Student
SELECT Sname,Sex,Sage 
FROM Student 
WHERE Sage=(SELECT MAX(Sage) FROM Student) 

