import java.sql.*;

class Database {
    private List<Table> tables;

    Database (Connection conn) {
	initializeTables(conn);
    }

    private void initializeTables(Connection conn) {
	List<Table> allTables = new LinkedList<Table>();

	ResultSet rs = conn.getMetaData().getTables(null, null, "%", null);

	while (rs.next()) {
	    // The name is in the third column...
	    String name = rs.getString(3);
	    allTables.add(new Table(name, conn));
	}

	tables = allTables;
    }

    private Table getTable(String name) throws Exception {
	for (Table t : tables) {
	    if (t.getName().equals(name))
		return t;
	}

	// If no table was found
	throw new Exception("There's no table called " + name + "!");
    }
 
    public void insert(String tableName, List<String> columnNames, List<String> values) throws Exception {
	getTable(tableName).insert(columnNames, values);
    }

    public void delete(String tableName, String condition) throws Exception {
	getTable(tableName).delete(tableName, condition);
    }
    
    public void update(String tableName, List<String> columnNames, List<String> values, String condition) throws Exception {
	getTable(tableName).update(columnNames, values, condition);
    }

    public ResultSet select(List<String> tableNames, List<String> columnNames, String condition) throws Exception {
	// Check that all names in tableNames are valid
	for (String name : tableNames) {
	    getTable(name);
	}

	return new Table(tableNames, statement).select(columnNames, condition);
    }
}