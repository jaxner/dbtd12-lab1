import java.sql.*;

class Database {
    private Statement statement;
    private List<Table> tables;

    Database (Statement st) {
	statement = st;
	initializeTables();
    }

    private void initializeTables() {
	List<Table> allTables = new LinkedList<Table>();

	DatabaseMetaData md = statement.getConnection().getMetaData();
	ResultSet        rs = md.getTables(null, null, "%", null);

	while (rs.next()) {
	    // The name is in the third column...
	    String name = rs.getString(3);
	    allTables.add(new Table(name, statement));
	}

	tables = allTables;
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