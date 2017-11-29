USE db_2012
CREATE TABLE [dbo].[Employee6](
	[ID] [int] CONSTRAINT UQ_ID UNIQUE,
	[Name] [char](50) ,
	[Sex] [char](2),
	[Age] [int]
)
