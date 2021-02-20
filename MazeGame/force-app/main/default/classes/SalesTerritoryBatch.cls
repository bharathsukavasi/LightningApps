public class SalesTerritoryBatch implements Database.Batchable<Sales_Territories__c> , Database.AllowsCallouts {
    public Iterable<Sales_Territories__c> start(Database.BatchableContext bc) {
        
        System.debug('SalesTerritoryList Batch Started: ');
        List<Sales_Territories__c> SalesTerritoryList=new List<Sales_Territories__c>();
        HttpResponse response=  SalesTerritorySync.getSalesTerritoryData();
        SalesTerritoryWrapper ResponseWrapper=  SalesTerritoryWrapper.parse( response.getBody());
        if((ResponseWrapper.dataOut.SalesTerritory!=null) && (!ResponseWrapper.dataout.SalesTerritory.isEmpty())) {
            
            for(SalesTerritoryWrapper.SalesTerritory territory:ResponseWrapper.dataOut.SalesTerritory){
                SalesTerritoryList.add(new Sales_Territories__c(
                    INT_External_ID__c=territory.ErpID,Name=territory.TerritoryID,TerritoryDescription__c=territory.TerritoryDesc)
                                      );
            }
            
        }
        
        System.debug('SalesTerritoryList: ' +SalesTerritoryList);
        return SalesTerritoryList;
        
    }
    Public void execute(Database.BatchableContext bc, List<Sales_Territories__c> scope){
        String batchJobID=bc.getJobId();
        try {
            If(scope.size()>0){
                
                Schema.SObjectField externalID = Sales_Territories__c.Fields.INT_External_ID__c;
               Database.UpsertResult[] srList = Database.upsert(scope,externalID,false);
               // upsert scope INT_External_ID__c;
               for (Database.UpsertResult sr : srList) {
                    if (sr.isSuccess()) {
                        // Operation was successful
                       System.debug('Id : ' +sr.id+'Created: '+sr.isCreated());
                    }
                    else {
                        // Operation failed, so get all errors                
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('error has occurred.' + 'getStatusCode- '+ err.getStatusCode() + ': getMessage- ' + err.getMessage());                    
                            System.debug('fields that affected this error: getFields -' + err.getFields());
                        
                        }
 
                       
                    } 
                }
            }
            
            
        } catch (Exception e) {
                                        System.debug('Exception'+e.getMessage()); 
      
        }
    }
    public  void finish(Database.BatchableContext bc){
    }
}