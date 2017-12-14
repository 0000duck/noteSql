select 学号,姓名,
stuff(学号,2,2,200900) as 新学号
from tb_stu05
