public class SaveAccountContact {
@AuraEnabled
    public static ID saveAccount(String name,String rating){
            Account acnt=new Account();
            acnt.Name=name;
         //   acnt.Rating=rating;
            insert acnt;
            return acnt.Id;
            
    }
@AuraEnabled
    public static ID saveContact(String fname,String lname,ID acntId){
            Contact con=new Contact();
            con.AccountId=acntId;
        con.FirstName=fname;
        con.LastName=lname;
            insert con;
            return con.Id;
            
    }
}