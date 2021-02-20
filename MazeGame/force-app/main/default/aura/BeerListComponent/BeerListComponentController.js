({
    showInfo : function(component, event, helper) {
        var eventSource=event.getSource();
        var beerObj=eventSource.get("v.name");
        component.set('v.beerId',beerObj)              
        
        
        $A.createComponent('c:BeerDetails',
                           {
                               "beerId":beerObj
                           },
                           function(beerDetails, status, errorMessage){
                               //Add the new button to the body array
                               if (status === "SUCCESS") {
                                   
                                   component.find('overlayLib').showCustomModal({
                                       header: "Beer Details",
                                       body: beerDetails ,
                                       footer:'Footer',
                                       showCloseButton: true,
                                       cssClass: "mymodal",
                                       closeCallback: function() {
                                       }
                                   });
                                   
                               }
                               else if (status === "INCOMPLETE") {
                                   console.log("No response from server or client is offline.")
                                   // Show offline error
                               }
                                   else if (status === "ERROR") {
                                       console.log("Error: " + errorMessage);
                                       // Show error message
                                   }
                           }
                          );
        
    }
})