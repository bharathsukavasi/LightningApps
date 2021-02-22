({
	handleFormChange : function(component, event, helper) {
		var orderItem = component.get("v.orderItem");
        var quantityChange = component.getEvent("QuantityChange");       
        quantityChange.setParams({
            orderItem: orderItem
        });
        quantityChange.fire();
	}
})