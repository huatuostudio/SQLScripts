# Temp DB should shrink when instance is restarted, if not, use the GUI :), if not, use:
# Only error I can think of is that the Name for Temp DB is different from the default, there must have been a good reason for renaming the Temp DB fils, else I don't know why would anyone bother to change them.

ALTER DATABASE tempdb MODIFY FILE
  (NAME = 'tempdev', SIZE = target_size_in_MB) 
    --Desired target size for the data file
   
ALTER DATABASE tempdb MODIFY FILE
    (NAME = 'templog', SIZE = target_size_in_MB)
   --Desired target size for the log file
