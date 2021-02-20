public class ContactController {
    @AuraEnabled
    public static List<Contact> findById(String contactId){
        return [SELECT id, name, title, phone, mobilephone, Account.Name FROM Contact WHERE id = :contactId ];
    }
@AuraEnabled
    public static List<Contact> findAll(){
        return [SELECT id,name,phone FROM Contact Limit 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name='%'+searchKey+'%';
        return [SELECT id,name,phone FROM Contact where name LIKE :name Limit 50];
    }
    
    
}