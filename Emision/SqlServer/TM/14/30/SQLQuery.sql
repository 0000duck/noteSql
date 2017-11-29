USE db_2012
GO
EXEC sp_fulltext_database 'enable'    --数据库启用全文索引
EXEC sp_fulltext_catalog 'QWML','rebuild'
