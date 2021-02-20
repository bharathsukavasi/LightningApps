({
    handleShowModal: function(component, evt, helper) {
        
        component.find('overlayLib').showCustomModal({
            header: "Application Confirmation",
            body: 'This is Test',
            footer:'Footer',
            showCloseButton: true,
            cssClass: "mymodal",
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });
    },
    CreateNewComp: function(cmp, evt, helper) {

        $A.createComponent('lightning:button',
                           {
                               value:"Create New",
                               label: "Create Me",
                               onclick: cmp.getReference("c.handlePress")
                           },
                           function(newButton, status, errorMessage){
                               //Add the new button to the body array
                               alert("CreateComponent");
                               if (status === "SUCCESS") {
                                   var body = cmp.get("v.body");
                                   body.push(newButton);
                                   cmp.set("v.body", body);
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
    },
    
    handlePress : function(cmp) {
        // Find the button by the aura:id value
        alert("New Button Onclick fired");
        console.log("button: " + cmp.find("findableAuraId"));
        console.log("button pressed");
    }

/* var modalBody;
        //$A.createComponent("c:modalContent", {},
        //   function(content, status) {
               if (status === "SUCCESS") {
                   modalBody = content;
                   component.find('overlayLib').showCustomModal({
                       header: "Application Confirmation",
                       body: modalBody,
                       showCloseButton: true,
                       cssClass: "mymodal",
                       closeCallback: function() {
                           alert('You closed the alert!');
                       }
                   })
               }
           });*/

})