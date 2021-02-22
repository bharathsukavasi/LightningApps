({
	handleClick : function(component, event, helper) {
        var productTileClick = $A.get("e.c:ProductTileClick");
        var product = component.get("v.product");
        var orderId = component.get("v.orderId");
        productTileClick.setParams({
            productId: product.Id,
            orderId: orderId
        });
        productTileClick.fire();
	}
})