USE db_2012
WITH AvgAgeReps(Age, AgeCount) AS 
(
    SELECT Age, COUNT(*) 
    FROM Employee AS AgeReports
    WHERE Age IS NOT NULL
    GROUP BY Age
)
SELECT AVG(Age) AS [AvgAge of Employee]
FROM AvgAgeReps





