public class Test extends Interface{

    public static void main(String[] args){
        new Test().run();
    }

    @Override
    public void insert(){
        String table_name = getStringPrompt("Which table?");
        String columns = getStringPrompt("Which columns?");
        String values = getStringPrompt("Which values?");
        String query = "INSERT INTO "+ table_name
            + " (" + columns + ") VALUES (" + values + ");";

        System.out.println("Executing query: " + query);

        try {
            getStatement().executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("Invalid syntax!");
            System.out.println(e);
        }
    }

    @Override
    public void update(){

    }

    @Override
    public void remove(){

    }
    
    @Override
    public void select() {
        /*
         * TODO:
         * Modify the select version in Interface.java so that it uses
         * transactions
         */
        super.select();
    }
}
