({
	Invoke : function(component, event, helper) {
		var KeyName=component.get("v.SearchKey");
        var action=component.get("c.findAccount");
        action.setParams({"aName":KeyName});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=SUCCEESS){
                var acnt=response.getReturnValue();
                component.set("v.acc",acnt)
                var EvntName=$A.get("e.c:AccountInfoApplEvent");
                EvntName.setParams({"AcntID":acnt.Id});
                EvntName.fire();
            }
        })
	}
})