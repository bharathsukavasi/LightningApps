public class CustomMetadata {
    public static void ChangeMetadata(){
        List<ERP_Setting__mdt> settings = [select MasterLabel, Endpoint__c from ERP_Setting__mdt];
        system.debug(settings);
        
        
        CountryCode__c setting = CountryCode__c.getInstance('India');
        setting.code__c = 'IND';
        update setting;
        
    }
    
    public static List<Account> UniqueRecords(){
        List<Account> accList = new List<Account>();
        AccList.add(New Account(Name='Demo Account1'));
        AccList.add(New Account(Name='Demo Account2'));
        AccList.add(New Account(Name='Demo Account2'));
        AccList.add(New Account(Name='Demo Account3'));
        AccList.add(New Account(Name='Demo Account3'));
        
        set<Account> UniqueAccs = new set<Account>();
        UniqueAccs.addAll(accList);
        system.debug(UniqueAccs);
        List<Account> uniqueaccList = new List<Account>();
        uniqueaccList.addAll(UniqueAccs);
        //UniqueAccs.remove(New Account(Name='Demo Account1'));
        return uniqueaccList;
        
    }
    
    public static void callUniquemethods(){
        List<Account> uniqueAccs = UniqueRecords();
        system.debug(uniqueAccs);
    }
    
    public static void rollupsummaryquery(){
        AggregateResult[] AccConList = [select Count(Id)contacts, accountId from contact group by accountId];
        for(AggregateResult ar:AccConList ){
            system.debug('Account:' + ar.get('accountId'));
            system.debug('Contacts:' + ar.get('contacts'));
        }
    }
}