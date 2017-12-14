




USE db_2012   --引入数据库
CREATE TABLE mytable    --创建数据表
 (USERID int,
 USERNAME varchar(20),
 USERSEX nvarchar (2),
 USERBIRTHDAY DATETIME,
 USERADDRESS TEXT,
 )
GO    --使用COL_LENGTH函数返回字段的类型长度
SELECT COL_LENGTH ( 'mytable' , 'USERID' ) AS 'int类型长度',
       COL_LENGTH ( 'mytable' , 'USERNAME' ) AS 'varchar类型长度',
	       COL_LENGTH ( 'mytable' , 'USERSEX' ) AS 'nvarchar类型长度',
	       COL_LENGTH ( 'mytable' , 'USERBIRTHDAY' ) AS 'DATETIME类型长度',
	       COL_LENGTH ( 'mytable' , 'USERADDRESS' )AS 'TEXT类型长度'
	GO
	DROP table mytable    --删除数据表
