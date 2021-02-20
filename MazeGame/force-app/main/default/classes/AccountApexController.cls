public class AccountApexController {

    @AuraEnabled
    public static account getAccountInfo(Id accountId)
    {
        return [Select Id,Name,Phone,website,	Description,	Industry,	Type from account where id=:accountId];
    }
    
    @AuraEnabled
    public static List<Account> getAccounts(Id accountId)
    {
        return [Select Id,Name,Phone,website,	Description,	Industry,	Type from account];
    }
}