DECLARE   @X INT
SELECT   @X=1
loving:
    PRINT @X
    SELECT @X=@X+1
WHILE  @X<=3   GOTO   loving
