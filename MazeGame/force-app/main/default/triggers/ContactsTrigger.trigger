trigger ContactsTrigger on Contact (After Insert,After Update ,After delete, After unDelete) {
set<ID> actIds = new set<ID>();

If(!trigger.isdelete)
{
for(contact con: Trigger.New){
actIds.add(con.accountId);
}
}
If(!trigger.isinsert && trigger.operationType<> TriggerOperation.AFTER_UNDELETE)
{

for(contact con: Trigger.old ){
actIds.add(con.accountId);
}
}

List<Account> actsToUpdate = New List<Account>();

for(AggregateResult ar: [Select AccountId actId, Count(Id) contactCount from contact where accountId in :actIds group by  accountId]){

Account a = new Account();
a.Id = (ID)ar.get('ActId');
a.TriggerContactCount__c = (Integer)ar.get('ContactCount');
actsToUpdate.add(a);
}

Update actsToUpdate;
 
 
}