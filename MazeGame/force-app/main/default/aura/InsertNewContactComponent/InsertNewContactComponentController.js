({
	addContact : function(component, event, helper) {
        console.log('Method called');
                    alert('Contact Insertd method');

		var Fname=component.get("v.firstName");
        var Lname=component.get("v.lastName");
        debugger;
        var action=component.get("c.createContact");
        action.setParams({
            "ParentAccountID":"0012v000038UFpJAAW",
            "FirstName":Fname,
            "LastName":Lname
        });
        action.setCallback(this,function(response){
                           var state=response.getState();
        if(state=="SUCCEESS")
        {
            alert('Contact Insertd successfull');
        }
            else
            {
                  alert('Contact Insertd Faild');
            }
          });
        $A.enqueueAction(action);
        

	}
})