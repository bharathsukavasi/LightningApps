({
	handleInit : function(component, event, helper) {
		var prodListAction = component.get("c.fetchProducts");        
        prodListAction.setCallback(this,function(response){
            var state = response.getState();
            
            if(state == "SUCCESS")
            {
                component.set("v.products",response.getReturnValue());
            }
        });
        $A.enqueueAction(prodListAction);
	},   
    
    handleSearchKeyChange: function(component, event, helper) {
		var prodListAction = component.get("c.searchProducts");
        var searchKeyHolder = component.get("v.searchKeyHolder");
        prodListAction.setParams({productName:searchKeyHolder});
        prodListAction.setCallback(this,function(response){
            var state = response.getState();
            
            if(state == "SUCCESS")
            {   
                component.set("v.products",response.getReturnValue());
            }
        });
        $A.enqueueAction(prodListAction);
	}
})