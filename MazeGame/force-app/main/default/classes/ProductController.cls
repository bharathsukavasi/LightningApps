public with sharing class ProductController {
	@AuraEnabled
    public static List<Product__c> fetchProducts(){        
        List<Product__c> productList = [SELECT Id, Name, DisplayUrl__c, MSRP__c FROM Product__c];
        If(productList.size() > 0)
        	return productList;
        Else
            return Null;
    }
    
    @AuraEnabled
    public static List<Product__c> searchProducts(string productName){       
        string searchQuery = productName + '%';
        string query =  'SELECT Id, Name, DisplayUrl__c,MSRP__c FROM Product__c '+ 
            'WHERE Name LIKE :searchQuery';        
        List<Product__c> productList = Database.query(query);        
        If(productList.size() > 0)
        	return productList;
        Else
            return Null;
    }
}