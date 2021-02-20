({
	gethelperContacts : function(component, event, helper) {
		var ConList=component.get("c.getRelatedContacts");
               ConList.setParams(
            {
                //recordId:"0012v00002V2k85AAB"
                recordId:component.get("v.recordId")
            }
        );
        ConList.setCallback(this,function(response){
            var state = response.getState();
			var Contacts=response.getReturnValue();
            console.log(Contacts.length);
//console.log("Method executed and State"+response.getReturnValue());
             if (state === "SUCCESS") {            
            component.set("v.ContactList",response.getReturnValue());
             component.set("v.data",response.getReturnValue());

             }
            else if (state === "ERROR") {
                var errors=response.getError();
                if(errors){
                     if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                }
            }            
        });
    $A.enqueueAction(ConList);
	}
    
})