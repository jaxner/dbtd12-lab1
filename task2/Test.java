public class Test extends Interface{

    public static void main(String[] args){
        new Test().run();
    }

    @Override
    public void insert(){

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
