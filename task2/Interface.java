import java.util.Scanner;
import java.sql.*;
/**
 * Simple program to provide a basic GUI to a database.
 * This shell limits the powerful SQL language into a few different states.
 * These states are deletion, insertion, updating and selection.
 * Some freedom in the SQL language is retained if filters is supplied.
 * @author tokko
 *
 */
public abstract class Interface{
    //TODO: Insert proper information
    private static final String HOST = "nestor2.csc.kth.se";
    private static final Scanner sc = new Scanner(System.in);
    private Connection conn;
    private Statement st;
    private ResultSet rs;

    public Interface() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://"+HOST+"/"+getStringPrompt("Database"), getStringPrompt("Username"), getStringPrompt("Password"));
            st = conn.createStatement();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    protected void finalize() throws Throwable {
        try {
            conn.close();
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        super.finalize();
    }
    /**
     * Prints a menu used for navigation.
     * @return Returns the choice of the user as an Integer.
     */
    protected int getChoice(){
        System.out.println("1. update");
        System.out.println("2. insert");
        System.out.println("3. remove");
        System.out.println("4. select");
        System.out.println("5. exit");
        return getIntPrompt(">");
    }

    /**
     * This method diverts control through the program.
     * Depending on the return of printMenu control will be sent to the proper method.
     */
    protected void run(){
        while(true){
            switch(getChoice()){
            case 1: update(); break;
            case 2: insert(); break;
            case 3: remove(); break;
            case 4: select(); break;
            case 5: sc.close(); System.exit(0);
            }
        }
    }
    /**
     * select is used to select tuples from the database.
     * It will query the user about the information needed to identify tuples.
     * If the filter field is blank, no filter will be used.
     * If any of the other fields are left blank, the application may crash.
     */
    public void select() {
        //Args will be used to format a query.
        String[] args = new String[3];
        args[0] = getStringPrompt("Which table(s)?");
        args[1] = getStringPrompt("Which attribute(s)?");
        args[2] = getStringPrompt("Which filter?");
        /*
         * Converting an array of tables into a JOIN-statement.
         * EXAMPLE:
         * ["tokko", "is", "awesome"] => "tokko natural join is natural join awesome"
         */
        args[0] = args[0].replace(", ", " NATURAL JOIN "); //creating the natural join clause
        args[0] = args[0].replace(",", " NATURAL JOIN "); //with a bunch of common comma-styles
        args[0] = args[0].replace(" ,", " NATURAL JOIN "); //to allow some leeway in syntax
        args[0] = args[0].replace(" , ", " NATURAL JOIN "); //not really necessary.
        /*
         * attempt to execute the query, retrieve and print the result.
         * the result is stored in a ResultSet.
         * To make the ResultSet more manageable one can retrieve a ResultSetMetaData object.
         */
        try {
            String query = "SELECT "+args[1]+" FROM " + args[0] + (args[2].trim().equals("")?"":" WHERE "+args[2])+";";
            rs = st.executeQuery(query);
            if(rs != null){
                while(rs.next()){
                    for (int i = 1; true; i++) {
                        try{
                            if(i > 1)
                                System.out.print(", ");
                            System.out.print(rs.getString(i));
                            //If there are no more strings, break
                        }catch(SQLException c){break;}
                    }
                    System.out.println();
                }
            }
            rs.close();
        } catch (SQLException e) {
            System.err.println("Invalid syntax. Try again.");
            select();
        }
    }

    /**
     * remove removes tuples from the database.
     * It will query the user for the information needed to identify tuples to be removed.
     * If the filter field is left blank, no filter will be used.
     * If any other fields are left blank, the application may crash.
     */
    abstract void remove();

    /**
     * insert will insert tuples into the database.
     * It will query the user for the information needed to create a tuple.
     */
    abstract void insert();

    /**
     * update will update a tuple in the database.
     * It will query the user for the information needed to identify and update a tuple.
     * If the filter field is left blank, no filter will be used.
     * If any other field is left blank, the application may crash.
     */
    abstract void update();

    /**
     * format is kin to printf of C.
     * format is limited to only formatting Strings into a String.
     * The first occurrence of '%s' in the format string will be replaced
     * by the first element in params. The second occurrence by the second element and so forth.
     * If there are more format strings than elements in args, the application will crash.
     * If there are more elements than there are format strings, the redundant elements will be ignored.
     * Students are not required to study this code.
     * @param format, the format string. EXAMPLE: "I like %s!"
     * @param params, the parameters. EXAMPLE: {"pies"}
     * @return the formatted string. EXAMPLE "I like pies!"
     */
    protected String format(String format, String[] params){
        StringBuilder sb = new StringBuilder();
        int cur = 0;
        char[] c = format.toCharArray();
        try{
            for (int i = 0; i < c.length; i++) {
                if(c[i++] == '%'){
                    sb.append(params[cur++]);
                }
                else
                    sb.append(c[i]);
            }
        }catch(IndexOutOfBoundsException e){
            System.err.println("Not enough params supplied to format string. Element " + (cur+1) + " has no corresponding element");
            e.printStackTrace();
        }
        return sb.toString().trim();
    }
    /**
     * getStringPrompt prints prompt to stdout without newline and returns the next line of input to stdin.
     * @param prompt. EXAMPLE: "What is your name?"
     * @return EXAMPLE: "Tokko"
     */
    protected String getStringPrompt(String prompt){
        System.out.print(prompt + ": ");
        return sc.nextLine().trim();
    }

    /**
     * As getStringPrompt but returns an Integer.
     * If the user does not input an Integer, it will reprompt until the user
     * stops being stupid and submits an Integer.
     * Students is not required to study this code (though it is simple and should not strain your mental faculties.)
     * @param prompt
     * @return
     */
    protected Integer getIntPrompt(String prompt){
        int ret = 0;
        while(true){
            System.out.print(prompt + ": ");
            String res = sc.nextLine().trim();
            try{
                ret = Integer.parseInt(res);
                break;
            }catch(NumberFormatException e){
                System.out.println("Invalid input. Digit required");
            }
        }
        return ret;
    }

    /**
     * Retrieves the Statement object associated with the current
     * Connection. 
     *
     * This is used to execute SQL statements on the connected
     * database.
     *
     * @return a Statement object with a connection to a database
     */
    protected Statement getStatement() {
        return st;
    }
}
