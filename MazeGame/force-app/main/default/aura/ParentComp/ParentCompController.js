({
	doHandlerFromChild : function(component, event, helper) {
		var valueFromEvent=event.getParam("storeMessage");
        component.set("v.parentMessage",valueFromEvent)
	}
})