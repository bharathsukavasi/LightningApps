({
	loadMaze : function(component, event, helper) {
        var nodeList = document.getElementById("nodeList");
    	nodeList.innerHTML = '';
		var rows = parseInt(component.find("rows").get("v.value"));
        var cols = parseInt(component.find("cols").get("v.value"));
        var mazeDiv;
        
        for(var i=0; i<rows; i++){
            var colId="col_"+i;
            mazeDiv = '<div aura:id="'+colId+'" id="'+ colId +'" class="slds-grid slds-gutters">';
            
            for(var j=0; j<cols; j++){
                var rowId = "div_row_" + i +"_" + j;
                mazeDiv += '<div aura:id="' + rowId + '" id="'+ rowId +'" class="slds-col customBox needclick"></div>';                
          }            
           mazeDiv += '</div>'; 
           nodeList.innerHTML += mazeDiv;
        }
        component.set("v.EnableFindPath", true);
        var addOnClickEvent = component.get('c.addOnClickEvent');
        $A.enqueueAction(addOnClickEvent);
	},
    addOnClickEvent: function(component, event, helper) {
        var allDivs = document.querySelectorAll(".needclick");
        for(var k=0; k<allDivs.length; k++){
            let divTag = allDivs[k];
            divTag.addEventListener('click', function() {
                $A.util.toggleClass(divTag,"disabledBox");
            });
        }
    },
    FindPath : function(component, event, helper) {
        var mazeString = '';
        var x = parseInt(component.find("rows").get("v.value"));
        var y = parseInt(component.find("cols").get("v.value"));
        
        for(var i=0; i<x; i++){
            for(var j=0; j <y; j++){
                var divCmp = document.getElementById("div_row_" + i + "_" + j);                
                mazeString += (divCmp.className.includes("disabledBox")) ? 'X' : '1';
            }
            mazeString += (i == x-1) ? '' : ',';
        }
        
        var sx = parseInt(component.find("sX").get("v.value")) - 1;
        var sy = parseInt(component.find("sY").get("v.value")) - 1;
        var ex = parseInt(component.find("eX").get("v.value")) - 1;
        var ey = parseInt(component.find("eY").get("v.value")) - 1;
        
        if (sx >x || sy > y || ex > x || ey > y ||(sx==ex && sy== ey)) {
            alert('Starting or Ending Points not with in the Limits');
        }
        else
        {
        helper.GenerateMazeFromStringMaze(mazeString);
       	helper.FindMazePath(component, x, y, sx, sy, ex, ey);  
        // when the user changes the co ordinates and clicks the find path remove the
        // highlighted cells        
        helper.RemoveHightlightedPath(component);
        helper.HightlightedPath(component);
		}
    },
    ClearHighLightedpath : function(component, event, helper){
        helper.RemoveHightlightedPath(component);
    }
    
    
})