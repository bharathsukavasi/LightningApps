({
	InsertContact : function(component, event, helper) {
		var fname=component.get('v.fName');
        var lname=component.get('v.lName');
        var AcntId=event.getParam('accountID');
        var action=component.get('c.saveContact');
        action.setParams({"fname":fname,"lname":lname,"acntId":AcntId});
        action.setCallback(this,function(action){
            var state=action.getState();
            if(state==='SUCCESS'){
                var contactId=action.getReturnValue();
                alert("contact Saved"+contactId);
            }
            
        });
        $A.enqueueAction(action);
	}
})