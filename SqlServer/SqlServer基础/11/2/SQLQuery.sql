Create Procedure Proc_Student
@Proc_Sno int
as
select * from Student where Sno = @Proc_Sno
