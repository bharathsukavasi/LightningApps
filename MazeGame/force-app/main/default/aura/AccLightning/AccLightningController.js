({
	handleSectionToggle : function(component, event, helper) {
		var openSections = event.getParam('openSections');

        if (openSections.length === 0) {
            component.set('v.activeSectionsMessage', "All sections are closed");
        } else {
            component.set('v.activeSectionsMessage', "Open sections: " + openSections.join(', '));
        }
	},
    handleExpand : function(component, event, helper) {
        var activesectionsList = ['A','B','C'];
        component.find("accordion").set("v.activeSectionName",activesectionsList);
    },
    handleCollapse : function(component, event, helper) {
        var activesectionsList = [];
        component.find("accordion").set("v.activeSectionName",activesectionsList);
    }
})