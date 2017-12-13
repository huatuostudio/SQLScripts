# Performance tuning

SELECT a.io_stall, a.io_stall_read_ms, a.io_stall_write_ms, a.num_of_reads,
a.num_of_writes,
--a.sample_ms, a.num_of_bytes_read, a.num_of_bytes_written, a.io_stall_write_ms,
(( a.size_on_disk_bytes / 1024 ) / 1024.0 ) AS size_on_disk_mb,
db_name(a.database_id) AS dbname,
b.name, a.file_id,
db_file_type = CASE 
WHEN a.file_id = 2 THEN 'Log'
ELSE 'Data'
END,
UPPER(SUBSTRING(b.physical_name, 1, 2)) AS disk_location
FROM sys.dm_io_virtual_file_stats (NULL, NULL) a
JOIN sys.master_files b ON a.file_id = b.file_id
AND a.database_id = b.database_id
ORDER BY a.io_stall DESC

SELECT DB_NAME(database_id) AS [Database Name], 
file_id, 
io_stall_read_ms, 
num_of_reads, 
CAST(io_stall_read_ms / ( 1.0 + num_of_reads ) AS NUMERIC(10, 1)) AS [avg_read_stall_ms], 
io_stall_write_ms,
num_of_writes,
CAST(io_stall_write_ms / ( 1.0 + num_of_writes ) AS NUMERIC(10, 1)) AS [avg_write_stall_ms], 
io_stall_read_ms + io_stall_write_ms AS [io_stalls] , num_of_reads + num_of_writes AS [total_io], 
CAST(( io_stall_read_ms + io_stall_write_ms ) / ( 1.0 + num_of_reads + num_of_writes) AS NUMERIC(10,1)) AS [avg_io_stall_ms]
FROM sys.dm_io_virtual_file_stats(NULL, NULL)ORDER BY avg_io_stall_ms DESC
