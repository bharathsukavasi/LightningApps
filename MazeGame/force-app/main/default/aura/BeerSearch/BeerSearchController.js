({
    doSearch : function(component, event, helper) {
        var componentEvent=component.getEvent('BeerEvent');
        var SearchParam=component.find('SearchInput').get('v.value');
        componentEvent.setParams({
            searchText : SearchParam
        });
        componentEvent.fire();
    }
})