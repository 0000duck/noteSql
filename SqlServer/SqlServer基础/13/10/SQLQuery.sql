DECLARE khqc_Cursor CURSOR 						--声明游标
for select * FROM db_2012.dbo.goods
OPEN khqc_Cursor 								--打开游标
BEGIN   								
   FETCH next FROM khqc_Cursor  					--读取记录到游标返回指行数据
END
CLOSE khqc_Cursor  								--关闭游标
DEALLOCATE khqc_Cursor  							--释放游标
GO
