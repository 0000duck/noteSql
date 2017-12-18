run{
allocate channel ch_1 device type disk
format = 'd:\oraclebf\%u_%c.bak';
backup tablespace system,users,tbsp_1,ts_1 channel ch_1;
}

backup incremental level = 1
format 'D:\OracleFiles\Backup\oar11g_%m_%d_%c.bakf'
tablespace system;

backup incremental level=2 cumulative tablespace example
format 'D:\OracleFiles\Backup\oar11g_%m_%t_%c.bak';

--在SQL*Plus模式下
connect system/1qaz2wsx as sysdba;
select log_mode from v$database;
---在CMD环境下
rman target system/1qaz2wsx nocatalog;
--在RMAN环境下
shutdown immediate
startup mount



run{
allocate channel ch_1 type disk;
backup database
format 'D:\OracleFiles\Backup\orcl_%t_%u.bak';
}


alter database open;

shutdown immediate;
--然后手动删除users01.dbf文件，并试图使用startup命令启动数据库




startup mount

run{
allocate channel ch_1 type disk;
restore database;
}

alter database open;

--SQL*Plus模式下
select log_mode from v$database;



---在CMD模式下：
rman target system/1qaz2wsx nocatalog;




--在rman模式下：
run{
allocate channel ch_1 type disk;
allocate channel ch_2 type disk;
backup tablespace users
format 'D:\OracleFiles\Backup\users_tablespace.bak';
}



shutdown immediate; 
--然后手动删除users表空间对应的数据文件


startup mount;


run{
allocate channel ch_1 type disk;
restore tablespace users;
recover tablespace users;
}

alter database open;



---在CMD模式下：
rman target system/1qaz2wsx nocatalog;


--在rman模式下：
shutdown immediate;

startup mount;


run{
allocate channel ch_1 type disk;
allocate channel ch_2 type disk;
backup database format 'D:\OracleFiles\Backup\database_%t_%u_%c.bak';
backup archivelog all format 'D:\OracleFiles\Backup\archive_%t_%u_%c.bak';
}


--在sqlplus环境下：
select to_char(sysdate,'hh24:mi:ss')
from dual;

alter session set nls_date_format = 'yyyy-mm-dd';
insert into scott.emp(empno,ename,job,hiredate,sal)
values(1234,'东方','manager','1975-01-12',5000);

insert into scott.emp(empno,ename,job,hiredate,sal)
values(6789,'西方','salesman','1980-12-12',3000);

commit;


---在rman环境中
shutdown immediate;

startup mount;



run{
sql'alter session set nls_date_format="YYYY-MM-DD HH24:MI:SS"';
allocate channel ch_1 type disk;
allocate channel ch_2 type disk;
set until time '2012-01-05 14:37:35';
restore database;
recover database;
sql'alter database open resetlogs';
}


---在SQL*Plus环境竟中
select empno,ename from scott.emp

--在sqlplus环境下
delete from scott.emp;
commit;
alter system switch logfile;




exec dbms_logmnr_d.build('e:\orcldata\logminer\director.ora','e:\orcldata\logminer');




exec dbms_logmnr.add_logfile('f:\app\Administrator\oradata\orcl\redo01a.log',dbms_logmnr.new);
exec dbms_logmnr.add_logfile('f:\app\Administrator\oradata\orcl\redo02a.log',dbms_logmnr.new);
exec dbms_logmnr.add_logfile('f:\app\Administrator\oradata\orcl\redo03a.log',dbms_logmnr.new);



exec dbms_logmnr.start_logmnr(dictfilename=>'e:\orcldata\logminer\director.ora');




select scn,sql_redo
from v$logmnr_contents
where seg_name ='EMP';



exec dbms_logmnr.end_logmnr;






---在rman环境下
run
{
allocate channel ch_1 type disk;
allocate channel ch_2 type disk;
set until scn 6501278;
restore database;
recover database;
sql'alter database open resetlogs';
}


--在cmd环境下：
rman target system/1qaz2wsx nocatalog;


--在rman环境下
run{
allocate channel ch_1 type disk;
backup tablespace example,temp
format 'D:\OracleFiles\Backup\%d_%p_%t_%c.dbf';
}


--显示
list backup of tablespace example,temp;

run{
allocate channel ch_1 type disk;
restore tablespace example;
recover tablespace temp;
}

--在SQL*Plus环境下
connect system/1qaz2wsx
create tablespace rman_tbsp datafile 'D:\OracleFiles\Recover\rman_tbsp.dbf' size 2G;


create user rman_user identified by mrsoft default tablespace rman_tbsp temporary tablespace temp;
grant connect,recovery_catalog_owner,resource to rman_user;


//在cmd命令行环境下
rman catalog rman_user/mrsoft target orcl;


//在rman模式下
create catalog tablespace rman_tbsp;
register database;

//--在cmd模式下
rman target system/1qaz2wsx catalog rman_user/mrsoft;



//--在rman模式下
 backup database format 'D:\OracleFiles\Backup\oradb_%Y_%M_%D_%U.bak' maxsetsize 2G;

在rman下
shutdown immediate
startup mount
backup database format = 'D:\OracleFiles\Backup\oradb_%d_%s.bak';
alter database open;

--在cmd环境下：
rman target system/1qaz2wsx nocatalog;


--在rman环境下
run{
allocate channel ch_1 type disk;
backup tablespace tbsp_1,ts_1
format 'D:\OracleFiles\Backup\%d_%p_%t_%c.dbf';
}



RMAN> list backup of tablespace tbsp_1,ts_1;

--在rman环境下
backup datafile 1,2,3 filesperset 3;


list backup of datafile 1,2,3;

--在rman环境下
backup current controlfile;
或
backup tablespace tbsp_1 include current controlfile;



list backup of controlfile;



--在rman命令下：
backup archivelog all delete all input;



list backup of archivelog all;

--在rman环境下
run{
allocate channel ch_1 type disk;
backup incremental level=0
format 'D:\OracleFiles\Backup\oar11g_%m_%d_%c.bak'
tablespace system,sysaux,users;
}

