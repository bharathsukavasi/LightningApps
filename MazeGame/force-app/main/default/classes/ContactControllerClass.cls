public class ContactControllerClass {
    @AuraEnabled
public static account getAllContacts()
{
    list<sObject> ContactsData=[Select ID, Name ,(Select ID, FirstName, LastName, Email from Contacts) from Account where ID='0012v00002V2k85AAB'];
  System.debug(ContactsData);
    For (sObject Acnt:ContactsData)
    {
        Account acc=(Account)Acnt;
       
           System.debug( Json.serialize(acc.Contacts));
 
    }
    System.debug(ContactsData.size());
    return (Account)ContactsData[0];
}
    @AuraEnabled
    public static void testMethod2(){
    
        System.debug('testMethod Executed from Lightning');
    }
}