


DECLARE @position int, @string char(3)
SET @position = 1
SET @string = 'NXT'
WHILE @position <= DATALENGTH(@string)
   BEGIN
   SELECT ASCII(SUBSTRING(@string, @position, 1)) AS ASCIIÖµ,
      CHAR(ASCII(SUBSTRING(@string, @position, 1))) AS ×Ö·û
    SET @position = @position + 1
   END
 





 
