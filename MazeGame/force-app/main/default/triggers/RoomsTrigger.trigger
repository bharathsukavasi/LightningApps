trigger RoomsTrigger on Room__c (After Insert,After Update,After Delete, After Undelete) {
Set<Id> HotelDs=new Set<Id>();
List<Hotel__c> UpdatedHotelList=New List<Hotel__c>();
If(!Trigger.isdelete){
//Load all IDs from New except deletion operation
for(Room__c VarRoom:Trigger.New){
HotelDs.Add(VarRoom.Hotel__c);
}}
If(!Trigger.isInsert && Trigger.operationType<>TriggerOperation.AFTER_update){
//Load all IDs from Old Map
for(Room__c VarRoom:Trigger.old){
HotelDs.Add(VarRoom.Hotel__c);
}}
If(HotelDs.size()>0){
for(AggregateResult ar : [Select Hotel__c HtlID,count(ID) roomsCount from Room__c where Hotel__c  in :HotelDs group by Hotel__c ]){
Hotel__c  UpdateHotel=New Hotel__c ();
UpdateHotel.Id=(ID)ar.get('HtlID');
UpdateHotel.TotalNoOfRooms__c=(Integer)ar.get('roomsCount');
UpdatedHotelList.Add(UpdateHotel);
}
update UpdatedHotelList;
}

}