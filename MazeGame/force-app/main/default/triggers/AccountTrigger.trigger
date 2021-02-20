trigger AccountTrigger on Account (Before Update) {

 List<Contact> contactList=new List<Contact>();
 For ( Account a : Trigger.New )
 {
 contactList=[Select ID,Description from Contact where Contact.Account.ID= :a.ID];
 for(Contact cnt:contactList)
 {
     cnt.Description ='Updated By Trigger';
 }
 update contactList;
  }
 System.debug('Account Trigger Count - '+Trigger.Size);

}