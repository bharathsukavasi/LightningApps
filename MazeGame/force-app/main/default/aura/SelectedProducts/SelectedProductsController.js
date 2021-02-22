({
    handleInit: function(component, event, helper){
        console.log("Adter Update"+ component.get("v.recordId"));
                var OrderItemsAction = component.get("c.fetchOrderItems");
        OrderItemsAction.setParams({
            orderId:component.get("v.recordId")
        });
        OrderItemsAction.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.OrderItems",response.getReturnValue());
                helper.OrderSummary(component);
            }
        });
        $A.enqueueAction(OrderItemsAction);
    },    
    handleProductclick : function(component, event, helper) {
		var productId = event.getParam("productId");
        var orderId = event.getParam("orderId");
        var selectedProductIds = [];
        selectedProductIds.push(productId);
        //component.set("v.selectedProductId", selectedProductIds);		
        
        var OrderItemsAction = component.get("c.AddProductsToOrderItem");
        OrderItemsAction.setParams({
            productIds:selectedProductIds,
            orderId:orderId
        });
        OrderItemsAction.setCallback(this,function(response){
            var state = response.getState();            
            if(state == "SUCCESS")
            {                
               component.set("v.OrderItems",response.getReturnValue());
                helper.OrderSummary(component);
            }
        });
        $A.enqueueAction(OrderItemsAction);
	},
    handleQuantityChange : function(component, event, helper) {
        var changedOrderItem = event.getParam("orderItem");
        var updateOrderItemAction = component.get("c.updateOrderItem");
        updateOrderItemAction.setParams({
            orderItem:changedOrderItem
        });
        updateOrderItemAction.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.OrderItems",response.getReturnValue());
                helper.OrderSummary(component);
            }
        });
       $A.enqueueAction(updateOrderItemAction);
    }
    
    
})