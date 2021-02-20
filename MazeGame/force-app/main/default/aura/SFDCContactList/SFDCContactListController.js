({
	doInit : function(component, event, helper) {
		var action= component.get('c.getContactsList');
        //  action.setParams({Name: ""});
        action.setCallback(this,function(response){
            var responseValue=response.getReturnValue();
            component.set('v.contactList',responseValue)
        },'SUCCESS');
        $A.enqueueAction(action,false);
	},
    doRedirect : function(component, event, helper) {
        var eventSource=event.getSource();
        var id=eventSource.get('v.name');
        var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": id,
      "slideDevName": "detail"
    });
    navEvt.fire();
    },
    createContact: function(component, event, helper) {
    var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Contact"
    });
    createRecordEvent.fire();
    }
})