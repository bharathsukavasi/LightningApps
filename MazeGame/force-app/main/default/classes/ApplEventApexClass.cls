public class ApplEventApexClass {
@AuraEnabled
    public static Account findAccount(String aName){
        Account acc= [SELECT Id,Name,Phone,Industry from Account where name=:aName];
        return acc;
            
    }
@AuraEnabled
    public static Contact findAccount(Id acntId){
        Contact con= [SELECT Id,FirstName,Phone,LastName from Contact where accountId=:acntId];
        return con;
            
    }
}