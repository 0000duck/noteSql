--修改
alter system set large_pool_size=64m;

--显示
show parameter large_pool_size;


1.当前的数据库连接数:
select count(*) from v$process

2.数据库允许的最大连接数:
select value from v$parameter where name = 'processes'

3.修改最大连接数:
alter system set processes = 300 scope = spfile;

4.重启数据库:
shutdown immediate;
startup;

5.查看当前有哪些用户正在使用数据:
SELECT osuser, a.username,cpu_time/executions/1000000||'s', b.sql_text,machine from vsessiona,vsqlarea b where a.sql_address =b.address order by cpu_time/executions desc;

6.当前的session连接数
select count(*) from v$session

7.并发连接数
select count(*) from v$session where status='ACTIVE'

8.最大连接
show parameter processes 

9.查看版本
select * from v$version;

10.查看实例
SELECT * FROM V$DATABASE;
select * from v$instance; 


select sum(getmisses) 不命中数
from v$rowcache;

-- 用户执行的sql语句历史记录 这些是存在共享池中的
select sql_text,t.FIRST_LOAD_TIME,t.last_active_time,t.RUNTIME_MEM,t.OPTIMIZER_MODE,t.PARSING_SCHEMA_NAME, module
from v$sqlarea t order by last_active_time desc

select sql_text,t.FIRST_LOAD_TIME,t.last_active_time,t.RUNTIME_MEM,
       t.OPTIMIZER_MODE,t.PARSING_SCHEMA_NAME, module
from v$sqlarea t 
where PARSING_SCHEMA_NAME='BUSCITY'
and module='JDBC Thin Client'
order by last_active_time desc

-- 查看oracle会话
select * from v$session t order by t.LAST_ACTIVE_TIME desc

-------------查看oracle的权限角色------------------------------
select   *   from   dba_role_privs;    授予用户和其他角色的角色   
select   *   from   dba_sys_privs;     授予用户和其他角色的系统权限   
select   *   from   dba_tab_privs;     数据库中对象的所有授权
select * from user_role_privs;         查看当前用户的角色
