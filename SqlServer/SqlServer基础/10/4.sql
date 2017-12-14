create view view5
as 
select ID,Name,Age from Employee where Age>10 
WITH CHECK OPTION
go
insert into view5 (ID,Age,Name)values(11,8,'Peter')

