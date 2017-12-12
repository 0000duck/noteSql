USE db_2012
--判断表中是否有要删除的索引
If EXISTS(Select * from sysindexes where name='IX _Stu_Sno1')
 Drop Index Student.IX_Stu_Sno1
