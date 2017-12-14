USE db_2012
SELECT Sno,Cno,
等级=CASE 
WHEN Grade >= 90 then '优秀'
WHEN Grade >= 80 and Grade < 90 then '良好'
WHEN Grade >= 70 and Grade < 80 then '中等'
WHEN Grade >= 60 and Grade < 70 then '及格'
ELSE '不及格'
END
FROM SC