public class BeerSearchAuraService {
@AuraEnabled
    public static List<sObject> searchBeers(String searchParam){
        If (searchParam != null){
        String likeParam='%'+searchParam+'%';
        String query='SELECT Id,Name, Alcohol__c, brewery_Id__c,  brewery_Name__c,  Price__c, Remaining_Quantity__c, Tags__c, Total_Quantity__c FROM Beer__c  where Name like:likeParam LIMIT 10';
        List<SObject> sObjectList=Database.query(query);
        return sObjectList;
        }
        else{
            String query='SELECT Id,Name, Alcohol__c, brewery_Id__c,  brewery_Name__c,  Price__c, Remaining_Quantity__c, Tags__c, Total_Quantity__c FROM Beer__c  LIMIT 20';
        List<SObject> sObjectList=Database.query(query);
        return sObjectList; 
        }
    }
}