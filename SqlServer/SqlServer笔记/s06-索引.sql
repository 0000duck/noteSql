
-- 创建聚集索引
create unique clustered index ix_testtb on testTable(userid)
-- 删除聚集索引
drop index testTable.ix_testtb
-- 创建聚集索引 并且不能重复
create unique clustered index ix_testtb on testTable(userid) with IGNORE_DUP_KEY

-- 创建非聚集索引
create index ix_testtb1 on testTable(userName)
drop index testTable.ix_testtb1
-- 创建非聚集索引 填充因子为100
create index ix_testtb1 on testTable(userName) with FILLFACTOR =100

-- 查看索引
select id,name from sysindexes
WHERE id = (select id from sysobjects where name='testTable')

exec sp_rename 'testTable.ix_testtb1','ix_testtb2'

-- 显示查询语句的执行信息
set SHOWPLAN_ALL on
-- 显示查询语句的执行信息
set SHOWPLAN_TEXT on


set SHOWPLAN_ALL on
go
select * from testTable
go
set SHOWPLAN_ALL off
go

-- 开启隐式事务
set IMPLICIT_TRANSACTIONS on

declare @count int
  select @count=count(1) from testTable
  print @count -- 3
BEGIN TRANSACTION update_trans
  -- update testTable set userName='李白' where userName='张三'
  insert INTO testTable VALUES (3,'李白','男','2010-10-01 09:32:05','北京')
    select @count=count(1) from testTable
    print @count -- 4
commit TRANSACTION update_trans
  select @count=count(1) from testTable
  print @count -- 4

ROLLBACK

select * from testTable

commit