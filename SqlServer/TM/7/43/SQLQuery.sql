





SELECT 
   GETDATE() AS UnconvertedText,
   CAST(GETDATE() AS datetime) AS UsingCast,
   CONVERT(datetime, GETDATE(), 126) AS UsingConvertFrom_ISO8601 ;
GO
 

 


