SELECT
D.name,
F.Name AS FileType,
CAST((F.size*8)/1024 AS VARCHAR(26)) AS FileSizeMB,
CAST((F.size*8)/1024/1024 AS VARCHAR(26)) AS FileSizeGB,
F.physical_name AS PhysicalFile,
F.state_desc AS OnlineStatus
 
FROM 
sys.master_files F
INNER JOIN sys.databases D ON D.database_id = F.database_id
ORDER BY D.name
