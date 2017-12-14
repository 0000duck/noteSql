USE db_2012
SELECT Age,count(Age)ÈËÊý FROM Employee
GROUP BY Age
HAVING count(Age) >= 2

