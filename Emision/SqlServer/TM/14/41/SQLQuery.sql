CREATE TABLE student5
(
借书证号 char(8)  NOT NULL,
ISBN char(16) NOT NULL,
索书名 char(10) NOT NULL,
借书时间 date NOT NULL,
还书时间 date NOT NULL,
CONSTRAINT FK_point FOREIGN KEY (索书名,借书证号,借书时间) 
REFERENCES student4 (索书名,借书证号,借书时间)
ON DELETE NO ACTION
)