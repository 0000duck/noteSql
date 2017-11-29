USE db_2012 
--创建表
CREATE TABLE [dbo].[Employee8](						
	[ID] [int],
	[Name] [char](50) ,
	--设置默认约束
	[Sex] [char](2) CONSTRAINT Default_Sex Default '女',	
	[Age] [int]
) 
