--将Employee表设为惟一索引
CREATE UNIQUE CLUSTERED INDEX MR_Emp_ID_FIND ON Employee (ID)
WITH IGNORE_DUP_KEY
--判断db_2012数据库是否可以创建全文索引
if (select DatabaseProperty('db_2012','IsFulltextEnabled'))=0 
EXEC sp_fulltext_database 'enable'   --数据库启用全文索引
EXEC sp_fulltext_catalog 'ML_Employ','create'    --创建全文索引目录为ML_Employ
EXEC sp_fulltext_table 'Employee','create','ML_Employ','MR_Emp_ID_FIND' --表启用全文索引标记
EXEC sp_fulltext_column 'Employee','Name','add'    --添加全文索引字段
EXEC sp_fulltext_table 'Employee','activate'   --激活全文索引
EXEC sp_fulltext_catalog 'ML_Employ','start_full'    --启动表的全文索引的完全填充


 