public class JsonGenarator {
    public static void generator(){
        List<Account> acnts=[Select Id,Name from Account Limit 2];
        string output=Json.serialize(acnts);
        System.debug('output  '+output);
    }
    
    public static void generator2(){
        List<Account> accList=[Select Id,Name,AccountNumber,Industry from Account Limit 2];
        
        if(!accList.isEmpty()){
            JSONGenerator gen = JSON.createGenerator(false);
            gen.writeStartObject();     
            gen.writeFieldName('dataIn');
            gen.writeStartObject();
            gen.writeFieldName('Customer');
            gen.writeStartArray();
            for(Account acc :accList){
                gen.writeStartObject();
                gen.writeStringField('Id', acc.Id);
                gen.writeStringField('Name', acc.Name);
                if(acc.AccountNumber==null) 
                    gen.writeStringField('AccountNumber', '');
                else{
                    gen.writeStringField('AccountNumber', acc.AccountNumber);
                }
                if(acc.Industry==null) 
                    gen.writeStringField('Industry', '');                
                else{
                    gen.writeStringField('Industry', acc.Industry);                    
                }
                gen.writeStringField('Name', '');
                gen.writeEndObject();
            }
            gen.writeEndArray();
            gen.writeEndObject();
            gen.writeEndObject();            
            String jsonData = gen.getAsString();
            System.debug('jsonData-' + gen.getAsString());
        }
    }
}