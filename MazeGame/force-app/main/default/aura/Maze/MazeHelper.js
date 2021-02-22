({
    maze : [],
	GenerateMazeFromStringMaze : function(mazePath) {
		var arr1 = mazePath.split(",");
        for (var i = 0; i < arr1.length; i++) {
            this.maze[i]=arr1[i].split("");
        }
	},
    FindMazePath : function(component, rows, cols, sx,sy,ex,ey){
        var matrix = this.maze;
        var start = {x:sx,y:sy};
        var end = {x:ex,y:ey};
        var pathString = '';
        var point = {};
        var visited = [[]];
        var parent = [[]];
        var path = [];
        var queue = [];
        
        // Initialze the rows
        for(var k=0; k<rows; k++){
            visited[k] = [];
            parent[k] = [];
        }
        
        // Set default values to the visited and parent matrix
        for(var i=0; i<rows; i++){
            for(var j=0; j<cols; j++){
                visited[i][j] = false;
                parent[i][j] = null;
            }
        }
        queue.push(start);
        while(queue.length != 0){
            var currPath = [];
            var currCell = queue.shift();
            visited[currCell.x][currCell.y] = true;
            
            if(currCell.x == end.x && currCell.y == end.y){
                // Path values are added to currPath array from parent 
                while(parent[currCell.x][currCell.y] != start){
                    var temp = currCell.x;
                    currCell.x = parent[currCell.x][currCell.y].x;
                    currCell.y = parent[temp][currCell.y].y;
                    
                    point={};
                    point.x=currCell.x;
                    point.y=currCell.y;
                    currPath.push(point);
                }                
                if(currPath.length > 0){
                    path=[];
                    path.push(currPath);
                }
            }
            
            // Traverse right direction
            if(currCell.y + 1 >= 0){
                if(currCell.y + 1 < cols && matrix[currCell.x][currCell.y + 1] != 'X' && !visited[currCell.x][currCell.y + 1]){
                    point={};
                    point.x=currCell.x;
                    point.y=currCell.y + 1;
                    if(!queue.includes(point))
                    queue.push(point);                    
                    parent[currCell.x][currCell.y + 1] = currCell;
                }
            }
            
            // Traverse left direction
            if(currCell.y - 1 >= 0){
                if(matrix[currCell.x][currCell.y - 1] != 'X' && !visited[currCell.x][currCell.y - 1]){
                    point={};
                    point.x=currCell.x;
                    point.y=currCell.y - 1;
                    if(!queue.includes(point))
                    queue.push(point);                     
                    parent[currCell.x][currCell.y - 1] = currCell;
                }
            }
            
            // Traverse up direction
            if(currCell. x- 1 >= 0){
                if(matrix[currCell.x - 1][currCell.y] != 'X' && !visited[currCell.x - 1][currCell.y]){
                    point={};
                    point.x=currCell.x - 1;
                    point.y=currCell.y;
                    if(!queue.includes(point))
                    queue.push(point);                    
                    parent[currCell.x - 1][currCell.y] = currCell;
                }
            }
            
			// Traverse down direction
            if(currCell.x + 1 >= 0){
                if(currCell.x + 1 < rows && matrix[currCell.x + 1][currCell.y] != 'X' && !visited[currCell.x + 1][currCell.y]){
                    point={};
                    point.x=currCell.x + 1;
                    point.y=currCell.y;
                    if(!queue.includes(point))
                    queue.push(point);                  
                    parent[currCell.x + 1][currCell.y] = currCell;
                }
            }			
        }
        // Update PathString
        if(path.length > 0){
            for(var i=0;i<path.length;i++)
            {
                for(var j=0;j<path[i].length;j++)
                {
                    pathString += path[i][j].x+"_"+path[i][j].y+",";
                }
            }            
        }
        component.set("v.PathString", pathString);
    },
    HightlightedPath:function(component)
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
    RemoveHightlightedPath: function(component){ 
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