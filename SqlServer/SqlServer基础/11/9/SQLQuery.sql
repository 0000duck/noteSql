use db_2012
GO
--判断pro_pro16存储过程是否存在，如果存在将它删除
if exists(select name from sysobjects 
where name='pro_pro16'and type='p')
  drop proc pro_pro16  --删除存储过程
GO
create procedure pro_pro16
as
declare @truc int
select @truc=@@trancount
if @truc=0
begin tran p1
else
save tran pl
if (@truc=2)
begin
rollback tran pl
return 25
end
if(@truc=0)
commit tran pl
return 0
