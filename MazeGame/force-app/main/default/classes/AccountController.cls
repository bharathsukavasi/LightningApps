public class AccountController {
@AuraEnabled
    public static List<Account> FetchAccounts(string Name, string property){
        List<Account> AccList = New List<Account>();
        string query;
        if(string.isBlank(Name)){             
        	 query = 'Select Id, Name, Active__c FROM Account ORDER BY ' + property+  ' ASC';
        }
        else{
            string nameFilter = '%' + Name +'%';
        	 query = 'Select Id, Name, Active__c FROM Account WHERE '+ property+ ' like :nameFilter ORDER BY '+ property+ ' ASC';
        }
       
        AccList = Database.query(query);
        return AccList;       
    }
}