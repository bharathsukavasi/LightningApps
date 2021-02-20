@isTest 
public class SalesTerritoryBatchtest {
 static testMethod void testMethod1() 
    {
                   
        Test.startTest();

            SalesTerritoryBatch obj = new SalesTerritoryBatch();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}