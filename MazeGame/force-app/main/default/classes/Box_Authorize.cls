public class Box_Authorize {
    public string accessToken {set;get;}
    public string code {set;get;}
    public PageReference requestCode(){
        Map<String, Box__c> myBox=Box__c.getAll();
        Box__c b=myBox.get('Box');
        string url='https://account.box.com/api/oauth2/authorize?';
        url=url+'response_type=code&client_id='+b.clientId__c;
        url=url+'&redirect_uri='+b.redirectUrl__c+'&state=Manikanta';
        PageReference page1=new PageReference(url);
        return page1;           
        
    }
    public void requestToken(){
        System.debug('requestToken Executed ');
        code=ApexPages.currentPage().getParameters().get('code');
       Map<String, Box__c> myBox=Box__c.getAll();
        Box__c b=myBox.get('Box');
        string url='https://api.box.com/oauth2/token';
       	string body='grant_type=authorization_code';
        body=body+'&client_id='+b.clientId__c;
        body=body+'&client_secret='+b.clientSecret__c;
         body=body+'&code='+code;
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setMethod('POST');
        request.setBody(body);
        request.setEndpoint(url);
        HttpResponse response=p.send(request);
                System.debug('response code '+response.getStatus());

        String result=response.getBody();
        System.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!= null){
            if(jp.getText() == 'access_token'){
                jp.nextToken();
                accessToken=jp.getText();
                System.debug('accessToken : '+accessToken);
            }
        }
    }
    public void create(){
        String url='https://api.box.com/2.0/folders';
        string body='{"name":"Test","parent":{"id":"123270980064"}}';
        Http p=new Http();
        HttpRequest request=new HttpRequest();
		request.setEndpoint(url) ;
        request.setHeader('Authorization','Bearer '+accessToken);
        request.setBody(body);
        request.setMethod('POST');
        HttpResponse response=p.send(request);
        String result=response.getBody();
        System.debug('response code '+response.getStatus());
    }
}