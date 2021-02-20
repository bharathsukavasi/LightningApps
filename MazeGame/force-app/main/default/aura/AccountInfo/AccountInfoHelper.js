({
    fetchAccountInfo : function(component, event, helper) {
        var recordId=component.get("v.recordId");
        var action=component.get("c.getAccountInfo");
        action.setParams({
            accountId:recordId
        });
        action.setCallback(this, function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                var result=response.getReturnValue();
                component.set("v.record",result);
            }
            else 
                alert(state);
        });
        $A.enqueueAction(action);
    }
})