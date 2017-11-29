use db_2012
if exists(select name from sysobjects  where name ='encrypt_this' and type='p')
 drop procedure encrypt_this
GO
create procedure encrypt_this
with encryption
as
  select * from authors
GO
exec sp_helptext encrypt_this