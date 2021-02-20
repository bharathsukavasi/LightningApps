({
	getContactsDate : function(component, event, helper) {
		helper.gethelperContacts(component, event, helper);
	},
    itemsChange: function(component, event, helper) {
      component.set("v.recordId",component.get("v.AcntID"));
		helper.gethelperContacts(component, event, helper);
	},
    //id,name,firstname,lastname
       init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Contact ID', fieldName: 'id', type: 'text'},
            {label: 'Contact name', fieldName: 'name', type: 'text'},
            {label: 'First Name', fieldName: 'firstname', type: 'text'},
            {label: 'Last Name', fieldName: 'lastname', type: 'text'}
            
        ]); 
       }
})