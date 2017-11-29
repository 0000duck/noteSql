USE db_2012
SELECT Sex,AVG(Age) as 平均年龄 FROM Employee
WHERE Sex='女'
GROUP BY Sex

