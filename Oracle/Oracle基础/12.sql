create user mr identified by mrsoft
default tablespace users
temporary tablespace temp;

create profile lock_account limit
failed_login_attempts 5
password_lock_time 7;


alter user dongfang profile lock_account;

create profile password_lift_time limit
password_life_time 30
password_grace_time 3;
alter user dongfang profile password_lift_time;


show parameter resource_limit;
alter system set resource_limit=true;

alter profile password_lift_time limit
cpu_per_session 20000
sessions_per_user 10
cpu_per_call 500
password_life_time 180
failed_login_attempts 10;

--创建用户
create user hello identified by mrsoft
default tablespace users
temporary tablespace temp;
--授权
grant connect,create table to hello;

--创建角色
create role mr identified by 123456;


--授权
grant connect,create table to mr;

create user east identified by mrsoft
default tablespace users
temporary tablespace temp
quota 10m on tbsp_1;

create user df identified by mrsoft
default tablespace tbsp_1
temporary tablespace temp
quota unlimited on tbsp_1;

connect system/1qaz2wsx;
grant connect,resource to east;
connect east/123456;

--创建用户dongfang
create user dongfang identified by mrsoft
default tablespace users
quota 10m on users;
--创建用户xifang
create user xifang identified by mrsoft
default tablespace users
quota 10m on users;
--授权
grant create session,create table to dongfang with admin option;
connect dongfang/mrsoft;
grant create session,create table to xifang;
--连接到xifang
connect xifang/mrsoft;
create table tb_xifang
( id number,
  name varchar2(20)
);


connect system/1qaz2wsx;
revoke resource from east;

grant select,insert,delete,update on scott.emp to xifang;

connect system/1qaz2wsx;
revoke delete,update on scott.emp from xifang;

connect system/1qaz2wsx;
create role designer identified by 123456;

