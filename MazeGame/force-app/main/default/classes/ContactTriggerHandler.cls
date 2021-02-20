public class ContactTriggerHandler{

//After Insert
public void afterInsert(Map<Id,Contact> newMap){
	//account to Update
	Set<Id> accIds=new Set<Id>();
	//Iterate to get Account Ids
	for(Contact con : newMap.values()){
	//check contact have Account Id

	if(con.AccountId != null){
	//Adding Account Ids to the set<Id>
	accIds.add(con.AccountId);	
	}
	}
	//call update account actions
	if(accIds.size() > 0){
	THIS.updateAccounts(accIds);
	}
}

    
    public void afterDelete(Map<Id,Contact> oldMap){
	//account to Update
	Set<Id> accIds=new Set<Id>();
	//Iterate to get Account Ids
	for(Contact con : oldMap.values()){
	//check contact have Account Id

	if(con.AccountId != null){
	//Adding Account Ids to the set<Id>
	accIds.add(con.AccountId);	
	}
	}
	//call update account actions
	if(accIds.size() > 0){
	THIS.updateAccounts(accIds);
	}
}


//Account To be Updated
private void updateAccounts(Set<Id> accountids){

//getting account records based on AccountIds

List<Account> accList=[Select Id,Total_Contacts__c,(Select Id from Contacts) from Account where Id IN:accountids];

for (Account acc : accList){
acc.Total_Contacts__c=acc.Contacts.size();
}
if(accList.size() > 0){
update accList;
}


}


}