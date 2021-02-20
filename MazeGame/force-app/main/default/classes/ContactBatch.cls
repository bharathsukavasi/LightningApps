global class ContactBatch implements Database.Batchable<sObject>  {

    global Database.QueryLocator start(Database.BatchableContext bc){
        String Query='Select id,Name,Fax,Email from Contact';
        return Database.getQueryLocator(Query);
        
    }
    global void execute(Database.BatchableContext bc,List<Contact> contactList){
        Integer size=contactList.size();
        for(Integer i=0;i<size;i++){
            Contact con=ContactList.get(i);
            if(con.Fax==null || con.Fax	 ==''){
                 con.Fax = con.Account.Fax;                
            }  
            
            if(con.MobilePhone==null || con.MobilePhone	 ==''){
                 con.MobilePhone = con.Account.Phone;                
            }  
            
        }    
        update contactList;
    }
    global void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
        email.setSubject('Status of BAtch Class: ContactBAtch');
        email.setSenderDisplayName('Mani Kanta');
        email.setHtmlBody('Dear USer BAtch Processed');
        List<String> EmailTo=new List<String>();
		EmailTo.add('manikantaraj999@gmail.com')  ;      
        email.setToAddresses(EmailTo);


Messaging.SingleEmailMessage[] emailList=new List<Messaging.SingleEmailMessage>();
emailList.add(email);   
        
        Messaging.sendEmail(emailList,false);
    }
}