public class OrderSummary{
        @AuraEnabled
    public Decimal totalItems{get;set;}
        
        @AuraEnabled
        public Decimal orderTotal{get;set;}
 }