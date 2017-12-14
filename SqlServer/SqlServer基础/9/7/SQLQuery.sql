USE db_2012
SELECT * FROM Student
WHERE Sage <> ANY
(SELECT AVG(Sage) FROM Student)