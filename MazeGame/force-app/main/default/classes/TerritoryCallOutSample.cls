public class TerritoryCallOutSample {
    public static void makePostCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://epicapp-dev.ad.motoman.com/EpicorTest/api/v2/efx/YMRD01/SFIntTerritory/GetSalesTerritories');
        request.setMethod('POST');
        request.setHeader('x-api-key', '2CwP0hhTx5Vy6iTuPFRQeflI5Sm4N6heQC5oYt6zpbuhb');        
        request.setHeader('Content', 'application/json');         
        string username = 'SalesforceIntegration'; 
        string password = 'duU0m4Ns^[';
        Blob headerValue = Blob.valueOf(username + ':' + password);
        // Base 64 Encode the blob and prepend "Basic "
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        // Add the basic auth string to the Request Header
        request.setHeader('Authorization', authorizationHeader);            
        
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
       
    }  
}