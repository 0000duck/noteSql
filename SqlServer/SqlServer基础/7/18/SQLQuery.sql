

 
DECLARE @mysqrt float
SET @mysqrt = 1.00
WHILE @mysqrt < 10.00
BEGIN
  SELECT SQRT(@mysqrt)
  SELECT @mysqrt = @mysqrt + 1
END




