({
	OrderSummary : function(component) {
		var orderItems = component.get("v.OrderItems");        
        var orderTotal;
        var totalItems;
       var orderSummaryAction = component.get("c.getOrderSummary");
        orderSummaryAction.setParams({
            orderItems:orderItems
        });
        orderSummaryAction.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var orderSummary = response.getReturnValue();               
        		component.set("v.orderSummary",orderSummary);
            }
        });
        $A.enqueueAction(orderSummaryAction);
	},
    initHelper: function(component){
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
    }
})