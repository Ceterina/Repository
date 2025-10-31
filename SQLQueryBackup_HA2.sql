-- ===========================
-- Backup Database Template
-- ===========================
BACKUP DATABASE WebStore1  
  TO  DISK = N'D:\MySQLServer2022\MSSQL16.SQLEXPRESS\MSSQL\Backup\WeStore1.bak' 
WITH 
  NOFORMAT, 
--  COMPRESSION,
  NOINIT,  
    NAME = N'WebStore1 - Full Database Backup', 
  SKIP, 
  STATS = 10;
GO

--BACKUP DATABASE WebStore1
--TO DISK = N'D:\MySQLServer2022\MSSQL16.SQLEXPRESS\MSSQL\Backup\WeStore1.bak'
--WITH NAME = N'WebStore1 - Full Database Backup';
--GO