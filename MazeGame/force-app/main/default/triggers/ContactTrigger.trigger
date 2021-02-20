trigger ContactTrigger on Contact (After update) {
For( Contact con:Trigger.New)
{
 System.debug('Contact Trigger acntID- '+con.AccountId);

List<Account> acntList= [Select Id,Description from Account where ID=:con.AccountId];
 System.debug('Contact Trigger acntList- '+acntList.Size());

for(Account acnt:acntList)
{
acnt.Description='Updated Description through Trigger';
}
update acntList;
 System.debug('Contact Trigger Count - '+Trigger.Size);
}
}