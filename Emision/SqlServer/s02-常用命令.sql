-- 检查数据库磁盘空间分配结构
DBCC CHECKALLOC('stockdb')

-- 显示指定表的数据和索引的碎片信息
DBCC SHOWCONTIG