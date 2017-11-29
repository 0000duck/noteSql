declare @x int,@sum int
set @x=1
set @sum=0
while @x<10
begin
set @x=@x+1
if @x%2=0
set @sum=@sum+@x
else
continue
end 
print @sum
