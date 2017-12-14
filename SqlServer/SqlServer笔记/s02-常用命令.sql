-- 检查数据库磁盘空间分配结构
DBCC CHECKALLOC('stockdb')

-- 显示指定表的数据和索引的碎片信息
DBCC SHOWCONTIG

DECLARE @id int, @indid INT
set @id = OBJECT_ID('REMOTE_DAY')
select @indid=index_id
from sys.indexes
where object_id=@id
print '---------'
print @id
print @indid
print '---------'
dbcc SHOWCONTIG(@id, @indid)

-- 检查当前数据库中被更改过的数据也或日志页，并将这些数据从缓冲区写入硬盘
use stockdb
CHECKPOINT

-- DECLARE命令：声明一个或多个局部变量、游标变量、表变量
-- 变量的数据类型不能是text、 ntext或 Image
DECLARE @a VARCHAR(12)='你好'
print '特殊的'+@a

-- 备份
backup DATABASE stockdb to DISK ='backup.bak'
-- 还原
restore DATABASE stockdb from DISK ='backup.bak' WITH REPLACE
-- 停止数据
SHUTDOWN -- 1、终止登录 2、等待t-sql或存储过程执行完毕 3、执行checkpoint 4、停止执行
SHUTDOWN WITH NOWAIT -- 回滚并立即停止
