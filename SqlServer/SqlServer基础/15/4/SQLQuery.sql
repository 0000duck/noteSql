USE db_2012	--打开数据库
CREATE TABLE tb_Depart	--创建数据表
(ID INT PRIMARY KEY, DepName VARCHAR(10)
)
INSERT INTO tb_Depart VALUES(1,'ASP.NET部门')		--插入记录
INSERT INTO tb_Depart VALUES(2,'C#部门')		--插入记录
INSERT INTO tb_Depart VALUES(2,'JAVA部门')		--插入记录
GO
SELECT * FROM tb_Depart	--检索记录
