USE db_2012
SELECT * FROM Course
SELECT Cname,COUNT(Cname) AS �ظ����� FROM Course
GROUP BY Cname
HAVING COUNT(Cname)>1
ORDER BY Cname