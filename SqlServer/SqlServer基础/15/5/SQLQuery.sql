BEGIN TRANSACTION 
UPDATE Employee SET Name = '章子婷'
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED     --设置未提交读隔离级别
COMMIT TRANSACTION
SELECT * FROM Employee
