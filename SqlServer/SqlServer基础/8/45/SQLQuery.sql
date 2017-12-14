USE db_2012
SELECT Sname,Sex,Sage FROM Student 
UNION ALL
SELECT Cno,Cname,NULL  FROM Course 