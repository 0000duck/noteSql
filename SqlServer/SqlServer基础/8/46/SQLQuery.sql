USE db_2012
SELECT Sname,Sex FROM Student 
UNION 
SELECT Cno,Cname  FROM Course 
UNION 
SELECT Sno,Cno FROM SC