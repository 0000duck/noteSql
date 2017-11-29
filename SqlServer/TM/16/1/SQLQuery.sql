use master
select * from master..sysdatabases D
where sid not in(select sid from master..syslogins where name='sa')
