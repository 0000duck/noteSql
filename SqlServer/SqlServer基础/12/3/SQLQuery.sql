USE master;
GO
CREATE LOGIN mr WITH PASSWORD = 'mrsoft' MUST_CHANGE,
    CHECK_EXPIRATION = ON;
GO
GRANT VIEW SERVER STATE TO mr;
GO
CREATE TRIGGER connection_limit_trigger
ON ALL SERVER WITH EXECUTE AS 'mr'
FOR LOGON
AS
BEGIN
IF ORIGINAL_LOGIN()= 'mr' AND
    (SELECT COUNT(*) FROM sys.dm_exec_sessions
            WHERE is_user_process = 1 AND
                original_login_name = 'mr') > 1
    ROLLBACK;
END;
