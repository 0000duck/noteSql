declare  @n int,@sum int
set @n=1
set @sum=0
while @n<=10
begin
set @sum=@sum+@n
set @n=@n+1
end
print @sum
