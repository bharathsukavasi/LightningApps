public class ContactList {
@AuraEnabled
    public static List<contact> fetchContactList(){
        List<Contact> contactList=new List<Contact>([Select Id,name,Email,phone from Contact where Email != null]) ;
            return ContactList;
    }
}