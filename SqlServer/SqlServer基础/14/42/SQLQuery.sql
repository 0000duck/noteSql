--创建视图
CREATE  VIEW V_Score 
WITH SCHEMABINDING		--绑定到架构
AS 
   SELECT stu.Sname,stu.Sex,stu1.BestScore
   FROM   dbo.student as stu, dbo.student1 as stu1 
   WHERE  stu.Sno = stu1.ID
GO
--在视图V_Score上创建索引
create unique clustered index I_Score on V_Score (Sname,Sex,BestScore)
select * from V_Score		--在视图V_Score上查询数据
with(index(I_Score))		--使用所用I_Score	
