USE db_2012
SELECT student.Sno,student.Sex,student.Sage,Sc.Grade 
FROM student JOIN Sc ON student.Sno = Sc.Sno 
WHERE student.Sex = 'ÄÐ'
ORDER BY student.Sage DESC

