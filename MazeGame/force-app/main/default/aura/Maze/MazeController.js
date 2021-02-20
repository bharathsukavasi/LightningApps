({      
	loadNodes:function(component, event, helper){       
		
  		var nodeList = document.getElementById("nodeList");
    	nodeList.innerHTML = '';
        var rows=parseInt(component.find("rows").get("v.value"));
        var cols=parseInt(component.find("cols").get("v.value"));
        var divOpen;
        for(var i=0;i<rows;i++)
		{		
		var col_id="col_"+i;
		 divOpen = '<div aura:id="'+col_id+'" class="slds-grid slds-gutters">';
		for(var j=0;j<cols;j++)
		{
		var row_id="div_row_"+i+"_"+j;
		divOpen +='<div aura:id="'+row_id+'" id="'+row_id+'" data-id="'+row_id+'" class="slds-col custom-box needclick" ></div>'
		}
		divOpen += '</div>';            
  		nodeList.innerHTML += divOpen ;
		} 
        
                    component.set("v.EnableFindPath", true);
                    //component.set("v.EnableGenerateMaze", false);
        var addOnCLickEvent = component.get('c.addOnCLickEvent');
        $A.enqueueAction(addOnCLickEvent);
    },
    
 addOnCLickEvent:function(component, event, helper){
     var alldivs =  document.querySelectorAll(".needclick");
      for (let j = 0; j < alldivs.length; j++) {
  let divtag = alldivs[j];
  divtag.addEventListener('click', function() {
     $A.util.toggleClass(divtag, "disabledBox");
  });
}
 },

	
    FindPath:function(component,event,helper){
        
        component.set("v.exceedLimts", false); 
        component.set("v.noSolutions", false); 
       var mazeString = '';                
        var x = parseInt(component.find("rows").get("v.value"));
        var y = parseInt(component.find("cols").get("v.value"));
        var disabledCell = /disabledBox/;
        for(var i=0; i < x; i++)
        {
            for(var j = 0; j < y; j++)
            {                
                var divComponent = document.getElementById("div_row_"+ i + "_" + j);
    
                if(disabledCell.test(divComponent.className))
                    mazeString += 'X';
                else
                    mazeString += '1';
            }
            if(i == x)
            	mazeString += '';
            else
                mazeString += ',';
        }
        var x0 = parseInt(component.find("sX").get("v.value")) - 1;
        var y0 = parseInt(component.find("sY").get("v.value")) - 1;
        var xf = parseInt(component.find("eX").get("v.value")) - 1;
        var yf = parseInt(component.find("eY").get("v.value")) -1;
        
        
        if (x0 >x || y0 > y || xf > x || yf > y ||(x0==xf && y0== yf)) {
        component.set("v.exceedLimts", true); 
        }
        else
        {
        helper.GenerateMazeFromStringMaze(mazeString);
       	helper.FindShortestPath(component, x, y, x0, y0, xf, yf);  
        var RemoveHightlightedPath = component.get('c.RemoveHightlightedPath');
        $A.enqueueAction(RemoveHightlightedPath);         
        
        var HightlightedPath = component.get('c.HightlightedPath');
        $A.enqueueAction(HightlightedPath);
		}
        
    },
   HightlightedPath:function(component, event, helper)
    {   
    	var PathString = component.get("v.PathString");
                  
         if(PathString == ''  || PathString == null || PathString == undefined)
        {
            component.set("v.noSolutions", true);
		}
        else{
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
        
        var divSourceComponentId = "div_row_"+ startX + "_" + startY;
        var divSourceComponent = document.getElementById(divSourceComponentId);
        $A.util.addClass(divSourceComponent, 'sourceCell'); 
        //divSourceComponent.innerHTML = 'Source Point';
        
        var divDestinationComponentId = "div_row_"+ endX + "_" + endY;
        var divDestComponent = document.getElementById(divDestinationComponentId);
        $A.util.addClass(divDestComponent, 'destinationCell');
        //divDestComponent.innerHTML = 'DestinationPoint';
        

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
            }}
    }
    })