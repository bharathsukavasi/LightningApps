({
	handleCompEvent : function(component, event, helper) {
		var searchParam=event.getParam('searchText');
        var action=component.get('c.searchBeers');
        action.setParams({
            searchParam :searchParam
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var responseValue=response.getReturnValue();
                component.set('v.beerList',responseValue)
                console.log('responseValue',responseValue);
            }
            else{
                console.log('Error Occured');

            }
        });
        $A.enqueueAction(action);
	}
})