trigger RoomTriggger on Room__c (Before Insert,After Insert, Before Update, After Update, Before Delete, After Delete, After Undelete){
RoomTriggerHandler handler=new RoomTriggerHandler();
//Insert Operation
If(Trigger.isInsert)
{
    If(Trigger.isbefore)
    {
    handler.onBeforeInsert(trigger.new);
    }
    
    else
    {
    handler.onAfterInsert(trigger.new,trigger.newMap);
    }
}
//Update Operation
Else If(Trigger.isUpdate)
        {
        If(trigger.isBefore){
           handler.onBeforeUpdate(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
           }
       Else{
       handler.onAfterUpdate(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        }        
}
//Delete Operation

Else If(Trigger.isDelete)
        {
        If(trigger.isBefore){
           handler.onBeforeDelete(trigger.old,trigger.oldMap);
           }
       Else{
       handler.onAfterDelete(trigger.old,trigger.oldMap);
        }        
}
Else 
{
System.debug('Undelete Fired');
       handler.onAfterUndelete(trigger.new,trigger.newMap);
             
}
}