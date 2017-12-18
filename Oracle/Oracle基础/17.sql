create directory dump_dir as 'd:\dump';
grant read,write on directory dump_dir to scott;

impdp system/1qaz2wsx directory=dump_dir dumpfile=tablespace.dmp tablespaces=tbsp_1

impdp system/1qaz2wsx directory=dump_dir dumpfile=fulldatabase.dmp full=y

impdp scott/1qaz2wsx directory=dump_dir dumpfile=sqlfile.dmp sqlfile=test.sql

impdp system/1qaz2wsx directory=dump dumpfile=tran_datafiles.dmp transport_datafiles='d:\OracleData\test.dbf'

--在sqlplus环境下
 create table student
 (stuno number(4),
 stuname varchar2(20),
 sex varchar2(4),
 old number(4)
 );

---在cmd环境下
sqlldr system/1qaz2wsx control=d:\data\student.ctl log=d:\data\stu_log
load data
  infile 'd:\data\student.txt'
  into table student
  (stuno position(01:04) integer external,
   stuname position(11:14) char,
   sex position(21:22) char,
   old position(29:30) integer external
  )
1001      东方      男      30
1002      开心      女      25
1003      JACK      男      23
1004      ROSE      女      20

--在sqlplus环境下
create table persons
(code number(4),
name varchar2(20),
sex varchar2(4),
old number(4)
);

--在cmd环境下
sqlldr system/1qaz2wsx control=d:\data\persons.ctl
1005,east,女,26
1006,west,男,25
1007,happy,男,24
1008,mary,女,20
load data
infile 'd:\data\persons.csv'
append into table persons
fields terminated by ','
(code,name,sex,old)

--创建目录
create directory dump_dir as 'd:\dump';

--给hr授权
grant read,write on directory dump_dir to hr;



--在cmd下导出表
expdp hr/hr directory=dump_dir dumpfile=tab.dmp tables=employees





--在cmd下导入
impdp scott/1qaz2wsx directory=dump_dir dumpfile=tab.dmp tables=hr.employees remap_schema=hr:scott

--在cmd下
expdp scott/1qaz2wsx directory=dump_dir dumpfile=tab.dmp tables=emp,dept

expdp system/1qaz2wsx directory = dump_dir dumpfile=schema.dmp schemas = scott,hr

expdp system/1qaz2wsx directory = dump_dir dumpfile = tablespace.dmp tablespaces = tbsp_1

expdp system/1qaz2wsx directory=dump_dir dumpfile=fulldatabase.dmp full=y

expdp scott/1qaz2wsx directory=dump_dir dumpfile=content.dmp content=data_only

expdp scott/1qaz2wsx directory=dump_dir dumpfile=query.dmp tables=dept query='where deptno=10'

impdp system/1qaz2wsx directory=dump_dir dumpfile=tab.dmp tables=scott.dept,scott.emp remap_schema=scott:system

impdp system/1qaz2wsx directory=dump_dir dumpfile=schema.dmp schemas=scott remap_schema=scott:system;

