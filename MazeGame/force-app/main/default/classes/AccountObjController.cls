public class AccountObjController {
@AuraEnabled
    public static List<Account> getaccounts(){
        List<Account> Acc=[SELECT Id,Name FROM Account];
        return acc;
        
    }
    
    
}