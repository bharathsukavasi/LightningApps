({
	Invoke : function(component, event, helper) {
		var fname=component.find("fname").get("v.value");
        var lname=component.find("lname").get("v.value");
        var accountID=event.getParam("accountID");
        var action=component.get("c.conCreate");
        action.setParams({"fname":fname,"lname":lname,"AccountID":accountID});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state='SUCCESS'){
                alert(response.getReturnValue());
            }
            else{
                 alert(response.getReturnValue());
            }
            
        });
        
$A.enqueueAction(action);        
	}
})