USE db_2012
SELECT * FROM Student
WHERE Sage < SOME
(SELECT AVG(Sage) FROM Student)