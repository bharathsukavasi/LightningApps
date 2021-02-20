({
	SaveAccount : function(component, event, helper) {
		var name=component.find("aName").get("v.value");
        var rating=component.find("rating").get("v.value");
        var action=component.get("c.saveAccount");
        action.setParams({"name":name,"rating":rating});
        action.setCallback(this,function(action){
            var state=action.getState();
            if(state='SUCCESS'){
                var AccountId=action.getReturnValue();
              var event=component.getEvent("AcntInfo");
                event.setParams({"accountID":AccountId});
                event.fire();
                
            }
        });
        $A.enqueueAction(action);
	}
})