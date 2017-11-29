use db_2012
GO
if exists(select name from sysobjects
where name='pro_out16'and type='p')		
drop proc pro_out16
GO
create procedure pro_out16
  @id int,								--参数@id
  @score int outpu
as				
--将查询结果赋给@score						
set @score=(select Score from score where ID=@id)
GO
declare @stuscore int --定义分数变量
declare @stuid int--定义ID变量
set @stuid=1    							--给ID变量赋值
exec pro_out16 @stuid,@stuscore output--执行存储过程，给@stuscore赋值
--判断分数等级
if @stuscore>=85    			
  print rtrim(@stuscore)+'外语成绩为高等水平'
else if @stuscore>=70
  print rtrim(@stuscore)+'外语成绩为中等水平'
else if @stuscore<70
  print rtrim(@stuscore)+'外语成绩为一般水平'
go
