col tablespace_name for a10
col file_name for a50
col bytes for 999,999,999
select tablespace_name,file_name,bytes from dba_data_files order by tablespace_name;

alter tablespace users drop datafile 'e:\app\Administrator\oradata\orcl\users02.dbf';

create undo tablespace undo_tbs_1
datafile 'D:\OracleFiles\OracleData\undotbs1.dbf'
size100M;

alter tablespace undo_tbs_1 
add datafile 'D:\OracleFiles\OracleData\undotbs_add.dbf' 
size 2g;

select to_char(begin_time,'hh24:mi:ss') as 开始时间,
to_char(end_time,'hh24:mi:ss') as 结束时,
undoblks as 回退块数
from v$undostat
order by begin_time;

select rn.name,rs.xacts,rs.writes,rs.extents
from v$rollname rn,v$rollstat rs
where rn.usn = rs.usn;

select segment_name, extent_id,bytes,status from dba_undo_extents
where segment_name='_SYSSMU3_991555123$';

create temporary tablespace temp_01 tempfile 'D:\OracleFiles\tempfiles\temp_01.tpf' size 300m;

select file_name,bytes,tablespace_name from dba_temp_files;

create temporary tablespace tp1 tempfile 'D:\OracleFiles\tempfiles\tp1.tpf' size 10m tablespace group group1;
create temporary tablespace tp2 tempfile 'D:\OracleFiles\tempfiles\tp2.tpf' size 20m tablespace group group1;

create temporary tablespace tp3 tempfile 'D:\OracleFiles\tempfiles\tp3.tpf' size 10m tablespace group group3;
alter tablespace tp1 tablespace group group3;

col owner for a10;
col segment_name for a30;
col segment_type for a20;
select segment_type,segment_name,owner from dba_segments where tablespace_name='USERS';

create tablespace tbs_test datafile 'D:\OracleFiles\OracleData\datafile_test.dbf'
size 100m
extent management local autoallocate
segment space management auto;

alter database default tablespace tbs_test;

create temporary tablespace temp_test tempfile 'D:\OracleFiles\tempfiles\temp_test.tpf' size 100m;

alter database default temporary tablespace temp_test;

create tablespace tbs_test_1 datafile 'D:\OracleFiles\OracleData\datafile1.dbf'
size 10m
extent management local uniform size 256K;

create tablespace tbs_test_2 datafile 'D:\OracleFiles\OracleData\datafile2.dbf'
size 10m
extent management local autoallocate;

create tablespace tbs_test_3 datafile 'D:\OracleFiles\OracleData\datafile3.dbf'
size 20m
extent management local autoallocate
segment space management manual;

create tablespace tbs_test_4 datafile 'D:\OracleFiles\OracleData\datafile4.dbf'
size 20m
extent management local autoallocate
segment space management auto;

alter system set db_16k_cache_size = 16M scope=both;
create tablespace tbs_test_5 datafile 'D:\OracleFiles\OracleData\datafile5.dbf'
size 64m reuse
autoextend on next 4m maxsize unlimited
blocksize 16k
extent management local autoallocate
segment space management auto;

create bigfile tablespace tbs_test_big datafile 'D:\OracleFiles\OracleData\datafilebig.dbf'
size 2g;

alter tablespace users add datafile 'e:\app\Administrator\oradata\orcl\users02.dbf'
size 10m autoextend on next 5m maxsize unlimited;

