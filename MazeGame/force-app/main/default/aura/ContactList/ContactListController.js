({
	doInit : function(component, event, helper) {
        
        /* Step 1*/
		var action=component.get('c.getContactList');
        /* optional/* step2 */
        action.setParams({
            
        });
        /*Step 4*/
        action.setCallback(this, function(response){
            var responseValue=response.getReturnValue();
            component.set('v.contactList',responseValue)
        },'SUCCESS'),
        /*Step 3*/
        $A.enqueueAction(action);
	}
})