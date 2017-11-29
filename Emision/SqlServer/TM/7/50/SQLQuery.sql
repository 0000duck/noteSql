SELECT tb1.销售员,tb1.销售额 AS 最高销售额
from ( SELECT 销售员,SUM(销售额) AS 销售额 
       FROM tb_Seller
       WHERE MONTH(日期)='12'
       GROUP BY 销售员
     )AS tb1
WHERE tb1.销售额 = ( SELECT  MAX(销售额) AS 最高销售额
                        FROM  
                             ( SELECT 销售员,SUM(销售额) AS 销售额 
                               FROM tb_Seller
                               WHERE MONTH(日期)='12'
                               GROUP BY 销售员
                             )AS tb1
                   )
