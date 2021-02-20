public class ArrayExp1 {
    public String[] myval{set;get;}
    public String name{get;set;}
    public Account[] myval2{set;get;}
    public ArrayExp1()
    {
        name='Prasad';
        myval=new String[]{'Sam','Ram','Kiran'};
            Account a1=new Account(name='Mani',Industry='Banking');
            Account a2=new Account(name='Ravi',Industry='IT');
            Account a3=new Account(name='Josh',Industry='Financial');
        myval2=new Account[]{a1,a2,a3};
    }
}