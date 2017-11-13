-- 创建存储过程
CREATE procedure proc_test
  @username VARCHAR(20)
  AS
  select * from testTable where username=@username

exec proc_test '张三'

-- 修改存储过程
ALTER procedure proc_test
    @id int
AS
  select * from testTable where userid=@id

exec proc_test 2

drop PROCEDURE proc_test


-- 三种触发器
-- DML触发器 在执行insert,update,delete时出发
-- DDL触发器
-- 登录触发器

-- 1、DML触发器
create trigger tri_dml_tb on testTable after insert AS
  print('正在向表中插入数据：')

insert INTO testTable VALUES (1,'张三','男','2010-10-01 09:32:05','北京')
select * from testTable

create trigger tri_dml_tb on stockdb.dbo.testTable for DELETE ,UPDATE as
  print('不能删除表')

alter trigger tri_dml_tb on stockdb.dbo.testTable for DELETE ,UPDATE as
print('不能删除表')
ROLLBACK

delete from testTable where userName='张三'
select * from testTable
drop TRIGGER tri_dml_tb

-- 2、DDL触发器 运行不成功
create trigger tri_ddl_tb1 on DATABASE for delete as
  print('不能删除表')
  ROLLBACK

-- 3、登录触发器



-- 4种游标
-- 静态、动态、只进、键集驱动
-- 步骤：声明、打开、使用、关闭、释放

-- 1、申明
/*
declare cursor_name[insensitive][scroll] cursor
for select_statement
for [read only][update][of column_name]
*/
-- insensitive 对该游标提取的数据操作不影响后面的操作
-- scorll 指定所提取的选项（first,last,prior,next,relative,absolute）,如未指定，默认next
-- read only 不允许修改游标内的数据
-- update 定义游标内可更新的列
declare cur_emp CURSOR FOR
  select * from testTable

-- 只读游标
declare cur_emp1 CURSOR FOR
  select * from testTable
for READ ONLY

-- 更新游标
declare cur_emp2 CURSOR FOR
  select * from testTable
for update

-- 打开游标
open cur_emp

-- 读取游标中的数据
fetch next from cur_emp

-- 0成功、-1失败、-2不存在
print @@fetch_status

while @@fetch_status=0
  BEGIN
    fecth next from cur_emp
  END

-- 关闭游标
close cur_emp

-- 释放游标
deallocate cur_emp
deallocate cur_emp1
deallocate cur_emp2

-- 报告游标属性
sp_cursor_list [][]
sp_describe_cursor [][]






