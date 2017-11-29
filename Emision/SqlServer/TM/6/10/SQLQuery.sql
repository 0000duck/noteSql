declare  @x int,@y int
set @x=8
set @y=-3
if @x>0
  if @y>0 
    print'@x@y位于第一象限'
  else 
    print'@x@y位于第四象限'
else 
  if @y>0
    print'@x@y位于第二象限'
  else 
    print'@x@y位于第三象限'
