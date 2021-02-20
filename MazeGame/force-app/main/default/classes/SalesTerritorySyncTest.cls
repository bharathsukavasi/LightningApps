@istest
public class SalesTerritorySyncTest {
    @isTest static void testCalloutSuccess() {
        Test.startTest();        
        // Set mock callout class with Success Case
        Test.setMock(HttpCalloutMock.class, new MockHttpResponse_SalesTerritory(true));
        
        // Call method to test.
        HttpResponse res = SalesTerritorySync.getSalesTerritoryData();
        
        // Verify response received contains fake values
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        String expectedValue = '{ "dataOut": { "SalesTerritory": [ { "ErpID": "YMRD01-BRAZ1", "TerritoryID": "BRAZ1", "TerritoryDesc": "Updated Brazil 1: Lima" }, { "ErpID": "YMRD01-BRAZ2", "TerritoryID": "BRAZ2", "TerritoryDesc": "Updated Brazil 2: Freitas" } ] } }';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
        Test.stoptest();
        
    }
    @isTest static void testCalloutFailure() {
        Test.startTest();        
         // Set mock callout class with Failure case
        Test.setMock(HttpCalloutMock.class, new MockHttpResponse_SalesTerritory(false));
        
        // Call method to test.
        HttpResponse res = SalesTerritorySync.getSalesTerritoryData();
        System.assertNotEquals(200, res.getStatusCode());        
        Test.stoptest();
    }
    
}