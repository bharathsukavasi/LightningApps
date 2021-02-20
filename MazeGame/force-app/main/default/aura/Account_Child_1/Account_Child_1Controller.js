({
	search : function(component, event, helper) {
		var phone=component.find("phone").get("v.value");
        var action=component.get("c.mysearch");
        action.setParams({"phone":phone});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
                var acctID=response.getReturnValue();
                var evnt=component.getEvent("accName");
                evnt.setParams({"accountID":acctID});
                evnt.fire();
            }
        });
        $A.enqueueAction(action);
	}
})