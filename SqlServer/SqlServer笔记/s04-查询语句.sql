create table testTable
(
  userid int,
  userName VARCHAR(20),
  userSex NVARCHAR(2),
  userBirthday DATETIME,
  userAddress TEXT
)
go

create table testTableNew
(
  userid int,
  userName VARCHAR(20),
  age int,
  userSex NVARCHAR(2),
  userBirthday DATETIME,
  userAddress TEXT
)
go

insert INTO testTable VALUES (1,'张三','男','2010-10-01 09:32:05','北京')
insert INTO testTable VALUES (2,'李四','女','2010-11-21 19:12:15','上海')

-- with 语句
-- 临时的结果集，在单条select\update\insert\delete语句中执行范围内定义
with tmp_table(name, sex) AS
(
    select username,usersex from testTable group by username, userSex
)
select name from tmp_table

select * from testTable
select DISTINCT(*)  from testTable -- 错误
select DISTINCT(a.*)  from testTable a -- 错误
select DISTINCT(userName) from testTable -- 正确

-- 过滤
select sum(userid) from testTable -- 4
select sum(DISTINCT userid) from testTable -- 3

-- 插入新表
select userid,userName,0,userSex,userBirthday,userAddress into testTableNew from testTable

-- having
-- 行为同where, group by 之后的条件过滤

-- compute
select * from testTable order by userid
select * from testTable order by userName compute avg(userid) -- 报错
select * from testTable order by userName compute avg(userid) by userName -- 报错
