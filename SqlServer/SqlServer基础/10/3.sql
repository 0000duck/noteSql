USE db_2012
GO
CREATE VIEW view3
AS
SELECT * FROM Employee1
GO
INSERT INTO view3(ID,Name)
VALUES(7,'¡ı¿Ú')
GO
INSERT INTO view3(ID,Name,Sex)
VALUES(8,'’≈“ª','ƒ–')