USE db_2012
CREATE UNIQUE CLUSTERED INDEX IX_Stu_Sno
on Student(Sno)
with pad_index,fillfactor = 10
