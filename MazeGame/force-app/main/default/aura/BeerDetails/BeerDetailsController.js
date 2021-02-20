({
	CreateOrder : function(component, event, helper) {
        var PageReference=component.find("navigation")
		var pageReferenceNav = {
            type: 'standard__component',
            attributes: {
                "componentName":"c__CreateBeerOrder"
            },
            state: {
                "myAttr": "attrValue"
            }
        };
      PageReference.navigate(pageReferenceNav);
	}
})