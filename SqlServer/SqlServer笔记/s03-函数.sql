-- 6种函数
-- 聚合函数、数学函数、字符串函数、日期时间函数、转换函数、元数据函数

-- 1、聚合函数
select distinct(code) from STOCK_DAY
select max(DISTINCT code) from STOCK_DAY

-- 2、数据函数
-- abs绝对值、cos余弦、cot余切、sin正弦、tan正切
-- rand 返回0-1之间的随机float 指定种子值，返回结果每次一样
-- round 四舍五入指定长度
-- pi 圆周率
-- power 指定次乘方
-- square 平方
-- sqrt 平方根
-- sign 返回0、-1、+1
print pi()
print power(2,3)
print square(3)
print rand()
print rand(1000)
select rand(),rand(),rand(),rand(1000),rand(1000),rand(1000)

-- 3、字符串函数
print(ascii('}')) -- 125
print(left('left123456', 2)) -- le
print(right('left123456', 2)) -- 56
print(len('left123456')) -- 10
print(replace('left123456', 'left', 'right')) -- right123456
print(reverse('left123456')) -- 654321tfel
print(str(3.1415)) -- 3
print(str(3.1415, 3, 2)) -- 3.1
print(str(3.1415, 3, 1)) -- 3.1
print(str(3.1415, 4, 3)) -- 3.14
-- str(float, len, decimal)
-- len总长度（含小数点），
-- decimal小数点后的位数
print(substring('left123456', 4, 6)) -- t12345
print(substring('left123456', 0, 1)) -- ‘’
print(substring('left123456', 0, 2)) -- l
-- substring(expression, start, len)
-- start 开始的位置，“从1开始”，如果小于0报错，等于0返回0长度的表达式
-- len 长度
print(substring('left123456', 5, 6)) -- 123456

-- 4、日期函数
print(getdate()) -- 11 13 2017 11:31PM
print(year(getdate())) -- 2017
print(month(getdate())) -- 11
print(day(getdate())) -- 13
-- dateadd(datepart, number, date)
-- datepart 指定日期的哪一个部分
-- number 数值
-- date 日期
-- datepart对照表：
-- year  \month\week\quarter\dayofyear\day\hour\minute\second\millisecond
-- yy,yyyy\mm,m\wk,ww\qq,q  \dy,y     \dd,d\hh \mi,n  \ss,s   \ms
print(dateadd( 'day', 1, getdate())) -- 报错
print(dateadd( "day", 1, getdate())) -- 必须改为双引号“”  或者去掉单引号 ‘
print(dateadd( day, 1, getdate()))
print(dateadd( d, 1, getdate()))
print(dateadd( q, 1, getdate())) -- 季度

-- 计算时间差
print(datediff(d, '2017-11-01', '2017-11-15')) -- 14
print(datediff(d, '2017-11-15', '2017-11-1')) -- -14
print(datediff(mi, '13:20', '13:45')) -- 25

-- 5、转换函数：
print( cast( '0.23' as numeric(8,2) ) ) -- 0.23
print( cast( 0.2312 as VARCHAR ) ) -- 0.2312
print( cast( 0.2312 as NVARCHAR ) ) -- 0.2312

-- convert 不是标准的SQL函数
print( convert( DATETIME, getdate(), 126) ) -- 0.2312
print( CONVERT( varchar(8), GETDATE(), 120) ) -- 2017-11-
print( CONVERT( varchar(8), GETDATE(), 112) ) -- 20171113

-- 时分秒：
-- 20170210
select CONVERT(varchar(20), getdate(), 112);
-- 2017021011
select CONVERT(varchar(20), getdate(), 112)+REPLACE(CONVERT(varchar(2), getdate(), 108),':','');
-- 201702101132
select CONVERT(varchar(20), getdate(), 112)+REPLACE(CONVERT(varchar(5), getdate(), 108),':','');
-- 20170210113207
select CONVERT(varchar(20), getdate(), 112)+REPLACE(CONVERT(varchar(8), getdate(), 108),':','');

-- 6、元数据函数
-- col_length() -- 返回 列的定义长度
-- col_name() -- 返回列的名称
-- db_name() -- 数据库名
-- object_id() -- 数据库对象表示符
create table testTable
(
  userid int,
  userName VARCHAR(20),
  userSex NVARCHAR(2),
  userBirthday DATETIME,
  userAddress TEXT
)
go
print( col_length('testTable', 'userId') ) -- 4
print( col_length('testTable', 'userName') ) -- 20
print( col_length('testTable', 'userSex') ) -- 4
print( col_length('testTable', 'userBirthday') ) -- 8
print( col_length('testTable', 'userAddress') ) -- 16

print( object_id('testTable') ) -- 1845581613 表的ID
print( col_name(object_id('testTable'), 2) ) -- userName 表中第一个字段名称





