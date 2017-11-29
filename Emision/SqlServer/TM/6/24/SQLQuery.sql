use  db_2012
declare @courses  char(10)
select @courses=Subjet from  tb_Grade
print  @courses
