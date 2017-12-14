USE db_2012
GO
--创建视图
CREATE VIEW Lesson_Profession_view
WITH ENCRYPTION	--加密(将原文本转换为模糊格式)
AS
--定义SELECT查询语句
SELECT a.sname,a.sage, b.grade, a.sno FROM Student AS a INNER JOIN  SC AS b ON a.sno = b.sno
GO
--查看创建的视图中的数据
EXEC sp_helptext Lesson_Profession_view
