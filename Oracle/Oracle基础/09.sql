create table students(
stuno number(10) not null, --学号
stuname varchar2(8),	--姓名
sex char(2),	--性别
age int,	--年龄
departno varchar2(2) not null,	--系别编号
classno varchar2(4) not null,	--班级编号
regdate date default sysdate	--建档日期
);

create table Books_2
(
  BookNo number(4) primary key,--图书编号
  BookName varchar2(20),--图书名称
  Author varchar2(10),--作者   
  SalePrice number(9,2),--定价     
  PublisherNo varchar2(4) not null,--出版社编号
  PublishDate date,--出版日期
  ISBN varchar2(20) not null--ISBN
);

 create table Members
(
  MemNo number(4) not null,                	--会员编号
  MemName varchar2(20) not null,            	--会员名称
  Phone varchar2(20),						--联系电话
  Email varchar2(30),						--电子邮件地址
  QQ varchar2(20) Constraint QQ_UK unique,	--QQ号，并设置为UNIQUE约束
  ProvCode varchar2(2) not null,				--省份代码
  OccuCode varchar2(2) not null,              	--职业代码
  InDate date default sysdate，				--入会日期
  Constraint Mem_PK primary key (MemNo)	--主键约束列为MemNo
);

create table employees_temp
as select * from employees
where department_id=30;

alter table employees_temp
add constraint temp_departid_fk
foreign key(department_id)
references departments(department_id);


 create table Student
 (
   StuCode varchar2(4) not null,
   StuName varchar2(10) not null,
   Age int constraint Age_CK check (age > 0 and age <120) disable,
   Province varchar2(20),
   SchoolName varchar2(50)
 );

--创建表空间
create tablespace tbs_test datafile 'D:\OracleFiles\OracleData\datafile_test.dbf'
size 100m
extent management local autoallocate
segment space management auto;


--创建数据表，放入表空间
create table students_test(
stuno number(10) not null, --学号
stuname varchar2(8),	--姓名
sex char(2),	--性别
age int
)tablespace tbs_test;

alter table students_test
add constraint students_test_PK primary key(stuno);

create table students_2
as select *
from students;

create table students_3(
stuno number(10) not null, --学号
stuname varchar2(8),	--姓名
sex char(2),	--性别
age int,	--年龄
departno varchar2(2) not null,	--系别编号
classno varchar2(4) not null,	--班级编号
regdate date default sysdate	--建档日期
)tablespace tbsp_1 
storage(initial 256k);

create table students_4(
stuno number(10) not null, --学号
stuname varchar2(8),	--姓名
sex char(2),	--性别
age int,	--年龄
departno varchar2(2) not null,	--系别编号
classno varchar2(4) not null,	--班级编号
regdate date default sysdate	--建档日期
)tablespace tbsp_1 
storage(initial 256k)
pctfree 20
pctused 40;


create table students_5(
stuno number(10) not null, --学号
stuname varchar2(8),	--姓名
sex char(2),	--性别
age int,	--年龄
departno varchar2(2) not null,	--系别编号
classno varchar2(4) not null,	--班级编号
regdate date default sysdate	--建档日期
)tablespace tbsp_1 
storage(initial 256k)
pctfree 20
pctused 40
initrans 10;

create table students_6(
stuno number(10) not null, --学号
stuname varchar2(8),	--姓名
sex char(2),	--性别
age int,	--年龄
departno varchar2(2) not null,	--系别编号
classno varchar2(4) not null,	--班级编号
regdate date default sysdate	--建档日期
)tablespace tbsp_1 
storage(initial 256k)
pctfree 20
pctused 40
initrans 10
nologging;

create table Books
(
  BookNo number(4) not null,--图书编号
  BookName varchar2(20),--图书名称
  Author varchar2(10),--作者   
  SalePrice number(9,2),--定价     
  PublisherNo varchar2(4) not null,--出版社编号
  PublishDate date,--出版日期
  ISBN varchar2(20) not null--ISBN
);

create table Books_1
(
  BookNo number(4) not null,--图书编号
  BookName varchar2(20),--图书名称
  Author varchar2(10),--作者   
  SalePrice number(9,2),--定价     
  PublisherNo varchar2(4) not null,--出版社编号
  PublishDate date,--出版日期
  ISBN varchar2(20) not null,--ISBN
  constraint BOOK_PK primary key (BookNo)
);

alter table Books add constraint Books_PK primary key(BookNo);

