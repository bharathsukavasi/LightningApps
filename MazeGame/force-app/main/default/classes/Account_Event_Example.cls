public class Account_Event_Example {
@AuraEnabled
    public static ID mysearch(String phone){
        Contact con=[SELECT id,accountId from contact where phone=:phone];
        return con.AccountId;
    }
    
    @AuraEnabled
    public static String conCreate(String fname,String lname, Id AccountID){
        String status;
        try{
            Contact con=new Contact();
            con.FirstName=fname;
            con.LastName=lname;
            con.AccountId=AccountID;
            insert con;
            status='Record Inserted';
            
        }
        catch(Exception e){
            status='Error Occured';
        }
        return status;
    }
}