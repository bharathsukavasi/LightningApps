({
	fetchAccountInfo : function(component, event, helper) {
		var recordId=component.get("v.recordId");
        if(recordId)
        helper.fetchAccountInfo(component, event, helper); 
	},
    editRecord : function(component, event, helper){
        var recordid=component.get("v.recordId");
       
        var editRecordEvent= $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId":recordid
        });
        editRecordEvent.fire();
    }
})