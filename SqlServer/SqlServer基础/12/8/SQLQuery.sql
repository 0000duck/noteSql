ALTER TRIGGER connection_limit_trigger
ON ALL SERVER WITH EXECUTE AS 'nxt'
FOR LOGON
AS
BEGIN
IF ORIGINAL_LOGIN()= 'nxt' AND
    (SELECT COUNT(*) FROM sys.dm_exec_sessions
            WHERE is_user_process = 1 AND
                original_login_name = 'nxt') > 3
    ROLLBACK;
END;
