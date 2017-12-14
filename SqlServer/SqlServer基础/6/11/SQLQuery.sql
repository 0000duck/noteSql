use db_2012
go
select *,
备注=case 
when Grade>=90 then '成绩优秀'
when Grade<90 and Grade>=80  then '成绩良好'
when Grade<80 and Grade>=70  then '成绩及格'
else '不及格'
end 
from tb_Grade
