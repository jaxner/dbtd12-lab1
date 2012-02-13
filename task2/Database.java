import java.sql.*;

class Database {
    private Statement statement;
    List<Table> tables;

    Database (Statement st) {
	statement = st;
    }
    
    public void insert(String table, List<String> columns, List<String> values) {
	if tableExists(table) {
		// empty	
	    }
    }

    public void delete(String table, String condition) {
	// to-do
    }
    
    public void update(String table, List<String> columns, List<String> values, String condition) {
	// to-do
    }

    public ResultSet select(List<String> tables, List<String> columns, String condition) {
	// to-do
    }

    // -------------------- PRIVATE --------------------

    private boolean tableExists(String tableName) {
	// to-do
    }

}