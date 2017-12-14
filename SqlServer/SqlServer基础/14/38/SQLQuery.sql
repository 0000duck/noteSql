CREATE TABLE student2
(
学号  char(6) not null,
最好成绩  int  not null,
平均成绩  int  not null,
CHECK(最好成绩>平均成绩)
)
