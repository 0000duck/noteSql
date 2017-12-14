use db_2012
select * from (select top 3 x.sno,姓名=sname,性别=sex,分数=grade from student x,Sc c where 	x.Sno=c.Sno order by Grade desc) as xc order by 分数


