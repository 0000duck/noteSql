USE db_2012
SELECT Sname,Sex FROM Student 
UNION ALL
SELECT Cname,str(Credit) FROM Course 
