# My pet hate is the DBO is set not to a service account or SA but a user account that might be disabled or removed for whatever the reason

SELECT name,
	suser_sname(owner_sid) as DBO,
       DATABASEPROPERTYEX(name, 'Recovery') as recoveryMode, 
       DATABASEPROPERTYEX(name, 'Status') 
FROM   master.sys.databases
