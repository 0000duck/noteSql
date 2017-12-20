alter system set db_recovery_file_dest_size=4g scope=both;

connect system/1qaz2wsx as sysdba;



archive log list;



shutdown immediate;
startup mount;
alter database archivelog;



alter system set db_flashback_retention_target = 7200;




alter database flashback on;
alter database open;



archive log list;

connect system/1qaz2wsx sydba;
select oldest_flashback_scn,oldest_flashback_time from v$flashback_database_log;





shutdown immediate
startup mount;



flashback database to scn 3866472


alter database open resetlogs;

connect scott/1qaz2wsx;
create table dept2 as select * from dept;


select * from dept2;

set time on;
delete from dept2 where deptno = 38;
commit;



alter table dept2 enable row movement;
flashback table dept2 to timestamp to_timestamp('2012-01-09 16:33:17','yyyy-mm-dd hh24:mi:ss');

connect scott/1qaz2wsx;


create table dept_copy as select * from dept;



select * from tab;



drop table dept_copy;


select object_name,original_name from user_recyclebin;



flashback table dept_copy to before drop;


--进入hr模式
connect hr/hr;

--创建employees的副本
create table employees_copy as select * from employees;


--查询数据字典，看employees_copy的存在
select * from tab;


--删除掉employees_copy
drop table employees_copy;

--查询回收站信息
select object_name,original_name from user_recyclebin;


--闪回恢复数据表
flashback table employees_copy to before drop;


--在scott模式下
connect scott/1qaz2wsx;
--创建test表
create table test as select * from dept;

--查询test表中的记录
select * from test;

--显示时间
set time on;
--向表中插入1条记录
insert into test values(23,'df1','changchun');
commit;

--闪回数据，恢复到插入记录之前的状态
alter table test enable row movement;
flashback table test to timestamp to_timestamp('2012-04-26 16:54:22','yyyy-mm-dd hh24:mi:ss');

