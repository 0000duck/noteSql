declare  @x int,  @y int,@t int 
set @x=1
set @y=2
begin 
set @t=@x
set @x=@y
set @y=@t
end
print @x
print @y
