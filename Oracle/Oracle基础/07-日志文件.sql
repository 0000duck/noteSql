 alter database add logfile
('D:\OracleFiles\LogFiles\REDO4_A.LOG',
'E:\OracleFiles\LogFiles\REDO4_B.LOG')
size 20M;

alter database add logfile group 5
('D:\OracleFiles\LogFiles\REDO5_A.LOG',
'E:\OracleFiles\LogFiles\REDO5_B.LOG')
size 20M;

alter database add logfile member
'E:\OracleFiles\LogFiles\REDO4_C.LOG' to group 4;

alter database add logfile member
'D:\OracleFiles\LogFiles\REDO1_new.LOG' to 
('E:\app\Administrator\oradata\orcl\REDO01.LOG') ;

alter database drop logfile member 'E:\OracleFiles\LogFiles\REDO4_C.LOG';


alter database drop logfile group 5;

alter database add logfile
('D:\OracleFiles\LogFiles\REDO4_A.LOG',
'E:\OracleFiles\LogFiles\REDO4_B.LOG',
'F:\OracleFiles\LogFiles\REDO4_C.LOG'
)
size 100M;