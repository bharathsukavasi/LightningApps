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
        var RemoveHightlightedPath = component.get('c.RemoveHightlightedPath');
        $A.enqueueAction(RemoveHightlightedPath);         
        
        var HightlightedPath = component.get('c.HightlightedPath');
        $A.enqueueAction(HightlightedPath);
		}
    },
    
    HightlightedPath:function(component, event, helper)
    { 
        var PathString = component.get("v.PathString");
           // If PathString is empty show error else highlight the start, end and
           //  the path cells       
         if(PathString == ''  || PathString == null || PathString == undefined)
        {            
            alert('No possible Path found.');
		}
        else{
            // Highlight the path cells with yellow color
        	var mazeSolutionArray = PathString.split(',');
            for(var i=0; i<mazeSolutionArray.length-1; i++)
            {
                var divComponentId = "div_row_"+ mazeSolutionArray[i];
                var divComponent = document.getElementById(divComponentId);
                $A.util.addClass(divComponent, 'highlightCell');            
            }              
            var startX = parseInt(component.find("sX").get("v.value")) - 1;
            var startY = parseInt(component.find("sY").get("v.value")) - 1;
            var endX = parseInt(component.find("eX").get("v.value")) - 1;
       	 	var endY = parseInt(component.find("eY").get("v.value")) -1; 
        	// Highlight the start cell with green color
            var divSourceComponentId = "div_row_"+ startX + "_" + startY;
            var divSourceComponent = document.getElementById(divSourceComponentId);
            $A.util.addClass(divSourceComponent, 'sourceCell'); 
            // Highlight the end cell with red color
            var divDestinationComponentId = "div_row_"+ endX + "_" + endY;
            var divDestComponent = document.getElementById(divDestinationComponentId);
            $A.util.addClass(divDestComponent, 'destinationCell');
    	}
    },
    RemoveHightlightedPath: function(component, event, helper){ 
        var rows=parseInt(component.find("rows").get("v.value"));
        var cols=parseInt(component.find("cols").get("v.value"));
        
        for(var i=0; i < rows; i++)
        {
            for(var j = 0; j < cols; j++)
            {                  
        		var divComponent = document.getElementById("div_row_"+ i + "_" + j);                     
                $A.util.removeClass(divComponent, 'highlightCell'); 
                $A.util.removeClass(divComponent, 'sourceCell');                 
                $A.util.removeClass(divComponent, 'destinationCell');
                divComponent.innerHTML ="";
            }
        }
    }
})