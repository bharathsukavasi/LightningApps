({
	doHandleEvent : function(component, event, helper) {
		
        var CmpEvent=component.getEvent("regInChild");
        CmpEvent.setParams({
            storeMessage: component.get("v.textMessage")
        });
        CmpEvent.fire();
	}
})