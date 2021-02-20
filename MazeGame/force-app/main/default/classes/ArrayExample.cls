public class ArrayExample {
    public Account[] myval{set;get;}
    public ArrayExample(){
        Account a1=new Account(name='Sai',Industry='Banking');
        Account a2=new Account(name='Sai',Industry='Banking');
        Account a3=new Account(name='Sai',Industry='Banking');
        myval=new Account[]{a1,a2,a3};
    }
}