@isTest
public class MockHttpResponse_SalesTerritory implements HttpCalloutMock {
    Boolean  isMockResponseSuccessful;  // set by constructor, used to vary the mockresponse
    
    public MockHttpResponse_SalesTerritory(Boolean isMockResponseSuccessful) {
        this.isMockResponseSuccessful  = isMockResponseSuccessful;
    }
    // Implement this interface method
    public HTTPResponse respond(HTTPRequest req) {
        
        
        // Optionally, only send a mock response for a specific endpoint
        // and method.;
        //  String Calloutname = 'callout:Sales_Territory_Sync_ERP_to_SF'
        System.assertEquals('callout:Sales_Territory_Sync_ERP_to_SF', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        if (this.isMockResponseSuccessful) {
            
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{ "dataOut": { "SalesTerritory": [ { "ErpID": "YMRD01-BRAZ1", "TerritoryID": "BRAZ1", "TerritoryDesc": "Updated Brazil 1: Lima" }, { "ErpID": "YMRD01-BRAZ2", "TerritoryID": "BRAZ2", "TerritoryDesc": "Updated Brazil 2: Freitas" } ] } }');
            res.setStatusCode(200);
        }
        else {
            res.setStatusCode(400);
            res.setStatus('Bad request');            
        }
        return res;
    }
}