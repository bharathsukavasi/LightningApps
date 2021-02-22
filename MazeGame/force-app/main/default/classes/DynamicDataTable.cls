public class DynamicDataTable {
    public class ResultWrapper{
        @AuraEnabled
        public List<sobject> lstObject;
        
        @AuraEnabled
        public List<FieldsWrapper> lstFields;
        
        public ResultWrapper(List<sobject> lstObject,List<FieldsWrapper> lstFields){
            this.lstObject = lstObject;
            this.lstFields = lstFields;
        }
    }
    
    public class FieldsWrapper{
        @AuraEnabled
        public string fieldPath {get; set;}
         @AuraEnabled
        public string label {get; set;}
         @AuraEnabled
        public string type {get; set;}
        
        public FieldsWrapper(string fieldPath, string strLabel, string strType){
            this.fieldPath = fieldPath;
            this.label = strLabel;
            this.type = strType;
        }
    }
    
    @AuraEnabled
    public static ResultWrapper fetchSObject(string strObjectName, string strFieldSetName){
        set<string> setFieldsToQuery = new set<string>();
        List<FieldsWrapper> lstFieldsWrapper = new List<FieldsWrapper>();
        Map<string, string> fieldPathLabelMap = new Map<string, string>();
        
        for(schema.FieldSetMember fieldsetMemberObj: readFieldSet(strFieldSetName,strObjectName)){
            setFieldsToQuery.add(fieldsetMemberObj.getFieldPath().toLowerCase());
            fieldPathLabelMap.put(string.valueOf(fieldsetMemberObj.getType()), fieldsetMemberObj.getFieldPath());
            lstFieldsWrapper.add(
                new FieldsWrapper(
                    fieldsetMemberObj.getFieldPath(),
                    fieldsetMemberObj.getLabel(),
                    string.valueOf(fieldsetMemberObj.getType())
                )
            );
        }
        
        string queryString = 'SELECT Id, ';
        setFieldsToQuery.remove('Id');
        queryString += string.join(new List<string>(setFieldsToQuery), ',');
        queryString.removeEnd(',');
        queryString += ' FROM ' + strObjectName;
        
        List<sobject> lstsobject = Database.query(queryString);
        system.debug('sobject data:' + lstsobject);
        return new ResultWrapper(lstsobject, lstFieldsWrapper);
        
    }
    
    private static List<schema.FieldSetMember> readFieldSet(string fieldSetName, string objectName){
        
        Map<string, schema.SObjectType> GlobalDescribeMap = schema.getGlobalDescribe();
        schema.SObjectType sobjectTypeObj = GlobalDescribeMap.get(objectName);
        schema.DescribeSObjectResult describeSObjectResultObj = sobjectTypeObj.getDescribe();
        schema.FieldSet fieldSetObj = describeSObjectResultObj.FieldSets.getMap().get(fieldSetName);
        return fieldSetObj.getFields();
    }
}