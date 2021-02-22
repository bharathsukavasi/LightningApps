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
    }
})