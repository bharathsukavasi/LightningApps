trigger TotalContacts on Contact (after insert, after update) {
List<contact> contactsWithtest = New List<Contact>();
   set<Id> accountIds = new set<Id>();
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
             system.debug('After Insert');
            for(contact con: trigger.New){
                accountIds.add(con.AccountId);
                if(con.FirstName.contains('Test'))
                {
                    contactsWithtest.add(con);                    
                }
            }
            system.debug('contactsWithtest' + contactsWithtest.size());
            system.debug('accountIds' + accountIds.size());
            List<Account> accountList = [SELECT Id, Total_Contacts__c FROM Account WHERE Id in :accountIds ];
            List<Account> accountUpdate = New List<Account>();
            if(accountList.size() > 0){
                for(Account acc:accountList){
                    system.debug('Account Id'+ acc.Id);
                    acc.Total_Contacts__c = contactsWithtest.size();
                    accountUpdate.add(acc);
                }
                 update accountUpdate;
            }
            
        }
    }
}