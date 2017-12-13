# Shrink DB files
# Update [your_db_name] 

ALTER DATABASE [your_db_name] 
SET RECOVERY SIMPLE;
CHECKPOINT;

-- shrink the log file to 200MB
DBCC SHRINKFILE (your_db_name_log,200);
--- define the initial size to 200MB as well.. CHANGE it as per your needs!
ALTER DATABASE [your_db_name]
MODIFY FILE (NAME=your_db_name_LOGICAL_log,SIZE=200MB,MAXSIZE=UNLIMITED,FILEGROWTH=100MB);
--Optional if you want the database in full recovery mode 
--for point in time recovery going forward
ALTER DATABASE [your_db_name] 
SET RECOVERY FULL;
--- Take full backup to establish log chain
-- take log backups to help truncate the log file and keep it manageable
