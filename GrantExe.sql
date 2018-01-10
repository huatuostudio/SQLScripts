Use [DBNAME]
Go

# Grant all to user
GRANT EXECUTE TO [userName] 

# Or, grant user to stored proc
GRANT EXECUTE ON [storedProcName] TO [userName] 

# Or, grant user to schema
GRANT EXECUTE/INSERT/UPDATE/DELETE ON SCHEMA::[schemaName] TO [userName] 
