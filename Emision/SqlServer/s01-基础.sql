ALTER TABLE a add name VARCHAR(32)
ALTER TABLE a drop COLUMN name

INSERT INTO a(name, age) VALUES ('aaa', '123')
INSERT INTO a VALUES ('aaa', '123')

UPDATE a set name='bbb'
UPDATE a set name='bbb' WHERE name='aaa'

DELETE FROM a WHERE name='bbb'

CREATE TABLE a (
  id int CONSTRAINT pidx PRIMARY KEY ,
  name VARCHAR(8) CONSTRAINT puni UNIQUE ,
  sex VARCHAR(5) CONSTRAINT chsex CHECK (sex in ('男','女')),
  age int CONSTRAINT dfvalue DEFAULT 8
)

-- 添加约束 主键
ALTER TABLE a ADD CONSTRAINT pidx PRIMARY KEY (id)
ALTER TABLE a DROP CONSTRAINT pidx

-- 添加约束 唯一
ALTER TABLE a ADD CONSTRAINT puni UNIQUE (id)
ALTER TABLE a DROP CONSTRAINT puni

-- 添加约束 检查
ALTER TABLE a ADD CONSTRAINT chsex CHECK (sex='女')
ALTER TABLE a DROP CONSTRAINT chsex

-- 添加约束 默认值
ALTER TABLE a ADD CONSTRAINT dfvalue DEFAULT '女' FOR sex
ALTER TABLE a DROP CONSTRAINT dfvalue


declare @name NCHAR(10)
select @name=STOCK_NAME from REMOTE_INFO where STOCK_CODE='000001'
print @name

declare @name NCHAR(10)
set @name='234234'
PRINT @name

-- 全局变量
print @@connections
print @@CPU_BUSY
print @@cursor_rows
print @@dbts
print @@error
print @@identity
print @@idle
print @@io_busy
print @@lock_timeout
-- 返回上一句SQL影响的数据行数
print @@rowcount
print @@spid
print @@version

-- 运算符的表达式，除了text\ntext\image数据类型都可用
declare @a int, @b int, @c INT
-- select @a=2,@b=5
set @a=2
set @b=5
-- set 只对单行
set @c=@a*@b
print @c

-- 布尔类型：TRUE\FALSE\UNKNOWN 不能作为变量类型，也不能返回
print 3>5

-- 逻辑运算符
-- ALL\AND\ANY\BETWEEN\EXISTS\IN\LIKE\NOT\OR\SOME

-- 位运算符
-- &按位AND ^按位互斥OR |按位OR ~按位NOT

-- + 为连接字符串
select STOCK_NAME+STOCK_CODE from REMOTE_INFO where STOCK_CODE='000001'

-- 4种通配符：
/*
like:
% 0或多个任意字符
_ 任何单个字符
[] 该范围类的单个字符
[^] 不属于该范围类的单个字符
*/
select STOCK_NAME,STOCK_CODE from REMOTE_INFO where STOCK_CODE like '0000_' -- 0条数据
select STOCK_NAME,STOCK_CODE from REMOTE_INFO where STOCK_CODE like '00000_' -- 9条数据
select STOCK_NAME,STOCK_CODE from REMOTE_INFO where STOCK_CODE like '00000[123]' -- 3条数据
select STOCK_NAME,STOCK_CODE from REMOTE_INFO where STOCK_CODE like '00000[^123]' -- 6条数据


-- 8种流程控制语句
-- begin END  程序块 相当于{}，若while里面不使用begin end 则默认只执行第一条，即死循环。
-- /  WAITFOR / GOTO / WHILE / IF ELSE / BREAK / RETURN /CONTINUE

DECLARE @i INT
set @i=0
while @i<10
  BEGIN
    print @i
    set @i=@i+1
  END

DECLARE @i INT
set @i=0
while @i<10
  BEGIN
    print @i
    if @i=5
      BREAK -- 用CONTINUE就成了死循环
    set @i=@i+1
  END

-- return 终止整个程序
-- 可以指定return的结果，如果没有指定返回值，根据程序的执行结果返回一个内定值
/*
F   程序执行成功
-1  找不到对象
-2  数据类型错误
-3  死锁
-4  违反权限原则
-5  语法错误
-6  用户造成的一般错误
-7  资源错误，如磁盘空间不足
-8  非致命的内部错误
-9  已达到系统的极限
-10或-11 致命的内部不一致性错误
-12 表或指针破坏
-13 数据库破坏
-14 硬件错误
*/
DECLARE @i INT
set @i=0
while @i<10
  BEGIN
    print @i
    if @i=5
      RETURN -- BREAK
    set @i=@i+1
  END
PRINT '程序整个结束' -- 用RETURN，则不执行该语句

-- GOTO
DECLARE @i INT
SELECT @i=1
a:  -- 标识符
  PRINT @i
  set @i=@i+1
WHILE @i<5
  GOTO a -- 跳转到a标识符上继续执行

-- 参数不能包含日期，只能为时间。如：“12:12:05”
-- WAITFOR DELAY 指定等待多长时间后开始执行
-- WAITFOR TIME  指定具体时间开始执行
PRINT '等待5秒 开始' -- 设置在此处无意义，waitfor指的是整个程序块等待多长时间执行。
WAITFOR DELAY '00:00:05'
PRINT '等待5秒 结束' -- 结束和开始一起是同时执行

-- [2017-11-10 23:05:15] [S0001] 23:05:15 执行
WAITFOR time '23:05:15'
PRINT '23:05:15 执行'


