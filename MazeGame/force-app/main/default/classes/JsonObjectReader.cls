public class JsonObjectReader {
    public static void readJsonData()
    {
        //Sample Json
        String jsonResponse = '{"Account":[{"AccountNumber":"1","Name":"Test1","Type":"Prospect"},{"AccountNumber":"1","Name":"Test2","Type":"Other"}]}';
        set<String> ObjectAttributes=new set<String>();        
        set<String> ObjectNames=new set<String>();
        
        //Convert json data into Map format
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);
        System.debug('results: '+results);
        
        If(!results.isEmpty())
        {            
            //Get Object Names  
            ObjectNames=results.keyset();
            System.debug('ObjectNames: '+ObjectNames);
            If (ObjectNames.size() > 0){
                for (String objectName: ObjectNames){  
                    
                    List<Object> lstObjects = (List<Object>)results.get(objectName);                    
                    for (Object EachObject : lstObjects) {
                        // now get objects property and value in to a SingleObject.
                        Map<String, Object> eachObjectProperties = (Map<String, Object>)EachObject;
                        
                        System.debug('eachObjectProperties: '+ eachObjectProperties);
                        // now loop through  object  attributes.
                        for (String attributeName : eachObjectProperties.keyset()) {
                            ObjectAttributes.add(attributeName);
                            //    System.debug(attributeName + ' = ' +eachObjectProperties.get(attributeName));
                        }
                        
                    }
                    System.debug('Object Fields: '+ObjectAttributes);
                    //implementing dynamic SOQL query
                    String peopertiesList='';
                    for(String prop : ObjectAttributes ){
                        peopertiesList += prop+' ,' ;
                    }
                    peopertiesList= peopertiesList.removeEnd(',');
                    System.debug('peopertiesList : '+peopertiesList);
                    String query='SELECT '+peopertiesList+' FROM '+objectName +' LIMIT 2' ;
                    System.debug('query : '+query);
                    list<Object> records = Database.query(query);
                    System.debug('records : '+records);
                    
                }                 
            }
        }     
        
    }
    public static void readTerritoryJsonData()
    {
        set<string> ObjectAttributes=new set<string>();
        String jsonResponse2  ='{ "dataOut": { "SalesTerritory": [ { "ErpID": "YMRD01-BRAZ1", "TerritoryID": "BRAZ1", "TerritoryDesc": "Brazil 1: Lima" }, { "ErpID": "YMRD01-BRAZ2", "TerritoryID": "BRAZ2", "TerritoryDesc": "Brazil 2: Freitas" } ] } }';
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse2);
        System.debug('results: '+results);
        
        //Level 1 : will get dataOut
        set<String> level1Objects=new set<String>();        
        level1Objects=results.keyset();
        System.debug('ObjectNames: '+level1Objects);
        for (String EachObject : level1Objects) { 
            
            //Level 2 : will get SalesTerritory
            Map<String, Object> Level1ObjectData = (Map<String, Object>)results.get(EachObject);
            System.debug('Level1ObjectData: '+Level1ObjectData);
            set<String> Level2Objects=new set<String>();        
            Level2Objects=Level1ObjectData.keyset();
            System.debug('Level2Objects: '+Level2Objects);
            //Level 3 : will get Properties
            //
            for (String obj: Level2Objects){  
                
                List<Object> lstObjects = (List<Object>)Level1ObjectData.get(obj);                    
                for (Object Eachobj : lstObjects) {
                    // now get objects property and value in to a SingleObject.
                    Map<String, Object> eachObjectProperties = (Map<String, Object>)Eachobj;
                    
                    System.debug('eachObjectProperties: '+ eachObjectProperties);
                    // now loop through  object  attributes.
                    for (String attributeName : eachObjectProperties.keyset()) {
                        ObjectAttributes.add(attributeName);
                        //    System.debug(attributeName + ' = ' +eachObjectProperties.get(attributeName));
                    }
                    
                }               
                
            }
            System.debug('ObjectAttributes: '+ObjectAttributes);
            
        }
    }
}