public with sharing class SalesTerritorySync {
    
    public static HttpResponse getSalesTerritoryData(){    
    /*   Http http = new Http();
        HttpRequest request = new HttpRequest();
        String Calloutname = 'callout:Sales_Territory_Sync_ERP_to_SF';
        request.setEndpoint(Calloutname);
        request.setMethod('POST');
        request.setHeader('x-api-key','2CwP0hhTx5Vy6iTuPFRQeflI5Sm4N6heQC5oYt6zpbuhb');    
        request.setHeader('Content-Length','0');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode()==200) {
            return response;
            
        } else {           
            System.debug('The status code returned was not expected: ' +  response.getStatusCode() + ' ' + response.getStatus()); 
            String errorMsg=  response.getStatusCode() + ' ' + response.getStatus(); 
            return response;
        }*/
       
          HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{ "dataOut": { "SalesTerritory": [ { "ErpID": "YMRD01-BRAZ1", "TerritoryID": "BRAZ1", "TerritoryDesc": "ManiUpdated Brazil 1: Lima" }, { "ErpID": "YMRD01-BRAZ2", "TerritoryID": "YMRD01", "TerritoryDesc": "ManiUpdated YMRD01" } ] } }');
        res.setStatusCode(200);
       return res;

    }}