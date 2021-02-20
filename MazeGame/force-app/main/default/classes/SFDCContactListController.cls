public class SFDCContactListController {

    @AuraEnabled
    
    public static List<Contact> getContactsList(){
        List<Contact> ContactList;
        ContactList= new List<Contact> ([Select Id, Name,FirstName,LastName, Email, Phone from Contact ]);
        return contactList;
    }
}