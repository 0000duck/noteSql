USE db_2012
WITH AgeReps(Age, AgeCount) AS 
(
    SELECT Age, COUNT(*) 
    FROM Employee AS AgeReports
    WHERE Age IS NOT NULL
    GROUP BY Age
)
SELECT Age, AgeCount 
FROM AgeReps



 

