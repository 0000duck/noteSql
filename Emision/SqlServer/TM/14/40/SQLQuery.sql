Use db_2012
CREATE TABLE student4
(
 借书证号 char(8)  not null,
 索书名   char(10) not null,
 借书时间 date  not null,
  还书时间 date  not null,
PRIMARY KEY(索书名,借书证号,借书时间) 
)
