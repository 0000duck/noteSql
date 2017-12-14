USE db_2012
declare @songname   nchar(10)
select  @songname=Name from  tb_Student  where Spe='»á¼ÆÑ§'
print   @songname
