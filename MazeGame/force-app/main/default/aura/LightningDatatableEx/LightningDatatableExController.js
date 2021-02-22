({
	handleInit : function(component, event, helper) {
        component.set('v.fields',[
            {label:'Name', fieldName:'Name', type:'text'},
            {label:'Active', fieldName:'Active__c', type:'text'},
            {type: 'action',typeAttributes:{rowActions: [
                {label:'Show Details', name:'show details'},
                {label:'Delete', name:'delete'}
            ]}}
                                  ]);
        var action =  component.get('c.FetchAccounts');
        action.setParams({
            Name:'',
            property:'Name'
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set('v.object', response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
	},
    
    updateSelectedText : function(component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        
        switch(action.name){
            case 'show details':
                alert('Showing details: ' + JSON.stringify(row));
                break;
            case 'delete':
                var data = component.get('v.object');
                var objIndex = data.indexOf(row);
                data.splice(objIndex,1);
                component.set('v.object',data);
                break;
        }
    },
    handleNameChange : function(component, event, helper){
        var action =  component.get('c.FetchAccounts');
        action.setParams({
            Name:component.find('nameFilter').get('v.value'),
            property:component.get('v.property')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set('v.object', response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    },
    handleChange : function(component, event, helper){
        var property = event.getParam('value');
        component.set('v.property',property);
    }
})