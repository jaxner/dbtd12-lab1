class Column{
    public String name;
    public ColumnType type;

    public Column(String n, ColumnType t){
	name=n;
	type=t;
    }
}
enum ColumnType{STRING,INTEGER}