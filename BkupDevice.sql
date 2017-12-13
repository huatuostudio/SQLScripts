# Creates a logical Backup device for storedproc usage
# Need to modify: @logicalname and @physicalname

USE [master]
GO

EXEC master.dbo.sp_addumpdevice  @devtype = N'disk', @logicalname = N'input-the-backup-device-name-here', @physicalname = N'X:\MyBackUps\mydatabase_log.trn'
GO
