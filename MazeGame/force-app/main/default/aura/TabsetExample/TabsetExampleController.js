({
	back : function(component, event, helper) {
		var currentTab = component.get('v.selTabId');
        
        if(currentTab == 'tab2')
        {
            component.set('v.selTabId','tab1');
        }
	},
    next : function(component, event, helper) {
		var currentTab = component.get('v.selTabId');
        
        if(currentTab == 'tab1')
        {
            component.set('v.selTabId','tab2');
        }
	}
})