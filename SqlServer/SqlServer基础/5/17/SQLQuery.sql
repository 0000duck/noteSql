USE db_2012
CREATE TABLE [dbo].[Employee7](
	[ID] [int],
	[Name] [char](50) ,
	[Sex] [char](2) CONSTRAINT CK_Sex Check(sex in('ÄÐ','Å®')),
	[Age] [int]
)
