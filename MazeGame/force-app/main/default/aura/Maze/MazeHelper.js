({
    maze: [],  
    
	
    GenerateMazeFromStringMaze: function (mazePath) {
        var i;
        var arr1 = mazePath.split(",");
        for (i = 0; i < arr1.length; i++) {
            this.maze[i]=arr1[i].split("");
        }
    },
    FindShortestPath:function(component, rows, cols, x0,y0,xf,yf){
        var rows=rows;
        var cols=cols;
        var x0=x0;
        var y0=y0;
        var xf=xf;
        var yf=yf;
        var x=1;
        var y=2;
        var matrix=this.maze;
        var s={x:x0,y:y0};
        var e={x:xf,y:yf};        
  		var PathString="";  
        var point=[];       
        var List = new Array(); 
        var visited= [[]];
        var parent=[[]];
        
        
        for(var k=0;k<rows;k++)
        {
            visited[k]=[];
            parent[k]=[];
            
        }
        
            for (var i = 0; i < rows; i++)
            {
                for (var j = 0; j < cols; j++)
                {
                    visited[i][j] = false;
                    parent[i][j] = null;
                }
                }
        var path=[];
        var q = [];
        q.push(s);
                    while (q.length != 0)
           {
                var curr=q.shift();
                 visited[curr.x][curr.y] = true;
                if (curr.x == e.x && curr.y == e.y)
                {
                    var currPath=[] ;
                    while (parent[curr.x][curr.y] != s)
                    {
                        var temp=curr.x;
                     curr.x = parent[curr.x][curr.y].x;
                     curr.y = parent[temp][curr.y].y;
                       
                    var point={};
                    point.x=curr.x;
                    point.y=curr.y;
                        currPath.push(point);
                       // Console.Write("({0}, {1}) ", curr.x, curr.y);
                    }
                    if (currPath.length < Number.MAX_SAFE_INTEGER)
                    {
                        path=[];
                        path.push(currPath);
                    }
                }
               if((curr.y + 1) >= 0)
               {
                if (curr.y + 1 < cols && matrix[curr.x][curr.y + 1] != 'X' && !visited[curr.x][curr.y + 1])
                {
                    var point={};
                    point.x=curr.x;
                    point.y=curr.y + 1;
                    q.push(point);
                    parent[curr.x][curr.y + 1] = curr;
                }
               }
               if((curr.y - 1) >= 0)
               {
                if (matrix[curr.x][curr.y - 1] != 'X' && !visited[curr.x][curr.y - 1])
                {
                    var point={};
                    point.x=curr.x;
                    point.y=curr.y-1;
                    q.push(point);
                    parent[curr.x][curr.y - 1] = curr;
                }
                   }
               if((curr.x - 1) >= 0 ){
                if (matrix[curr.x - 1][curr.y] != 'X' && !visited[curr.x - 1][curr.y])
                {
                    var point={};
                    point.x=curr.x - 1;
                    point.y=curr.y;
                    q.push(point);
                    parent[curr.x - 1][curr.y] = curr;
                }
                   }
               if((curr.x + 1) >= 0)
               {
                if (curr.x + 1 < rows && matrix[curr.x + 1][curr.y] != 'X' && !visited[curr.x + 1][curr.y])
                {
                    var point={};
                    point.x=curr.x + 1;
                    point.y=curr.y;
                    q.push(point);
                    parent[curr.x + 1][curr.y] = curr;
                }
               }
                }    
         
				for(var i=0;i<path.length;i++)
				{
				for(var j=0;j<path[i].length;j++)
				{
				PathString += path[i][j].x+"_"+path[i][j].y+",";
				}
				}        
     
        component.set("v.PathString", PathString); 
       
        
    }
})