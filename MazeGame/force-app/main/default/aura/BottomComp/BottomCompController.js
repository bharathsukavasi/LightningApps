({
	executeEvent : function(component, event, helper) {
		var cmpEvt=$A.get("e.c:CompEventforpropagation");
        cmpEvt.fire();
	}
})