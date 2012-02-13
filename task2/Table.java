import java.sql.*;

class Table{
    private String name;
    private List<Column> columns;
    private Statement statement;
    private Connection connection;

    public Table(List<String> n, Connection c){
	Table(catList(n," natural join "),c);
    }

    public Table(String n, Connection c) throws Exception {
	name=n;
	connection=c;
	statement=c.createStatement();
	ResultSetMetadata rmd = statement.executeQuery("SELECT * FROM "+name+" LIMIT 1").getMetadata();
	int count=rmd.getColumnCount();
	Column c;
	int t;

	for (int i=0; i<count; i++){   
	    c=rmd.getColumnName(i);
	    t=rmd.getColumnType(i);
	    if (t==Type.VARCHAR){
		columns.add(new Column(c,ColumnType.STRING));
	    }else{
		columns.add(new Column(c,ColumnType.INTEGER));
	    }
	}
    }

    public void update(List<String> cols, List<String> vals, String cond) throws Exception {
	int i;
	if (!checkCondition(cond)){throw new DatabaseException();} 

	//generate query for the prepared statement
	String query="UPDATE TABLE "+name+" SET ";
	for (i=0; i<cols.size(); i++){
	    query+=cols.get(i)+" = ?, ";
	}
	query=query.substring(0,query.length()-2)+" WHERE "+cond+";";

	PreparedStatement stmt=connection.prepareStatement(query);
	insertValuesByColumn(stmt,cols,vals);
	stmt.executeUpdate();
    }

    public void insert(List<String> cols, List<String> vals) throws Exception {
	String query = "INSERT INTO "+name+" ("+catList(cols,",")+") VALUES (?";
	for (int i=1; i<cols.size(); i++){
	    query+=",?";
	}
	query+=");";
	PreparedStatement stmt=connection.prepareStatement(query);
	insertValuesByColumn(stmt,cols,vals);
	stmt.executeUpdate();
    }

    public void remove(String cond) throws Exception {
	if (!checkCondition(cond)){throw new DatabaseException();} 
	statement.executeUpdate("DELETE FROM "+name+" WHERE "+cond);
    }

    public ResultSet select(List<String> cols, String cond) throws Exception {
	if (!checkCondition(cond)){throw new DatabaseException();} 
	List<String> vcols=getValidCols(cols);
	return statement.executeQuery("SELECT "+catList(vcols,",")+" FROM "+name+" WHERE "+cond);
    }

    /* -------------------- GET/SET -------------------- */
    public String getName(){
	return name;
    }

    public List<Columns> getColumns(){
	return columns;
    }

    public Statement getStatement(){
	return statement;
    }

    /* -------------------- PRIVATE -------------------- */

    private void insertValuesByColumn(PreparedStatement stmt, List<String> cols, List<String> vals){
	for (i=0; i<cols.size(); i++){ // throws arrayindexoutofboundsexception
	    Column c=getColumn(cols.get(i));
	    if (c.type==Type.VARCHAR){
		stmt.setString(i+1,vals.get(i));
	    }else{
		stmt.setInt(i+1,Integer.valueOf(vals.get(i)));
	    }
	}
    }

    private List<String> getValidCols(List<String> cols) throws Exception {
	List<String> val=new ArrayList<String>();
	for (String x:cols){
	    val.add(getColumn(x).name);
	}
	return val;
    }

    private void addColumn(Column c){
	for (Column x:columns){
	    if (x.name.equals(c.name)){
		return;
	    }
	}
	columns.add(c);
    }

    private String catList(List<String> l, String delim){
	String r="";
	for (String x:l){
	    r+=x+delim;
	}
	return r.substring(0,r.length()-delim.length());
    }

    private Column getColumn(String n) throws Exception {
	for (Column c:columns){
	    if (c.name.equals(n)){
		return c;
	    }
	}
	throw new DatabaseException();
    }

    private boolean checkCondition(String c){
	return c.matches("[[a-z|0-9].+?[<|>|=|<=|>=][a-z|0-9].+?][AND|OR]].+");
    }
}