trigger CustomerTrigger on APEX_Customer__c (after update) {
List<APEX_Invoice__c> InvoiceList=new List<APEX_Invoice__c>();
for(APEX_Customer__c objCustomer:Trigger.new){
if(objCustomer.APEX_Customer_Status__c=='Active' &&
 trigger.oldMap.get(objCustomer.id).APEX_Customer_Status__c !='Active'){
APEX_Invoice__c newInvoice=new APEX_Invoice__c();
newInvoice.APEX_Status__c='Pending';
newInvoice.APEX_Customer__c=objCustomer.id;
newInvoice.APEX_Description__c='Invoice created by Trigger';
InvoiceList.add(newInvoice);
}
}
insert InvoiceList;
}