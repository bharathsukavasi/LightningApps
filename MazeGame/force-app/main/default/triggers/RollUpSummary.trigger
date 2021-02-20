trigger RollUpSummary on Child__c (after insert,After update,After delete,After undelete) {
set<id> ParentIds=new set<id>();
List<Parent__c> ParentItems=new List<Parent__c>();

for(Child__c c:trigger.new){
ParentIds.add(c.ParentName__c);
}

if(Trigger.isDelete){
for(Child__c c:trigger.old){
ParentIds.add(c.ParentName__c);
}
}

Map<id,Parent__c> ParentMap=new Map<id,Parent__c>([select id,CHildCount__c from Parent__c where id in:ParentIds ]);


for(Parent__c p:[select Id,CHildCount__c,(select id from Childs__r) from Parent__c where id in:ParentIds]){

ParentMap.get(p.id).CHildCount__c =p.Childs__r.size();
ParentItems.add(ParentMap.get(p.id));
}
update ParentItems;
}