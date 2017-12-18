create or replace procedure trun_table(table_deleted in varchar2) as --创建一个存储过程，传入一个表示表名称的参数，实现清空指定的表
  cur_name integer;--定义内部变量，存储打开的游标
begin
  cur_name := dbms_sql.open_cursor;--打开游标
  dbms_sql.parse(cur_name,'truncate table'||table_deleted ||'drop storage',dbms_sql.native);--执行truncate table tb_name命令，从而实现清空指定的表
  dbms_sql.close_cursor(cur_name);--关闭游标
exception
  when others then dbms_sql.close_cursor(cur_name);--出现异常，关闭游标
  raise;
end trun_table;
/

--设置监视代码
alter index grade_index monitoring usage;
--检查索引使用情况
select * from v$object_usage;
--删除索引
drop index grade_index;

conn scott/1qaz2wsx;
create table dept_copy as select * from dept;
truncate table dept_copy;

--创建表
create table TEST
（
  id number,
  name varchar2(10),
  constraint ID_TEST_PK primary key (id)	
);


--监视
alter index ID_TEST_PK monitoring usage;



--检索数据
select * from v$object_usage;

