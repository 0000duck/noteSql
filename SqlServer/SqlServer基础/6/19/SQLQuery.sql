DECLARE @id int, @indid int
SET @id = OBJECT_ID('tb_Course')
SELECT @indid = index_id 
FROM sys.indexes
WHERE object_id  = @id 
      AND name = 'PK_tb_Course'
DBCC SHOWCONTIG(@id, @indid)

