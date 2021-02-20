({
	getAccountList : function(component, event, helper) {
        var action=component.get("c.getAccounts");
        action.setCallback(this, function(response){
                           var state=response.getState();
        						if(state==="SUCCESS"){
            						var result=response.getReturnValue();
        							component.set("v.records",result);
    							}
            				else 
          						alert(state);
                           });
    			$A.enqueueAction(action);
	}
})