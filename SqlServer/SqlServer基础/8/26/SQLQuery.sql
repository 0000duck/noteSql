USE db_2012
SELECT * FROM Employee
WHERE Age > ALL
(
SELECT Age FROM Employee 
WHERE Name IN('张子婷','王子行')
)