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

    private Table getTable(String name) throws Exception {
	for (Table t : tables) {
	    if (t.getName().equals(name))
		return t;
	}

	// If no table was found
	throw new Exception("There's no table called " + name + "!");
    }
 
    public void insert(String table, List<String> columns, List<String> values) {
	// to-do
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
}