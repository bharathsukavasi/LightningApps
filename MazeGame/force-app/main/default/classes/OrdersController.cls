public with sharing class OrdersController {
	@AuraEnabled
    public static List<Order_Item__c> AddProductsToOrderItem(List<string> productIds, string orderId){
        system.debug('AddProductsToOrderItem: products-' + productIds + 'OrderId- ' +orderId);
        List<Order_Item__c> orderItems = New List<Order_Item__c>();
        List<Order_Item__c> orderItemExists = New List<Order_Item__c>();
        List<Order_Item__c> orderItemToUpdate = New List<Order_Item__c>();
        List<string> productsToBeAdded = New List<string>();
        
        // Check whether products exists in the order_Item
        orderItemExists = [SELECT Id,Quantity__c,Product__c 
                           FROM Order_item__c 
                           WHERE Product__c in :productIds AND Reseller_Order__c = :orderId];
        //If product exists update quantity of order_Item else create new order_Item        
        If(orderItemExists.size() > 0){
            for(Order_Item__c oi:orderItemExists){
                for(string prodId: productIds){
                    if((string)oi.Product__c == prodId){
                        oi.Quantity__c += 1;
                        orderItemToUpdate.Add(oi);
                    }
                    else{
                        productsToBeAdded.add(prodId);               
                    }
                }                
            }
            orderItems = addOrderItemsToList(productsToBeAdded, Id.valueOf(orderId));
        }
        Else{            
            // No product added in order_Item
				orderItems = addOrderItemsToList(productIds,Id.valueOf(orderId));
        }
        
        if(orderItemToUpdate.Size() > 0){
            Update orderItemToUpdate;
        }
        if(orderItems.Size() > 0){
            Insert orderItems;
        }
        orderItems.Clear();
        orderItems = [SELECT Id,Quantity__c,Price__c,Product__r.Name,Product__r.DisplayUrl__c,Product__r.MSRP__c,Reseller_Order__c 
                      FROM Order_item__c 
                      WHERE Reseller_Order__c = :orderId];
        return orderItems;
    }
    
    @AuraEnabled
    public static List<Order_Item__c> fetchOrderItems(string orderId){        
        List<Order_Item__c> orderItems = New List<Order_Item__c>();
        orderItems = [SELECT Id,Quantity__c,Price__c,Product__r.Name,Product__r.DisplayUrl__c,Product__r.MSRP__c,Reseller_Order__c 
                      FROM Order_item__c 
                      WHERE Reseller_Order__c = :orderId];
        system.debug('orderItems Init :'+ orderItems);
        return orderItems;
    }
    
    @AuraEnabled
    public static OrderSummary getOrderSummary(List<Order_Item__c> orderItems){
        Decimal orderTotal = 0.0;
        Decimal totalItems = 0.0;
        OrderSummary orderSummary = New OrderSummary();
        for(Order_Item__c orderItem: orderItems){
            if(orderItem.Quantity__c > 1)
            {
                orderTotal += (orderItem.Quantity__c * orderItem.Price__c);
            }
            else{
                orderTotal += orderItem.Price__c;
            }            
            totalItems += orderItem.Quantity__c;            
        }
        orderSummary.totalItems = totalItems;
        orderSummary.orderTotal = orderTotal;
        return orderSummary;
    }
	@AuraEnabled
    public static List<Order_Item__c> updateOrderItem(Order_Item__c orderItem){
        if(orderItem.Quantity__c == 0){
            Delete orderItem;
        }
        else{
            Update orderItem; 
        }
               
        List<Order_Item__c> orderItems = New List<Order_Item__c>();
        orderItems = [SELECT Id,Quantity__c,Price__c,Product__r.Name,Product__r.DisplayUrl__c,Product__r.MSRP__c,Reseller_Order__c 
                      FROM Order_item__c 
                      WHERE Reseller_Order__c = :orderItem.Reseller_Order__c];
        
        return orderItems;
    }
    
    public static List<Order_Item__c> addOrderItemsToList(List<string> productIds, Id orderId){
        List<Order_Item__c> orderItems = New List<Order_Item__c>();
        for(Product__c prod:[SELECT Id,Name,MSRP__c 
                                 FROM Product__c 
                                 WHERE Id in :productIds])
        	{
            	Order_Item__c orderItem = New Order_Item__c();
        		orderItem.Price__c = prod.MSRP__c;
            	orderItem.Product__c = prod.Id;
            	orderItem.Reseller_Order__c = orderId;
            	orderItem.Quantity__c = 1;
            	orderItems.Add(orderItem);
        	}
        return orderItems;
    }
    
}