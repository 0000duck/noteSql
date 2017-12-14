USE db_2012
Go
CREATE TABLE student3
(
借书证号 char(8)  not null  CONSTRAINT  py  PRIMARY KEY,
姓名 char(8)  not null  CONSTRAINT  uk  UNIQUE,
专业  char(12) not null,
性别  bit  not null,
借书量 int  CHECK(借书量>=0 AND 借书量<=20) null
)
go 
