USE db_2012
SELECT ID,NAME FROM SYSINDEXES
WHERE ID=(SELECT ID FROM 
SYSOBJECTS WHERE NAME ='Student')

