create database mrkj
on 
(name=mrdat,
filename='G:\sql\mrkj.mdf',
size=10,
maxsize=100,
filegrowth=5)
log on
(name='mingrilog',
filename='G:\sql\mrkj.ldf',
size=8mb,
maxsize=50mb,
filegrowth=8mb )
