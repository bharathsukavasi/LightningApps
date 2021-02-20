public with sharing class LightningAccController {
@AuraEnabled
    public static list<contact> getRelatedContacts(Id recordId)
    {
        
        List<Contact> Conlist=[Select id,name,firstname,lastname from Contact where AccountId=:recordId];
        System.debug('Conlist Data'+Conlist);
        return Conlist;
    }
}